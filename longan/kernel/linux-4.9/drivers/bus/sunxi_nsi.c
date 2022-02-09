/*
 * SUNXI NSI driver
 *
 * Copyright (C) 2015 AllWinnertech Ltd.
 * Author: xiafeng <xiafeng@allwinnertech.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed "as is" WITHOUT ANY WARRANTY of any
 * kind, whether express or implied; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include <linux/sunxi_nsi.h>
#include <linux/io.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/of_address.h>
#include <linux/slab.h>
#include <linux/hwmon.h>
#include <linux/hwmon-sysfs.h>
#include <linux/clk.h>
#include <linux/delay.h>
#include <linux/err.h>
#include <linux/spinlock.h>

#include <asm/cacheflush.h>
#include <asm/smp_plat.h>

#define DRIVER_NAME          "NSI"
#define DRIVER_NAME_PMU      DRIVER_NAME"_PMU"

#define MBUS_QOS_MAX      0x3

#define for_each_ports(port) for (port = 0; port < MBUS_PMU_IAG_MAX; port++)

/* n = 0~19 */
#define IAG_MODE(n)					(0x0010 + (0x200 * n))
#define IAG_PRI_CFG(n)				(0x0014 + (0x200 * n))
#define IAG_INPUT_OUTPUT_CFG(n)		(0x0018 + (0x200 * n))
/* Counter n = 0 ~ 19 */
#define MBUS_PMU_ENABLE(n)         (0x00c0 + (0x200 * n))
#define MBUS_PMU_CLR(n)            (0x00c4 + (0x200 * n))
#define MBUS_PMU_CYCLE(n)          (0x00c8 + (0x200 * n))
#define MBUS_PMU_RQ_RD(n)          (0x00cc + (0x200 * n))
#define MBUS_PMU_RQ_WR(n)          (0x00d0 + (0x200 * n))
#define MBUS_PMU_DT_RD(n)          (0x00d4 + (0x200 * n))
#define MBUS_PMU_DT_WR(n)          (0x00d8 + (0x200 * n))
#define MBUS_PMU_LA_RD(n)          (0x00dc + (0x200 * n))
#define MBUS_PMU_LA_WR(n)          (0x00e0 + (0x200 * n))

#define MBUS_PORT_MODE          (MBUS_PMU_MAX + 0)
#define MBUS_PORT_QOS           (MBUS_PMU_MAX + 1)
#define MBUS_INPUT_OUTPUT       (MBUS_PMU_MAX + 2)


struct nsi_bus {
	void __iomem *base;
	struct clk *pclk;  /* PLL clock */
	struct clk *mclk;  /* mbus clock */
	struct clk *dclk; /* dram clock */
	unsigned long rate;
};

struct nsi_pmu_data {
	struct device *hwmon_dev;
	unsigned long period;
	spinlock_t bwlock;
};

static struct nsi_pmu_data hw_nsi_pmu;
static struct nsi_bus sunxi_nsi;

static DEFINE_MUTEX(nsi_seting);
/**
 * nsi_port_setthd() - set a master priority
 *
 * @pri, priority
 */
int notrace nsi_port_setmode(enum nsi_pmu port, unsigned int mode)
{
	unsigned int value = 0;

	if (port >= MBUS_PMU_IAG_MAX)
		return -ENODEV;

	mutex_lock(&nsi_seting);
	value = readl_relaxed(sunxi_nsi.base + IAG_MODE(port));
	value &= ~0x3;
	writel_relaxed(value | mode, sunxi_nsi.base + IAG_MODE(port));
	mutex_unlock(&nsi_seting);

	return 0;
}
EXPORT_SYMBOL_GPL(nsi_port_setmode);

/**
 * nsi_port_setpri() - set a master QOS
 *
 * @qos: the qos value want to set
 */
int notrace nsi_port_setpri(enum nsi_pmu port, unsigned int pri)
{
	unsigned int value;

	if (port >= MBUS_PMU_IAG_MAX)
		return -ENODEV;

	if (pri > MBUS_QOS_MAX)
		return -EPERM;

	mutex_lock(&nsi_seting);
	value = readl_relaxed(sunxi_nsi.base + IAG_PRI_CFG(port));
	value &= ~0xf;
	writel_relaxed(value | (pri << 2) | pri,
		       sunxi_nsi.base + IAG_PRI_CFG(port));
	mutex_unlock(&nsi_seting);

	return 0;
}
EXPORT_SYMBOL_GPL(nsi_port_setpri);

/**
 * nsi_port_setio() - set a master's qos in or out
 *
 * @wt: the wait time want to set, based on MCLK
 */
int notrace nsi_port_setio(enum nsi_pmu port, bool io)
{
	unsigned int value;

	if (port >= MBUS_PMU_IAG_MAX)
		return -ENODEV;

	mutex_lock(&nsi_seting);
	value = readl_relaxed(sunxi_nsi.base + IAG_INPUT_OUTPUT_CFG(port));
	value &= ~0x1;
	writel_relaxed(value | io,
		       sunxi_nsi.base + IAG_INPUT_OUTPUT_CFG(port));
	mutex_unlock(&nsi_seting);

	return 0;
}
EXPORT_SYMBOL_GPL(nsi_port_setio);

static void nsi_pmu_disable(enum nsi_pmu port)
{
	unsigned int value;

	value = readl_relaxed(sunxi_nsi.base + MBUS_PMU_ENABLE(port));
	value &= ~(0x1);
	writel_relaxed(value, sunxi_nsi.base + MBUS_PMU_ENABLE(port));
}

static void nsi_pmu_enable(enum nsi_pmu port)
{
	unsigned int value;

	value = readl_relaxed(sunxi_nsi.base + MBUS_PMU_ENABLE(port));
	value |= (0x1);
	writel_relaxed(value, sunxi_nsi.base + MBUS_PMU_ENABLE(port));
}

static void nsi_pmu_clear(enum nsi_pmu port)
{
	unsigned int value = readl_relaxed(sunxi_nsi.base + MBUS_PMU_CLR(port));
	value |= (0x1);
	writel_relaxed(value, sunxi_nsi.base + MBUS_PMU_CLR(port));
}

ssize_t nsi_pmu_timer_store(struct device *dev,
				struct device_attribute *attr,
				const char *buf, size_t count)
{
	unsigned int cycle, port;
	unsigned long mrate = clk_get_rate(sunxi_nsi.mclk);
	unsigned long drate = clk_get_rate(sunxi_nsi.dclk);
	unsigned char *buffer = kmalloc(64, GFP_KERNEL);
	unsigned long period, flags;
	int ret = 0;
	/*
	 *if mclk = 400MHZ, the signel time = 1000*1000*1000/(400*1000*1000)=2.5ns
	 *if check the 10us, the cycle count = 10*1000ns/2.5us = 4000
	 * us*1000/(1s/400Mhz) = us*1000*400000000(rate)/1000000000
	 */

	ret = kstrtoul(buf, 10, &period);
	if (ret < 0)
		goto end;

	spin_lock_irqsave(&hw_nsi_pmu.bwlock, flags);

	/* set pmu period */
	cycle = period * mrate / 1000000;
	for (port = 1; port < MBUS_PMU_IAG_MAX; port++) {
		writel_relaxed(cycle, sunxi_nsi.base + MBUS_PMU_CYCLE(port));

		/* disabled the pmu count */
		nsi_pmu_disable(port);

		/* clean the insight counter */
		nsi_pmu_clear(port);

	}
	cycle = period * drate/ 1000000;
	writel_relaxed(cycle, sunxi_nsi.base + MBUS_PMU_CYCLE(MBUS_PMU_CPU));
	hw_nsi_pmu.period = period;
	nsi_pmu_disable(MBUS_PMU_CPU);
	nsi_pmu_clear(MBUS_PMU_CPU);

	writel_relaxed(cycle, sunxi_nsi.base + MBUS_PMU_CYCLE(MBUS_PMU_TAG));
	nsi_pmu_disable(MBUS_PMU_TAG);
	nsi_pmu_clear(MBUS_PMU_TAG);

	/* enable iag pmu */
	for (port = 0; port < MBUS_PMU_IAG_MAX; port++)
		nsi_pmu_enable(port);		/* enabled the pmu count */

	/* enable tag pmu */
	nsi_pmu_enable(MBUS_PMU_TAG);

	udelay(10);
	spin_unlock_irqrestore(&hw_nsi_pmu.bwlock, flags);

end:
	kfree(buffer);
	return count;
}

static ssize_t nsi_pmu_timer_show(struct device *dev,
			       struct device_attribute *da, char *buf)
{
	unsigned int len;

	len = sprintf(buf, "%-6lu\n", hw_nsi_pmu.period);

	return len;
}

static const struct of_device_id sunxi_nsi_matches[] = {
#ifdef CONFIG_ARCH_SUN8I
	{.compatible = "allwinner,sun8i-nsi", },
#endif
#ifdef CONFIG_ARCH_SUN50I
	{.compatible = "allwinner,sun50i-nsi", },
#endif
	{},
};

static int nsi_probe(void)
{
	int ret;
	unsigned int port;
	struct device_node *np;
	struct resource res;
	struct device_node *child;
	struct clk *pclk;
	struct clk *mclk;
	unsigned int bus_rate;

	np = of_find_matching_node(NULL, sunxi_nsi_matches);
	if (!np)
		return -ENODEV;

	ret = of_address_to_resource(np, 0, &res);
	if (!ret)
		sunxi_nsi.base = ioremap(res.start, resource_size(&res));

	if (ret || !sunxi_nsi.base) {
		WARN(1, "unable to ioremap nsi ctrl\n");
		return -ENXIO;
	}

	pclk = of_clk_get(np, 0);
	if (IS_ERR_OR_NULL(pclk)) {
		pr_err("Unable to acquire module clock, return %x\n",
		PTR_RET(pclk));
		return -1;
	}

	mclk = of_clk_get(np, 1);
	if (IS_ERR_OR_NULL(mclk)) {
		pr_err("Unable to acquire module clock, return %x\n",
		PTR_RET(mclk));
		return -1;
	}

	ret = of_property_read_u32(np, "clock-frequency", &bus_rate);
	if (ret) {
		pr_err("Get clock-frequency property failed\n");
		return -1;
	}

	ret = clk_set_parent(mclk, pclk);
	if (ret != 0) {
		pr_err("clk_set_parent() failed! return\n");
		return -1;
	}

	sunxi_nsi.rate = clk_round_rate(mclk, bus_rate);

	if (clk_set_rate(mclk, sunxi_nsi.rate)) {
		pr_err("clk_set_rate failed\n");
		return -1;
	}

	sunxi_nsi.mclk = mclk;
	sunxi_nsi.pclk = pclk;

	if (clk_prepare_enable(mclk)) {
		pr_err("Couldn't enable nsi clock\n");
		return -EBUSY;
	}

	for_each_available_child_of_node(np, child) {

		for_each_ports(port) {
			if (strcmp(child->name, get_name(port)))
				continue;
			else
				break;
		}

#if 0
		unsigned int val;
		if (!of_property_read_u32(child, "mode", &val)) {
			nsi_port_setmode(port, val);
		}

		if (!of_property_read_u32(child, "pri", &val)) {
			nsi_port_setpri(port, val);
		}

		if (!of_property_read_u32(child, "select", &val))
			nsi_port_setio(port, val);
#endif

	}

	/* all the port is default opened */

	/* set default bandwidth */

	/* set default QOS */

	/* set masters' request number sequency */

	/* set masters' bandwidth limit0/1/2 */

	return 0;
}

static int nsi_init_status = -EAGAIN;

static int nsi_init(void)
{
	if (nsi_init_status != -EAGAIN)
		return nsi_init_status;

	if (nsi_init_status == -EAGAIN)
		nsi_init_status = nsi_probe();

	return nsi_init_status;
}

/**
 * To sort out early init calls ordering a helper function is provided to
 * check if the nsi driver has beed initialized. Function check if the driver
 * has been initialized, if not it calls the init function that probes
 * the driver and updates the return value.
 */
bool nsi_probed(void)
{
	return nsi_init() == 0;
}
EXPORT_SYMBOL_GPL(nsi_probed);

static ssize_t nsi_pmu_bandwidth_show(struct device *dev,
			struct device_attribute *da, char *buf)
{
	unsigned int bread, bwrite, bandrw[MBUS_PMU_IAG_MAX];
	unsigned int port, len = 0;
	unsigned long flags = 0;
	char bwbuf[16];

	spin_lock_irqsave(&hw_nsi_pmu.bwlock, flags);

	/* read the iag pmu bandwidth, which is total master bandwidth */
	for (port = 0; port < MBUS_PMU_IAG_MAX; port++) {
		bread = readl_relaxed(sunxi_nsi.base + MBUS_PMU_DT_RD(port));
		bwrite = readl_relaxed(sunxi_nsi.base + MBUS_PMU_DT_WR(port));
		bandrw[port] = bread +bwrite;
	}
	for (port = 0; port < MBUS_PMU_IAG_MAX; port++) {
		len += sprintf(bwbuf, "%u  ", bandrw[port]/1024);
		strcat(buf, bwbuf);
	}

	/* read the tag pmu bandwidth, which is total ddr bandwidth */
	bread = readl_relaxed(sunxi_nsi.base + MBUS_PMU_DT_RD(MBUS_PMU_TAG));
	bwrite = readl_relaxed(sunxi_nsi.base + MBUS_PMU_DT_WR(MBUS_PMU_TAG));
	len += sprintf(bwbuf, "%u\n", (bread + bwrite)/1024);
	strcat(buf, bwbuf);

	spin_unlock_irqrestore(&hw_nsi_pmu.bwlock, flags);
	return len;
}

static ssize_t nsi_available_pmu_show(struct device *dev,
			struct device_attribute *da, char *buf)
{
	ssize_t i, len = 0;

	for (i = 0; i <= MBUS_PMU_IAG_MAX ; i++)
		len += sprintf(buf + len, "%s  ", get_name(i));
	len += sprintf(buf + len, "\n");

	return len;
}

static unsigned int nsi_get_value(struct nsi_pmu_data *data,
				   unsigned int index, char *buf)
{
	unsigned int i, size = 0;
	unsigned long value;

	switch (index) {
	case MBUS_PORT_MODE:   //0x10    fixed limit regulator
		for_each_ports(i) {
			value = readl_relaxed(sunxi_nsi.base +
					IAG_MODE(i));
			size += sprintf(buf + size, "master:%-8s qos_mode:%lu\n",
					get_name(i), (value & 0x3));
		}
		break;
	case MBUS_PORT_QOS:   //0x14
		for_each_ports(i) {
			value = readl_relaxed(sunxi_nsi.base +
					IAG_PRI_CFG(i));
			size += sprintf(buf + size, "master:%-8s read_priority:%lu \
					write_priority:%lu\n", get_name(i), (value >> 2), (value & 0x3));
		}
		break;
	case MBUS_INPUT_OUTPUT:          //0x18
		for_each_ports(i) {
			value = readl_relaxed(sunxi_nsi.base +
					IAG_INPUT_OUTPUT_CFG(i));
			size += sprintf(buf + size, "master:%-8s qos_sel(0-out 1-input):%lu\n",
					get_name(i), (value & 1));
		}
		break;
	default:
		/* programmer goofed */
		WARN_ON_ONCE(1);
		value = 0;
		break;
	}

	return size;
}

static ssize_t nsi_show_value(struct device *dev,
			       struct device_attribute *da, char *buf)
{
	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
	unsigned int len = 0;

	if (attr->index >= MBUS_PMU_MAX) {
		len = nsi_get_value(&hw_nsi_pmu, attr->index, buf);
		len = (len < PAGE_SIZE) ? len : PAGE_SIZE;
	}

	return len;
/*
	return snprintf(buf, PAGE_SIZE, "%u\n",
			nsi_update_device(&hw_nsi_pmu, attr->index));
*/
}

static unsigned int nsi_set_value(struct nsi_pmu_data *data, unsigned int index,
				   enum nsi_pmu port, unsigned int val)
{
	unsigned int value;

	switch (index) {
	case MBUS_PORT_MODE:
		nsi_port_setmode(port, val);
		break;
	case MBUS_PORT_QOS:
		nsi_port_setpri(port, val);
		break;
	case MBUS_INPUT_OUTPUT:
		nsi_port_setio(port, val);
		break;
	default:
		/* programmer goofed */
		WARN_ON_ONCE(1);
		value = 0;
		break;
	}

	return 0;
}

static ssize_t nsi_store_value(struct device *dev,
				struct device_attribute *attr,
				const char *buf, size_t count)
{
	int nr = to_sensor_dev_attr(attr)->index;
	unsigned long port, val;
	unsigned char buffer[64];
	unsigned char *pbuf, *pbufi;
	int err;

	if (strlen(buf) >= 64) {
		dev_err(dev, "arguments out of range!\n");
		return -EINVAL;
	}

	while (*buf == ' ') /* find the first unblank character */
		buf++;
	strncpy(buffer, buf, strlen(buf));

	pbufi = buffer;
	while (*pbufi != ' ') /* find the first argument */
		pbufi++;
	*pbufi = 0x0;
	pbuf = (unsigned char *)buffer;
	err = kstrtoul(pbuf, 10, &port);
	if (err < 0)
		return err;
	if (port >= MBUS_PMU_MAX) {
		dev_err(dev, "master is illegal\n");
		return -EINVAL;
	}

	pbuf = ++pbufi;
	while (*pbuf == ' ') /* remove extra space character */
		pbuf++;
	pbufi = pbuf;
	while ((*pbufi != ' ') && (*pbufi != '\n'))
		pbufi++;
	*pbufi = 0x0;

	err = kstrtoul(pbuf, 10, &val);
	if (err < 0)
		return err;

	nsi_set_value(&hw_nsi_pmu, nr,
		(enum nsi_pmu)port, (unsigned int)val);

	return count;
}

/* get all masters' mode or set a master's mode */
static SENSOR_DEVICE_ATTR(port_mode, 0644,
			  nsi_show_value, nsi_store_value, MBUS_PORT_MODE);
/* get all masters' prio or set a master's prio */
static SENSOR_DEVICE_ATTR(port_prio, 0644,
			  nsi_show_value, nsi_store_value, MBUS_PORT_QOS);
/* get all masters' inout or set a master's inout */
static SENSOR_DEVICE_ATTR(port_select, 0644,
			  nsi_show_value, nsi_store_value, MBUS_INPUT_OUTPUT);
/* get all masters' sample timer or set a master's timer */
static struct device_attribute dev_attr_pmu_timer =
	__ATTR(pmu_timer, 0644, nsi_pmu_timer_show, nsi_pmu_timer_store);
static struct device_attribute dev_attr_pmu_bandwidth =
	__ATTR(pmu_bandwidth, 0444, nsi_pmu_bandwidth_show, NULL);
static struct device_attribute dev_attr_available_pmu =
	__ATTR(available_pmu, 0444, nsi_available_pmu_show, NULL);

/* pointers to created device attributes */
static struct attribute *nsi_attributes[] = {
	&dev_attr_pmu_timer.attr,
	&dev_attr_pmu_bandwidth.attr,
	&dev_attr_available_pmu .attr,

	&sensor_dev_attr_port_mode.dev_attr.attr,
	&sensor_dev_attr_port_prio.dev_attr.attr,
	&sensor_dev_attr_port_select.dev_attr.attr,
	NULL,
};

static struct attribute_group nsi_group = {
	.attrs = nsi_attributes,
};

static const struct attribute_group *nsi_groups[] = {
	&nsi_group,
	NULL,
};

static int nsi_pmu_probe(struct platform_device *pdev)
{
	int ret;
	struct device *dev = &pdev->dev;

	hw_nsi_pmu.hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
									"nsi_pmu",
									NULL,
									nsi_groups);

	if (IS_ERR(hw_nsi_pmu.hwmon_dev)) {
		ret = PTR_ERR(hw_nsi_pmu.hwmon_dev);
		goto out_err;
	}

	sunxi_nsi.dclk = clk_get(dev, "sdram");
	if (!sunxi_nsi.dclk)
		dev_err(dev, "get sdram clock failed\n");

	spin_lock_init(&hw_nsi_pmu.bwlock);

	return 0;

out_err:
	dev_err(&(pdev->dev), "probed failed\n");
	sysfs_remove_group(&pdev->dev.kobj, &nsi_group);

	return ret;
}

static int nsi_pmu_remove(struct platform_device *pdev)
{
	hwmon_device_unregister(hw_nsi_pmu.hwmon_dev);
	sysfs_remove_group(&pdev->dev.kobj, &nsi_group);

	return 0;
}

#ifdef CONFIG_PM
static int sunxi_nsi_suspend(struct device *dev)
{
	dev_info(dev, "suspend okay\n");

	return 0;
}

static int sunxi_nsi_resume(struct device *dev)
{
	dev_info(dev, "resume okay\n");

	return 0;
}

static const struct dev_pm_ops sunxi_nsi_pm_ops = {
	.suspend = sunxi_nsi_suspend,
	.resume = sunxi_nsi_resume,
};

#define SUNXI_MBUS_PM_OPS (&sunxi_nsi_pm_ops)
#else
#define SUNXI_MBUS_PM_OPS NULL
#endif

static struct platform_driver nsi_pmu_driver = {
	.driver = {
		.name   = DRIVER_NAME_PMU,
		.owner  = THIS_MODULE,
		.pm     = SUNXI_MBUS_PM_OPS,
		.of_match_table = sunxi_nsi_matches,
	},
	.probe = nsi_pmu_probe,
	.remove = nsi_pmu_remove,
};

static int __init nsi_pmu_init(void)
{
	int ret;

	ret = platform_driver_register(&nsi_pmu_driver);
	if (ret) {
		pr_err("register sunxi nsi platform driver failed\n");
		goto drv_err;
	}

	return ret;

drv_err:
	platform_driver_unregister(&nsi_pmu_driver);

	return -EINVAL;
}

early_initcall(nsi_init);
device_initcall(nsi_pmu_init);

MODULE_LICENSE("GPL v2");
MODULE_DESCRIPTION("SUNXI NSI support");
MODULE_AUTHOR("xiafeng");
