/*
 * Allwinner SoCs it6612 driver.
 *
 * Copyright (C) 2016 Allwinner.
 *
 * This file is licensed under the terms of the GNU General Public
 * License version 2.  This program is licensed "as is" without any
 * warranty of any kind, whether express or implied.
 */
#ifndef _IT6612_H_
#define _IT6612_H_

#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/fs.h>
#include <linux/i2c-dev.h>
#include <linux/i2c.h>
#include <linux/init.h>
#include <linux/jiffies.h>
#include <linux/kernel.h>
#include <linux/list.h>
#include <linux/module.h>
#include <linux/notifier.h>
#include <linux/slab.h>
#include <linux/uaccess.h>
#include <linux/delay.h>
#include <linux/mutex.h>
#include <linux/sysfs.h>
#include <linux/mod_devicetable.h>
#include <linux/log2.h>
#include <linux/bitops.h>
#include <linux/of.h>
#include <asm/io.h>
#include <linux/irq.h>
#include <linux/gpio.h>
#include <linux/sunxi-gpio.h>
#include <linux/of_gpio.h>
#include <linux/pm_runtime.h>
#include <linux/regulator/consumer.h>
#include <linux/compat.h>
#include <linux/sched.h>   //wake_up_process()
#include <linux/kthread.h> //kthread_create()、kthread_run()
#include <linux/err.h>
#ifdef CONFIG_PM
#include <linux/pm.h>
#endif
#include "mcu.h"
#include "typedef.h"
#include "config.h"
#include "version.h"
#include "TimerProcess.h"
#include "hdmitx_sys.h"
#include "hdmitx.h"
#include "debug.h"


#define __DEBUG_ON
#ifdef __DEBUG_ON
#define printinfo(fmt, ...)  printk("%s-<%d>:" fmt,  __func__ ,__LINE__, ##__VA_ARGS__);
#define printinfo_s(fmt, ...)  printk(fmt, ##__VA_ARGS__);
#else
#define printinfo(fmt, ...)
#define printinfo_s(fmt, ...)
#endif

#define PIN_SIGNAL_VOLTAGE_330  0
#define PIN_SIGNAL_VOLTAGE_180  1

BOOL it66121_i2c_write_byte(BYTE address, BYTE offset, BYTE byteno, BYTE *p_data, BYTE device);
BOOL it66121_i2c_read_byte(BYTE address, BYTE offset, BYTE byteno, BYTE *p_data, BYTE device);
void it66121_report_hdmi_HPDStatus(BYTE status);
#endif  //_IT6612_H_
