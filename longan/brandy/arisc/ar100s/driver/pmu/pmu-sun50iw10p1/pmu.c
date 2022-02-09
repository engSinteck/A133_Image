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


#include "pmu_i.h"

#define RSB_INVALID_RTSADDR (0)

#define WATCHDOG_KEYFIELD (0x16aa << 16)

#define SUNXI_CHARGING_FLAG (0x61)

extern struct arisc_para arisc_para;
extern struct notifier *wakeup_notify;

void watchdog_reset(void);

u32 axp_power_max;

static u32 pmu_exist = FALSE;
static u8 ic_version;

static u8 pmu_id_match_tlb[][3] = {
	/* dev_addr, chip_id, power_max */
	{RSB_RTSADDR_AW1660, AW1660_IC_VERSION, AXP1660_POWER_MAX},
	{RSB_RTSADDR_AW1736, AW1736_IC_VERSION, AW1736_POWER_MAX},
	{RSB_RTSADDR_AXP2202, AXP2202_IC_VERSION, AXP2202_POWER_MAX},
	{RSB_RTSADDR_AW1657, AW1657_IC_VERSION, AW1657_POWER_MAX},
};

/**
 * aw1660 voltages info table,
 * the index of table is voltage type.
 */
pmu_onoff_reg_bitmap_t aw1660_onoff_reg_bitmap[] = {
	//dev_addr               //reg_addr             //offset //state //dvm_en
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL0,    0,    1,    0},//AW1660_POWER_DCDC1
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL0,    1,    1,    0},//AW1660_POWER_DCDC2
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL0,    2,    1,    0},//AW1660_POWER_DCDC3
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL0,    3,    1,    0},//AW1660_POWER_DCDC4
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL0,    4,    1,    0},//AW1660_POWER_DCDC5
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL0,    5,    1,    0},//AW1660_POWER_DCDC6
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL0,    6,    1,    0},//AW1660_POWER_DCDC7
	{RSB_RTSADDR_AW1660,    AW1660_INVALID_ADDR,        6,    1,    0},//AW1660_POWER_RTCLDO
	{RSB_RTSADDR_AW1660,    AW1660_ALDO123_OP_MODE,     5,    0,    0},//AW1660_POWER_ALDO1
	{RSB_RTSADDR_AW1660,    AW1660_ALDO123_OP_MODE,     6,    0,    0},//AW1660_POWER_ALDO2
	{RSB_RTSADDR_AW1660,    AW1660_ALDO123_OP_MODE,     7,    0,    0},//AW1660_POWER_ALDO3
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL1,    3,    1,    0},//AW1660_POWER_DLDO1
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL1,    4,    0,    0},//AW1660_POWER_DLDO2
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL1,    5,    1,    0},//AW1660_POWER_DLDO3
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL1,    6,    1,    0},//AW1660_POWER_DLDO4
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL1,    0,    0,    0},//AW1660_POWER_ELDO1
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL1,    1,    0,    0},//AW1660_POWER_ELDO2
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL1,    2,    0,    0},//AW1660_POWER_ELDO3
	{RSB_RTSADDR_AW1660,    AW1660_ALDO123_OP_MODE,     2,    0,    0},//AW1660_POWER_FLDO1
	{RSB_RTSADDR_AW1660,    AW1660_ALDO123_OP_MODE,     3,    0,    0},//AW1660_POWER_FLDO2
	{RSB_RTSADDR_AW1660,    AW1660_ALDO123_OP_MODE,     4,    0,    0},//AW1660_POWER_FLDO3
	{RSB_RTSADDR_AW1660,    AW1660_INVALID_ADDR,        7,    0,    0},//AW1660_POWER_LDOIO0
	{RSB_RTSADDR_AW1660,    AW1660_INVALID_ADDR,        7,    0,    0},//AW1660_POWER_LDOIO1
	{RSB_RTSADDR_AW1660,    AW1660_OUTPUT_PWR_CTRL1,    7,    0,    0},//AW1660_POWER_DC1SW
	{RSB_INVALID_RTSADDR,   AW1660_INVALID_ADDR,        0,    0,    0},//POWER_ONOFF_MAX
};

/**
 * aw1736 voltages info table,
 * the index of table is voltage type.
 */
pmu_onoff_reg_bitmap_t aw1736_onoff_reg_bitmap[] = {
	//dev_addr               //reg_addr             //offset //state //dvm_en
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL0,    0,    1,    0},//AW1736_POWER_DCDC1
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL0,    1,    1,    0},//AW1736_POWER_DCDC2
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL0,    2,    1,    0},//AW1736_POWER_DCDC3
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL0,    3,    1,    0},//AW1736_POWER_DCDC4
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL0,    4,    1,    0},//AW1736_POWER_DCDC5
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL0,    5,    1,    0},//AW1736_POWER_DCDC6
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL1,    0,    0,    0},//AW1736_POWER_ALDO1
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL1,    1,    0,    0},//AW1736_POWER_ALDO2
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL1,    2,    0,    0},//AW1736_POWER_ALDO3
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL1,    3,    0,    0},//AW1736_POWER_ALDO4
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL1,    4,    0,    0},//AW1736_POWER_ALDO5
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL1,    5,    0,    0},//AW1736_POWER_BLDO1
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL1,    6,    0,    0},//AW1736_POWER_BLDO2
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL1,    7,    0,    0},//AW1736_POWER_BLDO3
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL2,    0,    0,    0},//AW1736_POWER_BLDO4
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL2,    1,    0,    0},//AW1736_POWER_BLDO5
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL2,    2,    0,    0},//AW1736_POWER_CLDO1
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL2,    3,    0,    0},//AW1736_POWER_CLDO2
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL2,    4,    0,    0},//AW1736_POWER_CLDO3
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL2,    5,    0,    0},//AW1736_POWER_CLDO4
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL2,    6,    1,    0},//AW1736_POWER_CPUSLDO
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL2,    7,    0,    0},//AW1736_POWER_DC1SW
	{RSB_RTSADDR_AW1736,    AW1736_OUTPUT_PWR_CTRL0,    6,    1,    0},//AW1736_POWER_RTC
	{RSB_INVALID_RTSADDR,   AW1736_INVALID_ADDR,        0,    0,    0},//POWER_ONOFF_MAX
};


/**
 * axp2202 voltages info table,
 * the index of table is voltage type.
 */
pmu_onoff_reg_bitmap_t axp2202_onoff_reg_bitmap[] = {
	//dev_addr               //reg_addr             //offset //state //dvm_en
	{RSB_RTSADDR_AXP2202,    AXP2202_DCDC_CFG0,   	 0,    1,    0},//AWP2202_POWER__DCDC1
	{RSB_RTSADDR_AXP2202,    AXP2202_DCDC_CFG0,   	 1,    1,    0},//AXP2202_POWER_DCDC2
	{RSB_RTSADDR_AXP2202,    AXP2202_DCDC_CFG0,  	 2,    1,    0},//AXP2202_POWER_DCDC3
	{RSB_RTSADDR_AXP2202,    AXP2202_DCDC_CFG0,    	 3,    1,    0},//AXP2202_POWER_DCDC4
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG0,    0,    0,    0},//AXP2202_POWER_ALDO1
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG0,    1,    0,    0},//AXP2202_POWER_ALDO2
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG0,    2,    0,    0},//AXP2202_POWER_ALDO3
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG0,    3,    0,    0},//AXP2202_POWER_ALDO4
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG0,    4,    0,    0},//AXP2202_POWER_BLDO1
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG0,    5,    0,    0},//AXP2202_POWER_BLDO2
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG0,    6,    0,    0},//AXP2202_POWER_BLDO3
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG0,    7,    0,    0},//AXP2202_POWER_BLDO4
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG1,    0,    0,    0},//AXP2202_POWER_CLDO1
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG1,    1,    0,    0},//AXP2202_POWER_CLDO2
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG1,    2,    0,    0},//AXP2202_POWER_CLDO3
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG1,    3,    0,    0},//AXP2202_POWER_CLDO4
	{RSB_RTSADDR_AXP2202,    AXP2202_LDO_EN_CFG1,    4,    0,    0},//AXP2202_POWER_CPUSLDO
	{RSB_INVALID_RTSADDR,    AXP2202_INVALID_ADDR,   0,    0,    0},//POWER_ONOFF_MAX
};


/**
 * aw1657 voltages info table,
 * the index of table is voltage type.
 */
pmu_onoff_reg_bitmap_t aw1657_onoff_reg_bitmap[] = {
	//dev_addr               //reg_addr             //offset //state //dvm_en
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL1,    0,    1,    0},//AW1657_POWER_DCDCA
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL1,    1,    1,    0},//AW1657_POWER_DCDCB
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL1,    2,    1,    0},//AW1657_POWER_DCDCC
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL1,    3,    1,    0},//AW1657_POWER_DCDCD
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL1,    4,    1,    0},//AW1657_POWER_DCDCE
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL1,    5,    1,    0},//AW1657_POWER_ALDO1
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL1,    6,    1,    0},//AW1657_POWER_ALDO2
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL1,    7,    1,    0},//AW1657_POWER_ALDO3
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL2,    0,    1,    0},//AW1657_POWER_BLDO1
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL2,    1,    1,    0},//AW1657_POWER_BLDO2
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL2,    2,    1,    0},//AW1657_POWER_BLDO3
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL2,    3,    1,    0},//AW1657_POWER_BLDO4
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL2,    4,    1,    0},//AW1657_POWER_CLDO1
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL2,    5,    1,    0},//AW1657_POWER_CLDO2
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL2,    6,    1,    0},//AW1657_POWER_CLDO3
	{RSB_RTSADDR_AW1657,    AW1657_OUTPUT_PWR_CTRL2,    7,    1,    0},//AW1657_POWER_DCESW
	{RSB_INVALID_RTSADDR,   AW1657_INVALID_ADDR,        0,    0,    0},//POWER_ONOFF_MAX
};



/**
 * aw1660 specific function,
 * only called by pmu common function.
 */
static void aw1660_pmu_shutdown(void)
{
	u8 devaddr = RSB_RTSADDR_AW1660;
	u8 regaddr = AW1660_PWR_OFF_CTRL;
	u8 data;

	save_state_flag(REC_SHUTDOWN | 0x101);

	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data |= 1 << 7;
	pmu_reg_write(&devaddr, &regaddr, &data, 1);

	LOG("poweroff system\n");
	while (1)
		;
}

static void aw1660_pmu_reset(void)
{
	u8 devaddr = RSB_RTSADDR_AW1660;
	u8 regaddr = AW1660_PWR_WAKEUP_CTRL;
	u8 data;

	save_state_flag(REC_SHUTDOWN | 0x201);

	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data |= 1 << 6;
	pmu_reg_write(&devaddr, &regaddr, &data, 1);

	LOG("reset system\n");
	while (1)
		;
}

static void aw1660_pmu_charging_reset(void)
{
	u8 devaddr = RSB_RTSADDR_AW1660;
	u8 regaddr;
	u8 val;

	regaddr = AW1660_PWR_SRC_STA;
	pmu_reg_read(&devaddr, &regaddr, &val, 1);
	/* vbus presence */
	if((val & 0x20) == 0x20) {
		regaddr = AW1660_PWRM_CHGR_STA;
		pmu_reg_read(&devaddr, &regaddr, &val, 1);
		/* only when battery presence we do reset instead of shutdown */
		if((val & 0x20) == 0x20) {
			regaddr = AW1660_DATA_BUFF1;
			val = SUNXI_CHARGING_FLAG;
			pmu_reg_write(&devaddr, &regaddr, &val, 1);
			aw1660_pmu_reset();
		}
	}
}

static s32 aw1660_pmu_set_voltage_state(u32 type, u32 state)
{
	u8 devaddr;
	u8 regaddr;
	u8 data;
	u32 offset;

	devaddr = aw1660_onoff_reg_bitmap[type].devaddr;
	regaddr = aw1660_onoff_reg_bitmap[type].regaddr;
	offset  = aw1660_onoff_reg_bitmap[type].offset;
	aw1660_onoff_reg_bitmap[type].state = state;

	//read-modify-write
	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data &= (~(1 << offset));
	data |= (state << offset);
	pmu_reg_write(&devaddr, &regaddr, &data, 1);

	if (state == POWER_VOL_ON) {
		//delay 1ms for open PMU output
		time_mdelay(1);
	}

	return OK;
}

/**
 * aw1736 specific function,
 * only called by pmu common function.
 */
static void aw1736_pmu_shutdown(void)
{
	u8 devaddr = RSB_RTSADDR_AW1736;
	u8 regaddr = AW1736_PWR_DISABLE_DOWN;
	u8 data = 1 << 7;

	save_state_flag(REC_SHUTDOWN | 0x101);

	/* power off system, disable DCDC & LDO */
	pmu_reg_write(&devaddr, &regaddr, &data, 1);
	pmu_reg_read(&devaddr, &regaddr, &data, 1);

	LOG("poweroff system\n");
	while (1)
		;
}

static void aw1736_pmu_reset(void)
{
	u8 devaddr = RSB_RTSADDR_AW1736;
	u8 regaddr = AW1736_PWR_DISABLE_DOWN;
	u8 data;

	save_state_flag(REC_SHUTDOWN | 0x201);

	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data |= 1 << 6;
	pmu_reg_write(&devaddr, &regaddr, &data, 1);

	LOG("reset system\n");
	while (1)
		;
}

static s32 aw1736_pmu_set_voltage_state(u32 type, u32 state)
{
	u8 devaddr;
	u8 regaddr;
	u8 data;
	u32 offset;

	devaddr = aw1736_onoff_reg_bitmap[type].devaddr;
	regaddr = aw1736_onoff_reg_bitmap[type].regaddr;
	offset  = aw1736_onoff_reg_bitmap[type].offset;
	aw1736_onoff_reg_bitmap[type].state = state;

	//read-modify-write
	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data &= (~(1 << offset));
	data |= (state << offset);
	pmu_reg_write(&devaddr, &regaddr, &data, 1);

	if (state == POWER_VOL_ON) {
		//delay 1ms for open PMU output
		time_mdelay(1);
	}

	return OK;
}

/**
 * axp2202 specific function,
 * only called by pmu common function.
 */
static void axp2202_pmu_shutdown(void)
{
	u8 devaddr = RSB_RTSADDR_AXP2202;
	u8 regaddr = AXP2202_SOFT_PWROFF;
	u8 data;

	save_state_flag(REC_SHUTDOWN | 0x101);

	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data |= 1 << 0;
	pmu_reg_write(&devaddr, &regaddr, &data, 1);

	LOG("poweroff system\n");
	while (1)
		;
}

static void axp2202_pmu_reset(void)
{
	u8 devaddr = RSB_RTSADDR_AXP2202;
	u8 regaddr = AXP2202_SOFT_PWROFF;
	u8 data;

	save_state_flag(REC_SHUTDOWN | 0x201);

	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data |= 1 << 1;
	pmu_reg_write(&devaddr, &regaddr, &data, 1);

	LOG("reset system\n");
	while (1)
		;
}

static void axp2202_pmu_charging_reset(void)
{
	u8 devaddr = RSB_RTSADDR_AXP2202;
	u8 regaddr;
	u8 val;

	regaddr = AXP2202_COMM_STAT0;
	pmu_reg_read(&devaddr, &regaddr, &val, 1);
	/* vbus presence */
	if ((val & 0x20) == 0x20) {
		regaddr = AXP2202_COMM_STAT0;
		pmu_reg_read(&devaddr, &regaddr, &val, 1);
		/* only when battery presence we do reset instead of shutdown */
		if ((val & 0x08) == 0x08) {
			regaddr = AXP2202_BUFFER0;
			val = SUNXI_CHARGING_FLAG;
			pmu_reg_write(&devaddr, &regaddr, &val, 1);
			axp2202_pmu_reset();
		}
	}
}


static s32 axp2202_pmu_set_voltage_state(u32 type, u32 state)
{
	u8 devaddr;
	u8 regaddr;
	u8 data;
	u32 offset;

	devaddr = axp2202_onoff_reg_bitmap[type].devaddr;
	regaddr = axp2202_onoff_reg_bitmap[type].regaddr;
	offset  = axp2202_onoff_reg_bitmap[type].offset;
//	axp2202_onoff_reg_bitmap[type].state = state;

	//read-modify-write
	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data &= (~(1 << offset));
	data |= (state << offset);
	pmu_reg_write(&devaddr, &regaddr, &data, 1);

	if (state == POWER_VOL_ON) {
		//delay 1ms for open PMU output
		time_mdelay(1);
	}

	return OK;
}


/**
 * aw1657 specific function,
 * only called by pmu common function.
 */
static void aw1657_pmu_shutdown(void)
{
	u8 devaddr = RSB_RTSADDR_AW1657;
	u8 regaddr = AW1657_PWR_DOWN_SEQ;
	u8 data;

	save_state_flag(REC_SHUTDOWN | 0x101);

	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data |= 1 << 7;
	pmu_reg_write(&devaddr, &regaddr, &data, 1);

	LOG("poweroff system\n");
	while (1)
		;
}

static void aw1657_pmu_reset(void)
{
	u8 devaddr = RSB_RTSADDR_AW1657;
	u8 regaddr = AW1657_PWR_DOWN_SEQ;
	u8 data;

	save_state_flag(REC_SHUTDOWN | 0x201);

	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data |= 1 << 6;
	pmu_reg_write(&devaddr, &regaddr, &data, 1);

	LOG("reset system\n");
	while (1)
		;
}

static s32 aw1657_pmu_set_voltage_state(u32 type, u32 state)
{
	u8 devaddr;
	u8 regaddr;
	u8 data;
	u32 offset;

	devaddr = aw1657_onoff_reg_bitmap[type].devaddr;
	regaddr = aw1657_onoff_reg_bitmap[type].regaddr;
	offset  = aw1657_onoff_reg_bitmap[type].offset;
	aw1657_onoff_reg_bitmap[type].state = state;

	//read-modify-write
	pmu_reg_read(&devaddr, &regaddr, &data, 1);
	data &= (~(1 << offset));
	data |= (state << offset);
	pmu_reg_write(&devaddr, &regaddr, &data, 1);

	if (state == POWER_VOL_ON) {
		//delay 1ms for open PMU output
		time_mdelay(1);
	}

	return OK;
}

void pmu_shutdown(void)
{
	if (is_pmu_exist() == FALSE)
		return;

	while (!!twi_get_status()) {
		time_mdelay(1000 * 2);
		LOG("wait twi bus idle loop\n");
	}

	switch (ic_version) {
	case AW1660_IC_VERSION:
		aw1660_pmu_shutdown();
		break;
	case AW1736_IC_VERSION:
		aw1736_pmu_shutdown();
		break;
	case AXP2202_IC_VERSION:
		axp2202_pmu_shutdown();
		break;
	case AW1657_IC_VERSION:
		aw1657_pmu_shutdown();
		break;
	default:
		break;
	}
}

void pmu_reset(void)
{
	if (is_pmu_exist() == FALSE) {
		watchdog_reset();
	}

	while (!!twi_get_status()) {
		time_mdelay(1000 * 2);
		LOG("wait twi bus idle loop\n");
	}

	switch (ic_version) {
	case AW1660_IC_VERSION:
		aw1660_pmu_reset();
		break;
	case AW1736_IC_VERSION:
		aw1736_pmu_reset();
		break;
	case AXP2202_IC_VERSION:
		axp2202_pmu_reset();
		break;
	case AW1657_IC_VERSION:
		aw1657_pmu_reset();
		break;
	default:
		break;
	}
}

void pmu_charging_reset(void)
{
	if (is_pmu_exist() == FALSE)
		return;

	while (!!twi_get_status()) {
		time_mdelay(1000 * 2);
		LOG("wait twi bus idle loop\n");
	}

	switch (ic_version) {
	case AW1660_IC_VERSION:
		aw1660_pmu_charging_reset();
		break;
	case AXP2202_IC_VERSION:
		axp2202_pmu_charging_reset();
		break;
	default:
		break;
	}
}

s32 pmu_set_voltage(u32 type, u32 voltage)
{
	s32 ret = OK;

	if (is_pmu_exist() == FALSE)
		return -ENODEV;

	switch (ic_version) {
	case AW1660_IC_VERSION:
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
	case AW1660_IC_VERSION:
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
	case AW1660_IC_VERSION:
		ret = aw1660_pmu_set_voltage_state(type, state);
		break;
	case AW1736_IC_VERSION:
		ret = aw1736_pmu_set_voltage_state(type, state);
		break;
	case AXP2202_IC_VERSION:
		ret = axp2202_pmu_set_voltage_state(type, state);
		break;
	case AW1657_IC_VERSION:
		ret = aw1657_pmu_set_voltage_state(type, state);
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
	case AW1660_IC_VERSION:
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
	case AW1660_IC_VERSION:
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
	case AW1660_IC_VERSION:
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
	case AW1660_IC_VERSION:
		break;
	default:
		break;
	}
}

s32 pmu_reg_write(u8 *devaddr, u8 *regaddr, u8 *data, u32 len)
{
	ASSERT(len <= AXP_TRANS_BYTE_MAX);

#ifdef CFG_RSB_USED
	u8 i;
	s32 result = OK;
	u32 data_temp = 0;

	for (i = 0; i < len; i++) {
		data_temp = *(data + i);
		result |= rsb_write(devaddr[i], regaddr[i], &data_temp, RSB_DATA_TYPE_BYTE);
	}
	return result;
#else
	return twi_write(devaddr[0], regaddr, data, len);
#endif
}

s32 pmu_reg_read(u8 *devaddr, u8 *regaddr, u8 *data, u32 len)
{
	ASSERT(len <= AXP_TRANS_BYTE_MAX);

#ifdef CFG_RSB_USED
	u8 i;
	s32 result = OK;
	u32 data_temp = 0;

	for (i = 0; i < len; i++) {
		result |= rsb_read(devaddr[i], regaddr[i], &data_temp, RSB_DATA_TYPE_BYTE);
		*(data + i) = (u8)(data_temp & 0xff);
	}
	return result;
#else
	return twi_read(devaddr[0], regaddr, data, len);
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
	LOG("watchdog reset\n");

	/* disable watchdog int */
	writel(0x0, R_WDOG_REG_BASE + 0x0);

	/* reset whole system */
	writel((0x1 | (0x1 << 8) | WATCHDOG_KEYFIELD), R_WDOG_REG_BASE + 0x14);

	/* set reset after 0.5s */
	writel(((0 << 4) | WATCHDOG_KEYFIELD), R_WDOG_REG_BASE + 0x18);
	mdelay(1);

	/* enable watchdog */
	writel((readl(R_WDOG_REG_BASE + 0x18) | 0x1 | WATCHDOG_KEYFIELD), R_WDOG_REG_BASE + 0x18);
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

	//notifier_notify(&wakeup_notify, CPUS_IRQ_MAPTO_CPUX(intno));

	pmu_clear_pendings();

	/* clear interrupt flag first */
	interrupt_clear_pending(INTC_R_NMI_IRQ);

	return TRUE;
}

s32 pmu_init(void)
{
	u32 power_mode = 0;

	u8 devaddr;
	u8 regaddr;
	u8 data;
	u8 i;

	/* power_mode may parse from dts */
	if (power_mode == POWER_MODE_AXP) {
		pmu_exist = TRUE;
		LOG("pmu is exist\n");

		for (i = 0; i < ARRAY_SIZE(pmu_id_match_tlb); i++) {
			devaddr = pmu_id_match_tlb[i][0];
			regaddr = AW1660_IC_NO_REG;
			pmu_reg_read(&devaddr, &regaddr, &data, 1);

			ic_version = ((data & 0xc0) >> 2) | (data & 0x0f);
			if (ic_version == pmu_id_match_tlb[i][1]) {
				axp_power_max = pmu_id_match_tlb[i][2];
				LOG("PMU IC_VERSION = 0x%x\n", ic_version);
				break;
			}
		}

		if (ic_version == 0) {
			ERR("no pmu found\n");
		} else if (i == ARRAY_SIZE(pmu_id_match_tlb)) {
			WRN("unknown pmu IC_NO_REG value = 0x%x\n", data);
		}
	} else {
		pmu_exist = FALSE;
		LOG("pmu is not exist\n");
		return OK;
	}

	interrupt_clear_pending(INTC_R_NMI_IRQ);

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

s32 pmu_standby_init(void)
{
	struct message message_ws;
	u32 paras = GIC_R_EXTERNAL_NMI_IRQ - 32;

	message_ws.paras = &paras;
	set_wakeup_src(&message_ws);

	return OK;
}

s32 pmu_standby_exit(void)
{
	struct message message_ws;
	u32 paras = GIC_R_EXTERNAL_NMI_IRQ - 32;

	message_ws.paras = &paras;
	clear_wakeup_src(&message_ws);

	return OK;
}

