///*****************************************
//  Copyright (C) 2009-2019
//  ITE Tech. Inc. All Rights Reserved
//  Proprietary and Confidential
///*****************************************
//   @file   <debug.h>
//   @author Jau-Chih.Tseng@ite.com.tw
//   @date   2019/01/03
//   @fileversion: ITE_HDMITX_SAMPLE_3.27
//******************************************/
#ifndef _DEBUG_H_
#define _DEBUG_H_

#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/fs.h>
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
#include <linux/err.h>


#define Debug_message 0

//#pragma message("debug.h")

#define printf printk

#ifndef Debug_message
#define Debug_message 0
#endif

#if Debug_message

	#define HDMITX_DEBUG_PRINTF(x)  printf x
	#define HDCP_DEBUG_PRINTF(x)  printf x
	#define EDID_DEBUG_PRINTF(x)  printf x
	#define HDMITX_DEBUG_INFO(x) printf x
#else
	#define HDMITX_DEBUG_PRINTF(x)
	#define HDCP_DEBUG_PRINTF(x)
	#define EDID_DEBUG_PRINTF(x)
	#define HDMITX_DEBUG_INFO(x)
#endif


#if ( Debug_message & (1 << 1))
	#define HDMITX_DEBUG_PRINTF1(x) printf x
	#define HDCP_DEBUG_PRINTF1(x) printf x
	#define EDID_DEBUG_PRINTF1(x) printf x
#else
	#define HDMITX_DEBUG_PRINTF1(x)
	#define HDCP_DEBUG_PRINTF1(x)
	#define EDID_DEBUG_PRINTF1(x)
#endif

#if ( Debug_message & (1 << 2))
	#define HDMITX_DEBUG_PRINTF2(x) printf x
	#define HDCP_DEBUG_PRINTF2(x) printf x
	#define EDID_DEBUG_PRINTF2(x) printf x
#else
	#define HDMITX_DEBUG_PRINTF2(x)
	#define HDCP_DEBUG_PRINTF2(x)
	#define EDID_DEBUG_PRINTF2(x)
#endif

#if ( Debug_message & (1 << 3))
	#define HDMITX_DEBUG_PRINTF3(x) printf x
	#define HDCP_DEBUG_PRINTF3(x) printf x
	#define EDID_DEBUG_PRINTF3(x) printf x
#else
	#define HDMITX_DEBUG_PRINTF3(x)
	#define HDCP_DEBUG_PRINTF3(x)
	#define EDID_DEBUG_PRINTF3(x)
#endif

#if ( Debug_message & (1 << 4))
	#define HDMITX_DEBUG_PRINTF4(x) printf x
	#define HDCP_DEBUG_PRINTF4(x) printf x
	#define EDID_DEBUG_PRINTF4(x) printf x
#else
	#define HDMITX_DEBUG_PRINTF4(x)
	#define HDCP_DEBUG_PRINTF4(x)
	#define EDID_DEBUG_PRINTF4(x)
#endif

#if ( Debug_message & (1 << 5))
	#define HDMITX_DEBUG_PRINTF5(x) printf x
	#define HDCP_DEBUG_PRINTF5(x) printf x
	#define EDID_DEBUG_PRINTF5(x) printf x
#else
	#define HDMITX_DEBUG_PRINTF5(x)
	#define HDCP_DEBUG_PRINTF5(x)
	#define EDID_DEBUG_PRINTF5(x)
#endif

#if ( Debug_message & (1 << 6))
	#define HDMITX_DEBUG_PRINTF6(x) printf x
	#define HDCP_DEBUG_PRINTF6(x) printf x
	#define EDID_DEBUG_PRINTF6(x) printf x
#else
	#define HDMITX_DEBUG_PRINTF6(x)
	#define HDCP_DEBUG_PRINTF6(x)
	#define EDID_DEBUG_PRINTF6(x)
#endif

#if ( Debug_message & (1 << 7))
	#define HDMITX_DEBUG_PRINTF7(x) printf x
	#define HDCP_DEBUG_PRINTF7(x) printf x
	#define EDID_DEBUG_PRINTF7(x) printf x
#else
	#define HDMITX_DEBUG_PRINTF7(x)
	#define HDCP_DEBUG_PRINTF7(x)
	#define EDID_DEBUG_PRINTF7(x)
#endif


#endif//  _DEBUG_H_
