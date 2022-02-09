/*
*********************************************************************************************************
*                                                AR100 SYSTEM
*                                     AR100 Software System Develop Kits
*                                                pmu module
*
*                                    (c) Copyright 2012-2016, Sunny China
*                                             All Rights Reserved
*
* File    : pmu.c
* By      : Sunny
* Version : v1.0
* Date    : 2012-5-22
* Descript: power management unit.
* Update  : date                auther      ver     notes
*           2012-5-22 13:33:03  Sunny       1.0     Create this file.
*********************************************************************************************************
*/


#include "pmu_i-sun8iw16.h"

#ifdef CFG_PMU_USED

extern struct arisc_para arisc_para;
extern struct ccu_reg_list *ccu_reg_addr;
extern struct notifier *wakeup_notify;

u32 axp_power_max;

static u32 pmu_exist = FALSE;
static u8 ic_version;

pmu_device axp_xxx = {
	.pmu_lock = 1,
};

/**
 * aw1699 voltages info table,
 * the index of table is voltage type.
 */
voltage_info_t aw1669_voltages_table[] = {
	/* dev_addr,                          reg_addr,                     min1_mV,  max1_mV,  step1_mV,  step1_num,  min2_mV,  max2_mV,  step2_mV,  step2_num,               mask */
	{RSB_RTSADDR_AW1669,    AW1669_DCDC1_VOL_CTRL,    1600,    3400,      100,      19,       3400,    3400,       0,      0,         0x1f},/* AW1669_POWER_DCDCA */
	{RSB_RTSADDR_AW1669,    AW1669_DCDC2_VOL_CTRL,     600,    1540,       20,      48,       1540,    1540,       0,      0,         0x3f},/* AW1669_POWER_DCDCB */
	{RSB_RTSADDR_AW1669,    AW1669_DCDC3_VOL_CTRL,     600,    1860,       20,      64,       1860,    1860,       0,      0,         0x3f},/* AW1669_POWER_DCDCC */
	{RSB_RTSADDR_AW1669,    AW1669_DCDC4_VOL_CTRL,     600,    1540,       20,      48,       1800,    2600,     100,      9,         0x3f},/* AW1669_POWER_DCDCD */
	{RSB_RTSADDR_AW1669,    AW1669_DCDC5_VOL_CTRL,    1000,    2550,       50,      32,       2550,    2550,       0,      0,         0x1f},/* AW1669_POWER_DCDCE */
	{RSB_RTSADDR_AW1669,                        0,       0,       0,        0,       0,          0,       0,       0,      0,            0},/* AW1669_POWER_RTC */
	{RSB_RTSADDR_AW1669,    AW1669_ALDO1_VOL_CTRL,     700,    3300,      100,      27,       3300,    3300,       0,      0,         0x1f},/* AW1669_POWER_ALDO1 */
	{RSB_RTSADDR_AW1669,    AW1669_ALDO2_VOL_CTRL,     700,    3300,      100,      27,       3300,    3300,       0,      0,         0x1f},/* AW1669_POWER_ALDO2 */
	{RSB_RTSADDR_AW1669,    AW1669_ALDO3_VOL_CTRL,     700,    3300,      100,      27,       3300,    3300,       0,      0,         0x1f},/* AW1669_POWER_ALDO3 */
	{RSB_RTSADDR_AW1669,    AW1669_DLDO1_VOL_CTRL,     700,    3300,      100,      27,       3400,    4200,     200,      4,         0x1f},/* AW1669_POWER_DLDO1 */
	{RSB_RTSADDR_AW1669,    AW1669_DLDO2_VOL_CTRL,     700,    3300,      100,      27,       3300,    3300,       0,      0,         0x1f},/* AW1669_POWER_DLDO2 */
	{RSB_RTSADDR_AW1669,    AW1669_ELDO1_VOL_CTRL,     700,    3300,      100,      27,       3300,    3300,       0,      0,         0x1f},/* AW1669_POWER_ELDO1 */
	{RSB_RTSADDR_AW1669,    AW1669_ELDO2_VOL_CTRL,     700,    3300,      100,      27,       3300,    3300,       0,      0,         0x1f},/* AW1669_POWER_ELDO2 */
	{RSB_RTSADDR_AW1669,    AW1669_ELDO3_VOL_CTRL,     700,    3300,      100,      27,       3300,    3300,       0,      0,         0x1f},/* AW1669_POWER_ELDO3 */
	{RSB_RTSADDR_AW1669,                        0,       0,       0,        0,       0,          0,       0,       0,      0,            0},/* AW1669_POWER_LDOIO1 */
	{RSB_RTSADDR_AW1669,                        0,       0,       0,        0,       0,          0,       0,       0,      0,            0},/* AW1669_POWER_ALDO1 */
	{RSB_RTSADDR_AW1669,                        0,       0,       0,        0,       0,          0,       0,       0,      0,            0},/* AW1669_POWER_SWOUT */
	{RSB_RTSADDR_AW1669,                        0,       0,       0,        0,       0,          0,       0,       0,      0,            0},/* AW1669_POWER_DC1SW */
	{RSB_RTSADDR_AW1669,    AW1669_DC5LDO_VOL_CTRL,    700,    1400,      100,       8,       1400,    1400,       0,      0,          0x7},/* AW1669_POWER_DC1SW */
	{RSB_RTSADDR_AW1669,       AW1669_INVALID_ADDR,      0,       0,        0,       0,          0,      0,       0,      0,         0x00},/* AW1669_POWER_MAX */
};

pmu_onoff_reg_bitmap_t aw1669_onoff_reg_bitmap[] = {
	/* dev_addr,                        reg_addr,                        offset,       state,     dvm_en */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL0,    1,       0,      0},/* AW1669_POWER_VOL_DCDC1 */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL0,    2,       0,      0},/* AW1669_POWER_VOL_DCDC2 */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL0,    3,       0,      0},/* AW1669_POWER_VOL_DCDC3 */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL0,    4,       0,      0},/* AW1669_POWER_VOL_DCDC4 */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL0,    5,       0,      0},/* AW1669_POWER_VOL_DCDC5 */
	{RSB_RTSADDR_AW1669,                          0,    0,       0,      0},/* AW1669_POWER_VOL_RTC */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL0,    6,       0,      0},/* AW1669_POWER_VOL_ALDO1 */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL0,    7,       0,      0},/* AW1669_POWER_VOL_ALDO2 */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL1,    5,       0,      0},/* AW1669_POWER_VOL_ALDO3 */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL1,    3,       0,      0},/* AW1669_POWER_VOL_DLDO1 */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL1,    4,       0,      0},/* AW1669_POWER_VOL_DLDO2 */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL1,    0,       0,      0},/* AW1669_POWER_VOL_ELDO1 */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL1,    1,       0,      0},/* AW1669_POWER_VOL_ELDO2 */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL1,    2,       0,      0},/* AW1669_POWER_VOL_ELDO3 */
	{RSB_RTSADDR_AW1669,                          0,    0,       0,      0},/* AW1669_POWER_VOL_LDOIO0 */
	{RSB_RTSADDR_AW1669,                          0,    0,       0,      0},/* AW1669_POWER_VOL_LDOIO1 */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL1,    7,       0,      0},/* AW1669_POWER_ONOFF_SWOUT */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL1,    6,       0,      0},/* AW1669_POWER_ONOFF_DC1SW */
	{RSB_RTSADDR_AW1669,    AW1669_OUTPUT_PWR_CTRL0,    0,       0,      0},/* AW1669_POWER_VOL_DC5LDO */
	{RSB_RTSADDR_AW1669,        AW1669_INVALID_ADDR,    0,       0,      0},/* AW1669_POWER_MAX */
};

/**
 * aw1699 specific function,
 * only called by pmu common function.
 */
static void aw1669_pmu_shutdown(void)
{
	u8 devaddr = RSB_RTSADDR_AW1669;
	u8 regaddr = AW1669_PWR_OFF_CTRL;
	u8 data;

	save_state_flag(REC_SHUTDOWN | 0x101);

	if (is_pmu_exist() == TRUE) {
		/* power off system */
		/* disable DCDC & LDO */
		LOG("shutdown\n");
		pmu_reg_read(&devaddr, &regaddr, &data, 1);
		data |= 1 << 7;
		pmu_reg_write(&devaddr, &regaddr, &data, 1);
	} else {
		;
	}
	LOG("poweroff system\n");
	while (1)
		;
}

static void aw1669_pmu_reset_system(void)
{
	u8 devaddr;
	u8 regaddr;
	u8 data;

	if (is_pmu_exist() == TRUE) {
		devaddr = RSB_RTSADDR_AW1669;
		regaddr = AW1669_PWR_WAKEUP_CTRL;
		pmu_reg_read(&devaddr, &regaddr, &data, 1);
		data |= 1U << 6;
		pmu_reg_write(&devaddr, &regaddr, &data, 1);
		LOG("reset system\n");
		while (1)
			;
	} else {
		;
	}
}

static void aw1669_pmu_reset(void)
{
	save_state_flag(REC_SHUTDOWN | 0x201);

	/* this maybe a bug */
	if (is_pmu_exist() != TRUE) {
		/* let system enter safe and low power state */
		/* pmu_sys_lowpcons(); */

		/* enable rtc gating, after that operation, cpus will can't access rtc registers */
		/* nop */

		aw1669_pmu_reset_system();
	} else {
		watchdog_reset();
	}
}

static u32 aw1669_pmu_output_is_stable(u32 type)
{
	u8 devaddr = aw1669_voltages_table[type].devaddr;
	u8 regaddr = aw1669_voltages_table[type].regaddr;
	u8 data = 0;

	pmu_reg_read(&devaddr, &regaddr, &data, 1);

	if (data & (0x1 << 7)) {
		return TRUE;
	} else {
		return FALSE;
	}
}

static s32 aw1669_pmu_set_voltage(u32 type, u32 voltage)
{
	u8 devaddr;
	u8 regaddr;
	u8 step, step_old;
	u8 ret = OK;
	u32 delay;
	voltage_info_t *pvoltage_info;

	/* invalid power voltage type */
	if (type > AW1669_POWER_MAX) {
		WRN("invalid power voltage type[%u]\n", type);
		return -EINVAL;
	}

	/* get voltage info by type */
	pvoltage_info = &(aw1669_voltages_table[type]);

	/* check voltage region valid or not */
	/* min1_mV < max1_mV <= min2_mV <= max2_mV */
	if ((voltage < pvoltage_info->min1_mV) ||
		(voltage > pvoltage_info->max2_mV)) {
		WRN("invalid voltage value[%u] to set, type[%u], the reasonable range[%u-%u]\n",
			voltage, type, pvoltage_info->min1_mV, pvoltage_info->max2_mV);
		return -EINVAL;
	}

	if (voltage <= pvoltage_info->max1_mV) {
		/* calc step value */
		step = ((voltage - pvoltage_info->min1_mV + pvoltage_info->step1_mV - 1) / (pvoltage_info->step1_mV)) & 0x7f;
	} else if ((voltage > pvoltage_info->max1_mV) && (voltage <= pvoltage_info->min2_mV)) {
		step = pvoltage_info->step1_num & 0x7f;
	} else {
		/* calc step value */
		step = ((voltage - pvoltage_info->min2_mV + pvoltage_info->step2_mV - 1) / (pvoltage_info->step2_mV) + pvoltage_info->step1_num) & 0x7f;
	}

	/* write voltage control register */
	devaddr = pvoltage_info->devaddr;
	regaddr = pvoltage_info->regaddr;
	step &= pvoltage_info->mask;
	ret |= pmu_reg_read(&devaddr, &regaddr, &step_old, 1);
	ret |= pmu_reg_write(&devaddr, &regaddr, &step, 1);

	if (aw1669_onoff_reg_bitmap[type].dvm_st) {
		/* delay = 16us * steps + 100us, step/15.625us, delay 100us for pmu hardware update */
		if (step >= step_old) {
			step -= step_old;
		} else {
			step = step_old - step;
		}
		delay = PMU_STEP_DELAY_US * step + 100;
		time_udelay(delay);
	}

	return ret;
}

static s32 aw1669_pmu_get_voltage(u32 type)
{
	u8 devaddr;
	u8 regaddr;
	u8 step = 0;
	voltage_info_t *pvoltage_info;

	if (type >= AW1669_POWER_MAX) {
		/* invalid power voltage type */
		WRN("invalid power voltage type[%u]\n", type);
	}
	/* get voltage info by type */
	pvoltage_info = &(aw1669_voltages_table[type]);

	/* read voltage control register */
	devaddr = pvoltage_info->devaddr;
	regaddr = pvoltage_info->regaddr;
	pmu_reg_read(&devaddr, &regaddr, &step, 1);

	step &= pvoltage_info->mask;

	if (step <= (pvoltage_info->step1_num - 1)) {
		return ((step * (pvoltage_info->step1_mV)) + pvoltage_info->min1_mV);
	} else if (step == pvoltage_info->step1_num) {
		return pvoltage_info->min2_mV;
	} else {
		return (((step - pvoltage_info->step1_num) * (pvoltage_info->step2_mV)) + pvoltage_info->min2_mV);
	}
}

static s32 aw1669_pmu_set_voltage_state(u32 type, u32 state)
{
	u8 devaddr;
	u8 regaddr;
	u8 data;
	u32 offset;

	if (type < AW1669_POWER_MAX) {
		devaddr = aw1669_onoff_reg_bitmap[type].devaddr;
		regaddr = aw1669_onoff_reg_bitmap[type].regaddr;
		offset  = aw1669_onoff_reg_bitmap[type].offset;
		aw1669_onoff_reg_bitmap[type].state = state;

		/* read-modify-write */
		pmu_reg_read(&devaddr, &regaddr, &data, 1);
		data &= (~(1 << offset));
		data |= (state << offset);
		pmu_reg_write(&devaddr, &regaddr, &data, 1);

		if (state == POWER_VOL_ON) {
			/* delay 1ms for open PMU output */
			time_mdelay(1);
		}
	}
	return OK;
}

static s32 aw1669_pmu_get_voltage_state(u32 type)
{
	u8 devaddr;
	u8 regaddr;
	u8 data;
	u32 offset;

	if (type < AW1669_POWER_MAX) {
		devaddr = aw1669_onoff_reg_bitmap[type].devaddr;
		regaddr = aw1669_onoff_reg_bitmap[type].regaddr;
		offset  = aw1669_onoff_reg_bitmap[type].offset;

		pmu_reg_read(&devaddr, &regaddr, &data, 1);
		if (data & (1 << offset)) {
			aw1669_onoff_reg_bitmap[type].state = POWER_VOL_ON;
			return POWER_VOL_ON;
		} else {
			aw1669_onoff_reg_bitmap[type].state = POWER_VOL_OFF;
			return POWER_VOL_OFF;
		}
	} else {
		return -EINVAL;
	}
}

static s32 aw1669_pmu_query_event(u32 *event)
{
	u8 devaddr[5];
	u8 regaddr[5];
	u8 status[5];

	if (is_pmu_exist() != TRUE)
		return OK;

	/* cfg rsb runtime slave address */
	devaddr[0] = RSB_RTSADDR_AW1669;
	devaddr[1] = RSB_RTSADDR_AW1669;
	devaddr[2] = RSB_RTSADDR_AW1669;
	devaddr[3] = RSB_RTSADDR_AW1669;
	devaddr[4] = RSB_RTSADDR_AW1669;

	/* query pmu wakeup events */
	regaddr[0] = AW1669_IRQ_STATUS1;
	regaddr[1] = AW1669_IRQ_STATUS2;
	regaddr[2] = AW1669_IRQ_STATUS3;
	regaddr[3] = AW1669_IRQ_STATUS4;
	regaddr[4] = AW1669_IRQ_STATUS5;
	pmu_reg_read(devaddr, regaddr, status, 5);

	/* query pmu wakeup events */
	INF("query pmu wakeup event\n");
	if ((status[0] & (0x1 << 2)) || (status[0] & (0x1 << 3))) {
		/**
		 * AW1669_IRQ_STATUS1,
		 * BIT2 : VBUS from high to low (USB plugin).
		 * BIT3 : VBUS from low to high (USB plugout).
		 */
		INF("vbus\n");
		*event |= CPUS_WAKEUP_USB;
	}
	if ((status[0] & (0x1 << 5)) || (status[0] & (0x1 << 6))) {
		/**
		 * AW1669_IRQ_STATUS1,
		 * BIT5 : ACIN from high to low (ACIN plugin).
		 * BIT6 : ACIN from low to high (ACIN plugout).
		 */
		INF("acin\n");
		*event |= CPUS_WAKEUP_AC;
	}
	if (status[1] & (0x1 << 2)) {
		/**
		 * AW1669_IRQ_STATUS2,
		 * BIT2 : battary is full/charge done.
		 */
		INF("battary full\n");
		*event |= CPUS_WAKEUP_FULLBATT;
	}
	if ((status[2] & (0x1 << 1)) || (status[2] & (0x1 << 3))) {
		/**
		 * AW1669_IRQ_STATUS3,
		 * BIT1 : battery temperature under the safe range IRQ.
		 * BIT3 : battery temperature over the safe range IRQ.
		 */
		INF("bat temp\n");
		*event |= CPUS_WAKEUP_BAT_TEMP;
	}
	if ((status[3] & (0x1 << 0)) || (status[3] & (0x1 << 1))) {
		/**
		 * AW1669_IRQ_STATUS4,
		 * BIT0 : level2 low battary,
		 * BIT1 : level1 low battary.
		 */
		INF("low battary\n");
		*event |= CPUS_WAKEUP_LOWBATT;
	}
	if (status[4] & (0x1 << 0x0)) {
		/**
		 * AW1669_IRQ_STATUS5,
		 * BIT0 : GPIO0 input edge.
		 */
		INF("GPIO0 input edge\n");
		*event |= CPUS_WAKEUP_GPIO;
	}
	if (status[4] & (0x1 << 0x1)) {
		/**
		 * AW1669_IRQ_STATUS5,
		 * BIT1 : GPIO1 input edge.
		 */
		INF("GPIO1 input edge\n");
		*event |= CPUS_WAKEUP_GPIO;
	}
	if (status[4] & (0x1 << 3)) {
		/**
		 * AW1669_IRQ_STATUS5,
		 * BIT3 : long key.
		 */
		INF("long key\n");
		*event |= CPUS_WAKEUP_LONG_KEY;
	}
	if (status[4] & (0x1 << 4)) {
		/**
		 * AW1669_IRQ_STATUS5,
		 * BIT4 : short key.
		 */
		INF("short key\n");
		*event |= CPUS_WAKEUP_SHORT_KEY;
	}
	if (status[4] & (0x1 << 0x5)) {
		/**
		 * AW1669_IRQ_STATUS5,
		 * BIT5 : POK negative.
		 */
		INF("POK negative\n");
		*event |= CPUS_WAKEUP_DESCEND;
	}
	if (status[4] & (0x1 << 6)) {
		/**
		 * AW1669_IRQ_STATUS5,
		 * BIT6 : POK postive.
		 */
		INF("POK postive\n");
		*event |= CPUS_WAKEUP_ASCEND;
	}
	INF("event:%x\n", *event);

	return OK;
}

static s32 aw1669_pmu_clear_pendings(void)
{
	u32 i;
	u8  devaddr[5];
	u8  regaddr[5];
	u8  data[5];
	u32 len = 5;

	if (is_pmu_exist() != TRUE)
		return OK;

	for (i = 0; i < len; i++) {
		devaddr[i] = RSB_RTSADDR_AW1669;
		regaddr[i] = AW1669_IRQ_STATUS1 + i;
		data[i] = 0xff;
	}
	return pmu_reg_write(devaddr, regaddr, data, len);
}

static s32 aw1669_pmu_chip_init(void)
{
	u8 devaddr = RSB_RTSADDR_AW1669;
	u8 regaddr;
	u8 data;

	/* enable AW1669 DCDC3 DVM */
	devaddr = RSB_RTSADDR_AW1669;
	regaddr = AW1669_DCDC23_DVM_CTRL;
	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data |= 1 << 3;
	pmu_reg_write(&devaddr, &regaddr, &data, 1);
	aw1669_onoff_reg_bitmap[AW1669_POWER_DCDC3].dvm_st = 1;

	aw1669_pmu_clear_pendings();

	return OK;
}

/**
 * axp2101 voltages info table,
 * the index of table is voltage type.
 */
voltage_info_t axp2101_voltages_table[] = {
	/* dev_addr,                          reg_addr,                     min1_mV,  max1_mV,  step1_mV,  step1_num,  min2_mV,  max2_mV,  step2_mV,  step2_num,               mask */
	{RSB_RTSADDR_AXP2101,    AXP2101_DCDC1_CFG,    1500,    3400,      100,      20,       3400,    3400,        0,      0,         0x1f},/* AXP2101_POWER_DCDC1 */
	{RSB_RTSADDR_AXP2101,    AXP2101_DCDC2_CFG,     500,    1200,       10,      71,       1220,    1540,       20,     17,         0x7f},/* AXP2101_POWER_DCDC2 */
	{RSB_RTSADDR_AXP2101,    AXP2101_DCDC3_CFG,     500,    1200,       10,      71,       1220,    1540,       20,     17,         0x7f},/* AXP2101_POWER_DCDC3 */
	{RSB_RTSADDR_AXP2101,    AXP2101_DCDC4_CFG,     500,    1200,       10,      71,       1220,    1840,       20,     32,         0x7f},/* AXP2101_POWER_DCDC4 */
	{RSB_RTSADDR_AXP2101,    AXP2101_DCDC5_CFG,    1400,    3700,      100,      24,       3700,    3700,        0,      0,         0x1f},/* AXP2101_POWER_DCDC5 */
	{RSB_RTSADDR_AXP2101,                    0,       0,       0,        0,       0,          0,       0,        0,      0,            0},/* AXP2101_POWER_RTC1 */
	{RSB_RTSADDR_AXP2101,    AXP2101_ALDO1_CFG,     500,    3500,      100,      31,       3500,    3500,        0,      0,         0x1f},/* AXP2101_POWER_ALDO1 */
	{RSB_RTSADDR_AXP2101,    AXP2101_ALDO2_CFG,     500,    3500,      100,      31,       3500,    3500,        0,      0,         0x1f},/* AXP2101_POWER_ALDO2 */
	{RSB_RTSADDR_AXP2101,    AXP2101_ALDO3_CFG,     500,    3500,      100,      31,       3500,    3500,        0,      0,         0x1f},/* AXP2101_POWER_ALDO3 */
	{RSB_RTSADDR_AXP2101,    AXP2101_ALDO4_CFG,     500,    3500,      100,      31,       3500,    3500,        0,      0,         0x1f},/* AXP2101_POWER_ALDO4 */
	{RSB_RTSADDR_AXP2101,    AXP2101_BLDO1_CFG,     500,    3500,      100,      31,       3500,    3500,        0,      0,         0x1f},/* AXP2101_POWER_BLDO1 */
	{RSB_RTSADDR_AXP2101,    AXP2101_BLDO2_CFG,     500,    3500,      100,      31,       3500,    3500,        0,      0,         0x1f},/* AXP2101_POWER_BLDO2 */
	{RSB_RTSADDR_AXP2101,    AXP2101_CPUSLD_CFG,    500,    1400,       50,      19,       1400,    1400,        0,      0,         0x1f},/* AXP2101_POWER_CPUSLDO */
	{RSB_RTSADDR_AXP2101,    AXP2101_DLDO1_CFG,     500,    3500,      100,      31,       3500,    3500,        0,      0,         0x1f},/* AXP2101_POWER_DLDO1 */
	{RSB_RTSADDR_AXP2101,    AXP2101_DLDO2_CFG,     500,    1400,      100,      10,       1400,    1400,        0,      0,         0x1f},/* AXP2101_POWER_DLDO2 */
	{RSB_RTSADDR_AXP2101,    AXP2101_INVALID_ADDR,    0,       0,        0,       0,          0,       0,        0,      0,         0x00},/* AXP2101_POWER_MAX */
};

pmu_onoff_reg_bitmap_t axp2101_onoff_reg_bitmap[] = {
	/* dev_addr,                        reg_addr,                        offset,       state,     dvm_en */
	{RSB_RTSADDR_AXP2101,    AXP2101_DCDC_CFG0,        0,       0,      0},/* AXP2101_POWER_VOL_DCDC1 */
	{RSB_RTSADDR_AXP2101,    AXP2101_DCDC_CFG0,        1,       0,      0},/* AXP2101_POWER_VOL_DCDC2 */
	{RSB_RTSADDR_AXP2101,    AXP2101_DCDC_CFG0,        2,       0,      0},/* AXP2101_POWER_VOL_DCDC3 */
	{RSB_RTSADDR_AXP2101,    AXP2101_DCDC_CFG0,        3,       0,      0},/* AXP2101_POWER_VOL_DCDC4 */
	{RSB_RTSADDR_AXP2101,    AXP2101_DCDC_CFG0,        4,       0,      0},/* AXP2101_POWER_VOL_DCDC5 */
	{RSB_RTSADDR_AXP2101,                    0,        0,       0,      0},/* AXP2101_POWER_VOL_RTC1 */
	{RSB_RTSADDR_AXP2101,    AXP2101_LDO_EN_CFG0,      0,       0,      0},/* AXP2101_POWER_VOL_ALDO1 */
	{RSB_RTSADDR_AXP2101,    AXP2101_LDO_EN_CFG0,      1,       0,      0},/* AXP2101_POWER_VOL_ALDO2 */
	{RSB_RTSADDR_AXP2101,    AXP2101_LDO_EN_CFG0,      2,       0,      0},/* AXP2101_POWER_VOL_ALDO3 */
	{RSB_RTSADDR_AXP2101,    AXP2101_LDO_EN_CFG0,      3,       0,      0},/* AXP2101_POWER_VOL_ALDO4 */
	{RSB_RTSADDR_AXP2101,    AXP2101_LDO_EN_CFG0,      4,       0,      0},/* AXP2101_POWER_VOL_BLDO1 */
	{RSB_RTSADDR_AXP2101,    AXP2101_LDO_EN_CFG0,      5,       0,      0},/* AXP2101_POWER_VOL_BLDO2 */
	{RSB_RTSADDR_AXP2101,    AXP2101_LDO_EN_CFG0,      6,       0,      0},/* AXP2101_POWER_VOL_CPUSLDO */
	{RSB_RTSADDR_AXP2101,    AXP2101_LDO_EN_CFG0,      7,       0,      0},/* AXP2101_POWER_VOL_DLDO1 */
	{RSB_RTSADDR_AXP2101,    AXP2101_LDO_EN_CFG1,      0,       0,      0},/* AXP2101_POWER_VOL_DLDO2 */
	{RSB_RTSADDR_AXP2101,    AXP2101_INVALID_ADDR,     0,       0,      0},/* AXP2101_POWER_MAX */
};

/**
 * axp2101 specific function,
 * only called by pmu common function.
 */
static void axp2101_pmu_shutdown(void)
{
	u8 devaddr = RSB_RTSADDR_AXP2101;
	u8 regaddr = AXP2101_COMM_CFG;
	u8 data;

	save_state_flag(REC_SHUTDOWN | 0x101);

	if (is_pmu_exist() == TRUE) {
		/* power off system */
		/* disable DCDC & LDO */
		LOG("shutdown\n");
		/**
		 * Refer to axp2101 spec, we should disable PWROK restart function
		 * before soft PWROFF.
		 */
		pmu_reg_read(&devaddr, &regaddr, &data, 1);
		data &= ~(1 << 3);
		data |= 1 << 0;
		pmu_reg_write(&devaddr, &regaddr, &data, 1);
	} else {
		;
	}
	LOG("poweroff system\n");
	while (1)
		;
}

static void axp2101_pmu_reset_system(void)
{
	u8 devaddr;
	u8 regaddr;
	u8 data;

	if (is_pmu_exist() == TRUE) {
		devaddr = RSB_RTSADDR_AXP2101;
		regaddr = AXP2101_COMM_CFG;
		pmu_reg_read(&devaddr, &regaddr, &data, 1);
		data |= 1U << 1;
		pmu_reg_write(&devaddr, &regaddr, &data, 1);
		LOG("reset system\n");
		while (1)
			;
	} else {
		;
	}
}

static void axp2101_pmu_reset(void)
{
	save_state_flag(REC_SHUTDOWN | 0x201);

	if (is_pmu_exist() == TRUE) {
		/* let system enter safe and low power state */
		/* pmu_sys_lowpcons(); */

		/* enable rtc gating, after that operation, cpus will can't access rtc registers */
		/* nop */

		axp2101_pmu_reset_system();
	} else {
		watchdog_reset();
	}
}

static u32 axp2101_pmu_output_is_stable(u32 type)
{
	return TRUE;
}

static s32 axp2101_pmu_set_voltage(u32 type, u32 voltage)
{
	u8 devaddr;
	u8 regaddr;
	u8 step, step_old;
	u8 ret = OK;
	u32 delay;
	voltage_info_t *pvoltage_info;

	/* invalid power voltage type */
	if (type > AXP2101_POWER_MAX) {
		WRN("invalid power voltage type[%u]\n", type);
		return -EINVAL;
	}

	/* get voltage info by type */
	pvoltage_info = &(axp2101_voltages_table[type]);

	/* check voltage region valid or not */
	/* min1_mV < max1_mV <= min2_mV <= max2_mV */
	if ((voltage < pvoltage_info->min1_mV) ||
		(voltage > pvoltage_info->max2_mV)) {
		WRN("invalid voltage value[%u] to set, type[%u], the reasonable range[%u-%u]\n",
			voltage, type, pvoltage_info->min1_mV, pvoltage_info->max2_mV);
		return -EINVAL;
	}

	if (voltage <= pvoltage_info->max1_mV) {
		/* calc step value */
		step = ((voltage - pvoltage_info->min1_mV + pvoltage_info->step1_mV - 1) / (pvoltage_info->step1_mV)) & 0x7f;
	} else if ((voltage > pvoltage_info->max1_mV) && (voltage <= pvoltage_info->min2_mV)) {
		step = pvoltage_info->step1_num & 0x7f;
	} else {
		/* calc step value */
		step = ((voltage - pvoltage_info->min2_mV + pvoltage_info->step2_mV - 1) / (pvoltage_info->step2_mV) + pvoltage_info->step1_num) & 0x7f;
	}

	/* write voltage control register */
	devaddr = pvoltage_info->devaddr;
	regaddr = pvoltage_info->regaddr;
	step &= pvoltage_info->mask;
	ret |= pmu_reg_read(&devaddr, &regaddr, &step_old, 1);
	ret |= pmu_reg_write(&devaddr, &regaddr, &step, 1);

	if (axp2101_onoff_reg_bitmap[type].dvm_st) {
		/* delay = 16us * steps + 100us, step/15.625us, delay 100us for pmu hardware update */
		if (step >= step_old) {
			step -= step_old;
		} else {
			step = step_old - step;
		}
		delay = PMU_STEP_DELAY_US * step + 100;
		time_udelay(delay);
	}

	return ret;
}

static s32 axp2101_pmu_get_voltage(u32 type)
{
	u8 devaddr;
	u8 regaddr;
	u8 step = 0;
	voltage_info_t *pvoltage_info;

	if (type >= AXP2101_POWER_MAX) {
		/* invalid power voltage type */
		WRN("invalid power voltage type[%u]\n", type);
	}
	/* get voltage info by type */
	pvoltage_info = &(axp2101_voltages_table[type]);

	/* read voltage control register */
	devaddr = pvoltage_info->devaddr;
	regaddr = pvoltage_info->regaddr;
	pmu_reg_read(&devaddr, &regaddr, &step, 1);

	step &= pvoltage_info->mask;

	if (step <= (pvoltage_info->step1_num - 1)) {
		return ((step * (pvoltage_info->step1_mV)) + pvoltage_info->min1_mV);
	} else if (step == pvoltage_info->step1_num) {
		return pvoltage_info->min2_mV;
	} else {
		return (((step - pvoltage_info->step1_num) * (pvoltage_info->step2_mV)) + pvoltage_info->min2_mV);
	}
}

static s32 axp2101_pmu_set_voltage_state(u32 type, u32 state)
{
	u8 devaddr;
	u8 regaddr;
	u8 data;
	u32 offset;

	if (type < AXP2101_POWER_MAX) {
		devaddr = axp2101_onoff_reg_bitmap[type].devaddr;
		regaddr = axp2101_onoff_reg_bitmap[type].regaddr;
		offset  = axp2101_onoff_reg_bitmap[type].offset;
		axp2101_onoff_reg_bitmap[type].state = state;

		/* read-modify-write */
		pmu_reg_read(&devaddr, &regaddr, &data, 1);
		data &= (~(1 << offset));
		data |= (state << offset);
		pmu_reg_write(&devaddr, &regaddr, &data, 1);

		if (state == POWER_VOL_ON) {
			/* delay 1ms for open PMU output */
			time_mdelay(1);
		}
	}
	return OK;

}

static s32 axp2101_pmu_get_voltage_state(u32 type)
{
	u8 devaddr;
	u8 regaddr;
	u8 data;
	u32 offset;

	if (type < AXP2101_POWER_MAX) {
		devaddr = axp2101_onoff_reg_bitmap[type].devaddr;
		regaddr = axp2101_onoff_reg_bitmap[type].regaddr;
		offset  = axp2101_onoff_reg_bitmap[type].offset;

		pmu_reg_read(&devaddr, &regaddr, &data, 1);
		if (data & (1 << offset)) {
			axp2101_onoff_reg_bitmap[type].state = POWER_VOL_ON;
			return POWER_VOL_ON;
		} else {
			axp2101_onoff_reg_bitmap[type].state = POWER_VOL_OFF;
			return POWER_VOL_OFF;
		}
	} else {
		return -EINVAL;
	}

}

static s32 axp2101_pmu_query_event(u32 *event)
{
	u8 devaddr[3];
	u8 regaddr[3];
	u8 status[3];

	if (is_pmu_exist() != TRUE)
		return OK;

	/* cfg rsb runtime slave address */
	devaddr[0] = RSB_RTSADDR_AXP2101;
	devaddr[1] = RSB_RTSADDR_AXP2101;
	devaddr[2] = RSB_RTSADDR_AXP2101;

	/* read pmu irq status registers */
	regaddr[0] = AXP2101_INTSTS1;
	regaddr[1] = AXP2101_INTSTS2;
	regaddr[2] = AXP2101_INTSTS3;

	pmu_reg_read(devaddr, regaddr, status, 3);

	/* query pmu wakeup events */
	INF("query pmu wakeup event\n");
	if ((status[1] & (0x1 << 6)) || (status[1] & (0x1 << 7))) {
		/**
		 * AXP2101_IRQ_STATUS2,
		 * BIT7 : VBUS from high to low (USB plugin).
		 * BIT6 : VBUS from low to high (USB plugout).
		 */
		INF("vbus\n");
		*event |= CPUS_WAKEUP_USB;
	}
	if (status[2] & (0x1 << 4)) {
		/**
		 * AXP2101_IRQ_STATUS3,
		 * BIT2 : battary is full/charge done.
		 */
		INF("battary full\n");
		*event |= CPUS_WAKEUP_FULLBATT;
	}
	if ((status[0] & (0x1 << 0)) || (status[0] & (0x1 << 1))
		|| (status[0] & (0x1 << 2)) || (status[0] & (0x1 << 3))) {
		/**
		 * AXP2101_IRQ_STATUS3,
		 * BIT0 : battery temperature under the safe range in work mode IRQ.
		 * BIT1 : battery temperature over the safe range in work mode IRQ.
		 * BIT2 : battery temperature under the safe range in charge mode IRQ.
		 * BIT3 : battery temperature over the safe range in charge mode IRQ.
		 */
		INF("bat temp\n");
		*event |= CPUS_WAKEUP_BAT_TEMP;
	}
	if (status[1] & (0x1 << 3)) {
		/**
		 * AXP2101_IRQ_STATUS2,
		 * BIT3 : short key.
		 */
		INF("short key\n");
		*event |= CPUS_WAKEUP_SHORT_KEY;
	}
	if (status[1] & (0x1 << 2)) {
		/**
		 * AXP2101_IRQ_STATUS2,
		 * BIT2 : long key.
		 */
		INF("long key\n");
		*event |= CPUS_WAKEUP_LONG_KEY;
	}
	if (status[1] & (0x1 << 1)) {
		/**
		 * AXP2101_IRQ_STATUS2,
		 * BIT1 : POK negative.
		 */
		INF("POK negative\n");
		*event |= CPUS_WAKEUP_DESCEND;
	}
	if (status[1] & (0x1 << 0)) {
		/**
		 * AXP2101_IRQ_STATUS2,
		 * BIT0 : POK postive.
		 */
		INF("POK postive\n");
		*event |= CPUS_WAKEUP_ASCEND;
	}
	INF("event:%x\n", *event);

	return OK;
}

static s32 axp2101_pmu_clear_pendings(void)
{
	u32 i;
	u8  devaddr[3];
	u8  regaddr[3];
	u8  data[3];
	u32 len = 3;

	if (is_pmu_exist() != TRUE)
		return OK;

	for (i = 0; i < len; i++) {
		devaddr[i] = RSB_RTSADDR_AXP2101;
		regaddr[i] = AXP2101_INTSTS1 + i;
		data[i] = 0xff;
	}
	return pmu_reg_write(devaddr, regaddr, data, len);
}

static s32 axp2101_pmu_chip_init(void)
{
	u8 devaddr = RSB_RTSADDR_AXP2101;
	u8 regaddr;
	u8 data;

	/* enable AXP2101 DCDC3 DVM */
	devaddr = RSB_RTSADDR_AXP2101;
	regaddr = AXP2101_DCDC3_CFG;
	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data |= 1 << 7;
	pmu_reg_write(&devaddr, &regaddr, &data, 1);
	axp2101_onoff_reg_bitmap[AXP2101_POWER_DCDC3].dvm_st = 1;

	axp2101_pmu_clear_pendings();

	return OK;
}

/**
 * pmu generic function,
 * called by external
 */
void pmu_shutdown(void)
{
	if (is_pmu_exist() == FALSE)
		return;

	switch (ic_version) {
	case AW1669_IC_VERSION:
		aw1669_pmu_shutdown();
		break;
	case AW2101_IC_VERSION:
	case AW2101_IC_VERSION_B:
		axp2101_pmu_shutdown();
		break;
	default:
		break;
	}
}

void pmu_reset_system(void)
{
	if (is_pmu_exist() == FALSE)
		return;

	switch (ic_version) {
	case AW1669_IC_VERSION:
		aw1669_pmu_reset_system();
		break;
	case AW2101_IC_VERSION:
	case AW2101_IC_VERSION_B:
		axp2101_pmu_reset_system();
		break;
	default:
		break;
	}
}

void pmu_reset(void)
{
	switch (ic_version) {
	case AW1669_IC_VERSION:
		aw1669_pmu_reset();
		break;
	case AW2101_IC_VERSION:
	case AW2101_IC_VERSION_B:
		axp2101_pmu_reset();
		break;
	default:
		break;
	}
}

u32 pmu_output_is_stable(u32 type)
{
	u32 ret = FALSE;

	if (is_pmu_exist() == FALSE)
		return FALSE;

	switch (ic_version) {
	case AW1669_IC_VERSION:
		ret = aw1669_pmu_output_is_stable(type);
		break;
	case AW2101_IC_VERSION:
	case AW2101_IC_VERSION_B:
		ret = axp2101_pmu_output_is_stable(type);
		break;
	default:
		break;
	}

	return ret;
}

s32 pmu_set_voltage(u32 type, u32 voltage)
{
	s32 ret = OK;

	if (is_pmu_exist() == FALSE)
		return -ENODEV;

	switch (ic_version) {
	case AW1669_IC_VERSION:
		ret = aw1669_pmu_set_voltage(type, voltage);
		break;
	case AW2101_IC_VERSION:
	case AW2101_IC_VERSION_B:
		ret = axp2101_pmu_set_voltage(type, voltage);
		break;
	default:
		break;
	}

	return ret;
}

s32 pmu_get_voltage(u32 type)
{
	s32 ret = OK;

	if (is_pmu_exist() == FALSE)
		return -ENODEV;

	switch (ic_version) {
	case AW1669_IC_VERSION:
		ret = aw1669_pmu_get_voltage(type);
		break;
	case AW2101_IC_VERSION:
	case AW2101_IC_VERSION_B:
		ret = axp2101_pmu_get_voltage(type);
		break;
	default:
		break;
	}

	return ret;
}

s32 pmu_set_voltage_state(u32 type, u32 state)
{
	s32 ret = OK;

	if (is_pmu_exist() == FALSE)
		return -ENODEV;

	switch (ic_version) {
	case AW1669_IC_VERSION:
		ret = aw1669_pmu_set_voltage_state(type, state);
		break;
	case AW2101_IC_VERSION:
	case AW2101_IC_VERSION_B:
		ret = axp2101_pmu_set_voltage_state(type, state);
		break;
	default:
		break;
	}

	return ret;
}

s32 pmu_get_voltage_state(u32 type)
{
	s32 ret = OK;

	if (is_pmu_exist() == FALSE)
		return -ENODEV;

	switch (ic_version) {
	case AW1669_IC_VERSION:
		ret = aw1669_pmu_get_voltage_state(type);
		break;
	case AW2101_IC_VERSION:
	case AW2101_IC_VERSION_B:
		ret = axp2101_pmu_get_voltage_state(type);
		break;
	default:
		break;
	}

	return ret;
}

s32 pmu_query_event(u32 *event)
{
	s32 ret = OK;

	if (is_pmu_exist() == FALSE)
		return OK;

	switch (ic_version) {
	case AW1669_IC_VERSION:
		ret = aw1669_pmu_query_event(event);
		break;
	case AW2101_IC_VERSION:
	case AW2101_IC_VERSION_B:
		ret = axp2101_pmu_query_event(event);
		break;
	default:
		break;
	}

	return ret;
}

s32 pmu_clear_pendings(void)
{
	s32 ret = OK;

	if (is_pmu_exist() == FALSE)
		return OK;

	switch (ic_version) {
	case AW1669_IC_VERSION:
		ret = aw1669_pmu_clear_pendings();
		break;
	case AW2101_IC_VERSION:
	case AW2101_IC_VERSION_B:
		ret = axp2101_pmu_clear_pendings();
		break;
	default:
		break;
	}

	return ret;
}

void pmu_chip_init(void)
{
	if (is_pmu_exist() == FALSE)
		return;

	switch (ic_version) {
	case AW1669_IC_VERSION:
		aw1669_pmu_chip_init();
		break;
	case AW2101_IC_VERSION_B:
	case AW2101_IC_VERSION:
		axp2101_pmu_chip_init();
		break;
	default:
		break;
	}
}

/**
 * pmu common function,
 * called by all pmu specific function
 */
s32 pmu_reg_write(u8 *devaddr, u8 *regaddr, u8 *data, u32 len)
{
	ASSERT(len <= AXP_TRANS_BYTE_MAX);

#if CFG_RSB_USED
	u8 i;
	s32 result = OK;
	u32 data_temp = 0;

	rsb_device *rsb_dev;
	rsb_paras_t rsb_block_paras;
	rsb_dev = query_rsb();

	for (i = 0; i < len; i++) {
		data_temp = *(data + i);

		rsb_block_paras.len      = 1;
		rsb_block_paras.datatype = RSB_DATA_TYPE_BYTE;
		rsb_block_paras.devaddr  = devaddr[i];
		rsb_block_paras.regaddr  = &regaddr[i];
		rsb_block_paras.data     = &data_temp;

		result |= rsb_write_block(rsb_dev, &rsb_block_paras);
	}
	return result;
#else
	return twi_write(regaddr, data, 1);
#endif
}


s32 pmu_reg_read(u8 *devaddr, u8 *regaddr, u8 *data, u32 len)
{
	ASSERT(len <= AXP_TRANS_BYTE_MAX);

#if CFG_RSB_USED
	u8 i;
	s32 result = OK;
	u32 data_temp = 0;

	rsb_device *rsb_dev;
	rsb_paras_t rsb_block_paras;
	rsb_dev = query_rsb();

	for (i = 0; i < len; i++) {
		rsb_block_paras.len      = 1;
		rsb_block_paras.datatype = RSB_DATA_TYPE_BYTE;
		rsb_block_paras.devaddr  = devaddr[i];
		rsb_block_paras.regaddr  = &regaddr[i];
		rsb_block_paras.data     = &data_temp;

		result |= rsb_read_block(rsb_dev, &rsb_block_paras);

		*(data + i) = (u8)(data_temp & 0xff);
	}
	return result;
#else
	return twi_read(regaddr, data, len);
#endif
}


s32 pmu_reg_write_para(pmu_paras_t *para)
{
	return pmu_reg_write(para->devaddr, para->regaddr, para->data, para->len);
}

s32 pmu_reg_read_para(pmu_paras_t *para)
{
	return pmu_reg_read(para->devaddr, para->regaddr, para->data, para->len);
}

void watchdog_reset(void)
{
	/* disable watchdog int */
	writel(0x0, R_WDOG_REG_BASE + 0x0);

	/* reset whole system */
	writel((0x1 | (0x1 << 8)), R_WDOG_REG_BASE + 0x14);

	/* set reset after 0.5s */
	writel((0 << 4), R_WDOG_REG_BASE + 0x18);
	mdelay(1);

	/* enable watchdog */
	writel((readl(R_WDOG_REG_BASE + 0x18) | 0x1), R_WDOG_REG_BASE + 0x18);
	while (1)
		;
}

int nmi_int_handler(void *parg __attribute__ ((__unused__)), u32 intno)
{
	u32 event = 0;

	/**
	 * NOTE: if pmu interrupt enabled,
	 * means allow power key to power on system
	 */
	pmu_query_event(&event);
	LOG("pmu event: 0x%x\n", event);

	notifier_notify(&wakeup_notify, CPUS_IRQ_MAPTO_CPUX(intno));

	pmu_clear_pendings();

	/* clear interrupt flag first */
	interrupt_clear_pending(axp_xxx.dev.irq_no);

	return TRUE;
}

/**
 * pmu driver function,
 * standard driver model of coco
 */
static int pmu_ioctl(u32 request, va_list args)
{
	s32 result = OK;
	u32 type = 0;

	switch (request) {
	case IOCTL_PMU_READ:
		break;
	case IOCTL_PMU_WRITE:
		break;
	case IOCTL_PMU_DISABLE_IRQ:
		interrupt_disable(axp_xxx.dev.irq_no);
		break;
	case IOCTL_PMU_ENABLE_IRQ:
		interrupt_enable(axp_xxx.dev.irq_no);
		break;
	case IOCTL_PMU_CLR_IRQ_STATUS:
		interrupt_clear_pending(axp_xxx.dev.irq_no);
		break;
	case IOCTL_PMU_SET_IRQ_TRIGGER:
		type = va_arg(args, unsigned int);
		interrupt_set_nmi_trigger(type);
		break;
	case IOCTL_PMU_RESET:
		pmu_reset();
		break;
	case IOCTL_PMU_SHUTDOWN:
		pmu_shutdown();
		break;
	default:
		break;
	}

	return result;
}

arisc_driver pmu_dri = {
	.iorequset = pmu_ioctl,
};

const struct pmu_ops arisc_pmu_ops = {
	.set_voltage = pmu_set_voltage,
	.get_voltage = pmu_get_voltage,
	.set_voltage_state = pmu_set_voltage_state,
	.reg_write = pmu_reg_write,
	.reg_read = pmu_reg_read,
	.reset = pmu_reset,
	.shutdown = pmu_shutdown,
};

s32 pmu_init(void)
{
	/* axp2101 and aw1669 has the same rsb address on sun8iw16 */
	u8 devaddr = RSB_RTSADDR_AW1669;
	u8 regaddr;
	u8 data;

	rsb_device *rsb_dev;

	axp_xxx.ops = &arisc_pmu_ops;
	axp_xxx.dev.dev_lock = 1;
	axp_xxx.dev.dev_id = PMU_DEVICE_ID;
	axp_xxx.dev.dri = &pmu_dri;
	axp_xxx.dev.irq_no = INTC_R_NMI_IRQ;
	list_add_tail(&axp_xxx.dev.list, &(dev_list));
	axp_xxx.dev.dev_lock = 0;

	rsb_dev = query_rsb();

	/* the same address for axp2101 and aw1669 */
	rsb_set_run_time_addr(rsb_dev, RSB_SADDR_AW1669, RSB_RTSADDR_AW1669);

	if (arisc_para.power_mode == POWER_MODE_AXP) {
		pmu_exist = TRUE;
		LOG("pmu is exist\n");

		/* check IC version, all pmu has the same register address 0x3 */
		devaddr = RSB_RTSADDR_AW1669;
		regaddr = AW1669_IC_NO_REG;
		pmu_reg_read(&devaddr, &regaddr, &data, 1);

		/* IC version consist of bit[7:6] and bit[4:0] */
		ic_version = ((data & 0xc0) >> 2) | (data & 0x0f);
		switch (ic_version) {
		case AW1669_IC_VERSION:
			axp_power_max = AW1669_POWER_MAX;
			LOG("AW1669 IC_NO_REG value = 0x%x\n", data);
			break;
		case AW2101_IC_VERSION:
		case AW2101_IC_VERSION_B:
			axp_power_max = AXP2101_POWER_MAX;
			LOG("AXP2101 IC_NO_REG value = 0x%x\n", data);
			break;
		default:
			WRN("unknown pmu IC_NO_REG value = 0x%x\n", data);
			break;
		}
	} else {
		pmu_exist = FALSE;
		LOG("pmu is not exist\n");
		return OK;
	}

	pmu_chip_init();

	interrupt_clear_pending(axp_xxx.dev.irq_no);

	return OK;
}

s32 pmu_exit(void)
{
	return OK;
}

u32 is_pmu_exist(void)
{
	return pmu_exist;
}
#endif /* PMU_USED */

