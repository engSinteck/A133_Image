#ifndef _NCS8801S_H_
#define _NCS8801S_H_
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/platform_device.h>
#include <linux/of_platform.h>
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
#include <linux/sched.h>
#include <linux/kthread.h>
#include <linux/err.h>
#ifdef CONFIG_PM
#include <linux/pm.h>
#endif

struct ncs8801s_config {
	u32 twi_id;
	u32 ncs8801s_used;
	u32 address;
	u32 ncs8801s_power_vol;
	u32 ncs8801s_vddio_vol;
	struct gpio_config reset_gpio;
	struct regulator *ncs8801s_power_ldo;
	struct regulator *ncs8801s_vddio_ldo;
	struct device_node *node;
	struct device *dev;
};

struct i2c_client *ncs8801s_this_client;
struct i2c_client *ncs8801s_second_client;


static int i2c_write_byte(unsigned char address, unsigned char offset, unsigned char byteno, unsigned char p_data);

#endif
