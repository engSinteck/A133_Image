/*
 *  drivers/arisc/interfaces/arisc_rsb.c
 *
 * Copyright (c) 2013 Allwinner.
 * 2013-07-01 Written by superm (superm@allwinnertech.com).
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

#include "../arisc_i.h"

/*
 * used for indicate aduio codec been initialized,
 * modules like audio & trc mabye initialize,
 * but audio codec only can be initialize once
 */
static int audio_codec_init;

/**
 * rsb read block data.
 * @cfg:    point of arisc_rsb_block_cfg struct;
 *
 * return: result, 0 - read register successed,
 *                !0 - read register failed or the len more then max len;
 */
int arisc_rsb_read_block_data(struct arisc_rsb_block_cfg *cfg)
{
	int i;
	int result;
	volatile u32 paras[22];

	if ((cfg == NULL) || (cfg->devaddr == 0) || (cfg->regaddr == NULL) || (cfg->data == NULL) || (cfg->len > RSB_TRANS_BYTE_MAX) ||
		((cfg->datatype !=  RSB_DATA_TYPE_BYTE) && (cfg->datatype !=  RSB_DATA_TYPE_HWORD) && (cfg->datatype !=  RSB_DATA_TYPE_WORD)) ||
		((cfg->msgattr !=  ARISC_MESSAGE_ATTR_HARDSYN) && (cfg->msgattr !=  ARISC_MESSAGE_ATTR_SOFTSYN))) {
		pr_warn("rsb read reg paras error\n");
		return -EINVAL;
	}

	/*
	 * package address and data to message->paras,
	 * message->paras data layout:
	 * |para[0]       |para[1]|para[2]   |para[3]|para[4]|para[5]|para[6]|
	 * |(len|datatype)|devaddr|regaddr0~3|data0  |data1  |data2  |data3  |
	 */
	paras[0] = 0;
	paras[1] = 0;
	paras[2] = 0;
	paras[3] = 0;
	paras[5] = 0;
	paras[6] = 0;
	paras[0] = ((cfg->len & 0xffff) | ((cfg->datatype << 16) & 0xffff0000));
	paras[1] = cfg->devaddr;

	for (i = 0; i < cfg->len; i++) {
			/* pack 8bit regaddr0~regaddr3 into 32bit paras[1] */
			paras[2] |= (cfg->regaddr[i] << (i * 8));
	}

	/* FIXME: if the runtime sever enable the mmu & dcache,
	 * should not use flush cache here.
	 */
	/* send message use hwmsgbox */
	result = invoke_scp_fn_smc(ARM_SVC_ARISC_RSB_READ_BLOCK_DATA, virt_to_phys(paras), 0, 0);

	/* copy message readout data to user data buffer */
	for (i = 0; i < cfg->len; i++) {
			cfg->data[i] = paras[3 + i];
	}

	return result;
}
EXPORT_SYMBOL(arisc_rsb_read_block_data);


/**
 * rsb write block data.
 * @cfg:    point of arisc_rsb_block_cfg struct;
 *
 * return: result, 0 - write register successed,
 *                !0 - write register failedor the len more then max len;
 */
int arisc_rsb_write_block_data(struct arisc_rsb_block_cfg *cfg)
{
	int i;
	int result;
	volatile u32 paras[22];

	if ((cfg == NULL) || (cfg->devaddr == 0) || (cfg->regaddr == NULL) || (cfg->data == NULL) || (cfg->len > RSB_TRANS_BYTE_MAX) ||
		((cfg->datatype !=  RSB_DATA_TYPE_BYTE) && (cfg->datatype !=  RSB_DATA_TYPE_HWORD) && (cfg->datatype !=  RSB_DATA_TYPE_WORD)) ||
		((cfg->msgattr !=  ARISC_MESSAGE_ATTR_HARDSYN) && (cfg->msgattr !=  ARISC_MESSAGE_ATTR_SOFTSYN))) {
		pr_warn("rsb write reg paras error\n");
		return -EINVAL;
	}

	/*
	 * package address and data to message->paras,
	 * message->paras data layout:
	 * |para[0]       |para[1]|para[2]   |para[3]|para[4]|para[5]|para[6]|
	 * |(len|datatype)|devaddr|regaddr0~3|data0  |data1  |data2  |data3  |
	 */
	paras[0] = 0;
	paras[1] = 0;
	paras[2] = 0;
	paras[3] = 0;
	paras[5] = 0;
	paras[6] = 0;
	paras[0] = ((cfg->len & 0xffff) | ((cfg->datatype << 16) & 0xffff0000));
	paras[1] = cfg->devaddr;

	for (i = 0; i < cfg->len; i++) {
			/* pack 8bit regaddr0~regaddr3 into 32bit paras[1] */
			paras[2] |= (cfg->regaddr[i] << (i * 8));

			/* pack 32bit data0~data3 into 32bit paras[2]~paras[5] */
			paras[3 + i] = cfg->data[i];
	}

	/* FIXME: if the runtime sever enable the mmu & dcache,
	 * should not use flush cache here.
	 */
	/* send message use hwmsgbox */
	result = invoke_scp_fn_smc(ARM_SVC_ARISC_RSB_WRITE_BLOCK_DATA, virt_to_phys(paras), 0, 0);

	return result;
}
EXPORT_SYMBOL(arisc_rsb_write_block_data);

/**
 * rsb bits operation sync.
 * @cfg:    point of arisc_rsb_bits_cfg struct;
 *
 * return: result, 0 - bits operation successed,
 *                !0 - bits operation failed, or the len more then max len;
 *
 * rsb clear bits internal:
 * data = rsb_read(regaddr);
 * data = data & (~mask);
 * rsb_write(regaddr, data);
 *
 * rsb set bits internal:
 * data = rsb_read(addr);
 * data = data | mask;
 * rsb_write(addr, data);
 *
 */
int rsb_bits_ops_sync(struct arisc_rsb_bits_cfg *cfg)
{
	int i;
	int result;
	volatile u32 paras[22];

	if ((cfg == NULL) || (cfg->devaddr == 0) || (cfg->regaddr == NULL) || (cfg->mask == NULL) || (cfg->delay == NULL) || (cfg->len > RSB_TRANS_BYTE_MAX) ||
		((cfg->datatype !=  RSB_DATA_TYPE_BYTE) && (cfg->datatype !=  RSB_DATA_TYPE_HWORD) && (cfg->datatype !=  RSB_DATA_TYPE_WORD)) ||
		((cfg->msgattr !=  ARISC_MESSAGE_ATTR_HARDSYN) && (cfg->msgattr !=  ARISC_MESSAGE_ATTR_SOFTSYN))) {
		pr_warn("rsb clear bits sync paras error\n");
		return -EINVAL;
	}

	/*
	 * package address and data to message->paras,
	 * message->paras data layout:
	 * |para[0]       |para[1]|para[2]   |para[3]|para[4]|para[5]|para[6]|para[7] |para[8]|
	 * |(len|datatype)|devaddr|regaddr0~3|mask0  |mask1  |mask2  |mask3  |delay0~3|ops    |
	 */
	paras[0] = 0;
	paras[1] = 0;
	paras[2] = 0;
	paras[3] = 0;
	paras[4] = 0;
	paras[5] = 0;
	paras[6] = 0;
	paras[7] = 0;
	paras[8] = 0;
	paras[0] = ((cfg->len & 0xffff) | ((cfg->datatype << 16) & 0xffff0000));
	paras[1] = cfg->devaddr;
	paras[8] = cfg->ops;

	for (i = 0; i < cfg->len; i++) {
			/* pack 8bit regaddr0~regaddr3 into 32bit paras[1] */
			paras[2] |= (cfg->regaddr[i] << (i * 8));

			/* pack 32bit mask0~mask3 into 32bit paras[2] */
			paras[3 + i] = cfg->mask[i];

			/* pack 8bit delay0~delay3 into 32bit paras[6] */
			paras[7] |= (cfg->delay[i] << (i * 8));
	}

	/* FIXME: if the runtime sever enable the mmu & dcache,
	 * should not use flush cache here.
	 */
	/* send message use hwmsgbox */
	result = invoke_scp_fn_smc(ARM_SVC_ARISC_RSB_BITS_OPS_SYNC, virt_to_phys(paras), 0, 0);

	return result;
}
EXPORT_SYMBOL(rsb_bits_ops_sync);

/**
 * rsb set interface mode.
 * @devaddr:  rsb slave device address;
 * @regaddr:  register address of rsb slave device;
 * @data:     data which to init rsb slave device interface mode;
 *
 * return: result, 0 - set interface mode successed,
 *                !0 - set interface mode failed;
 */
int arisc_rsb_set_interface_mode(u32 devaddr, u32 regaddr, u32 data)
{
	int result;

	/* send message use hwmsgbox */
	result = invoke_scp_fn_smc(ARM_SVC_ARISC_RSB_SET_INTERFACE_MODE,
		devaddr, regaddr, data);

	return result;
}
EXPORT_SYMBOL(arisc_rsb_set_interface_mode);

/**
 * rsb set runtime slave address.
 * @devaddr:  rsb slave device address;
 * @rtsaddr:  rsb slave device's runtime slave address;
 *
 * return: result, 0 - set rsb runtime address successed,
 *                !0 - set rsb runtime address failed;
 */
int arisc_rsb_set_rtsaddr(u32 devaddr, u32 rtsaddr)
{
	int result;

	/* check audio codec has been initialized */
	if (devaddr == RSB_DEVICE_SADDR7) {
		if (audio_codec_init)
			return 0;
		else
			audio_codec_init = 1;
	}

	printk("%s-%u: devaddr:%x, rtsaddr:%x\n", __func__, __LINE__, devaddr, rtsaddr);

	/* send message use hwmsgbox */
	result = invoke_scp_fn_smc(ARM_SVC_ARISC_RSB_SET_RTSADDR,
		devaddr, rtsaddr, 0);

	return result;
}
EXPORT_SYMBOL(arisc_rsb_set_rtsaddr);
