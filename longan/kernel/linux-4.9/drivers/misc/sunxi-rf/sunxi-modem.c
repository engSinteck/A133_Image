#include <linux/kernel.h>
#include <linux/types.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/gpio.h>
#include <linux/err.h>
#include <linux/device.h>
#include <linux/delay.h>
#include <linux/of_gpio.h>
#include <linux/clk.h>
#include <linux/regulator/consumer.h>
#include <linux/platform_device.h>
#include <linux/sunxi-gpio.h>
#include <linux/rfkill.h>

#define PWR_MAX                5

struct modem_power_t {
	struct regulator *power;
	char *power_name;
};

struct sunxi_modem_platdata {
	struct regulator *power[PWR_MAX];
	char *power_name[PWR_MAX];
	bool power_state;

	int  gpio_modem_rst;
	bool gpio_modem_rst_assert;

	struct rfkill *rfkill;
	struct platform_device *pdev;
};

static struct sunxi_modem_platdata *modem_data;
static int sunxi_modem_on(struct sunxi_modem_platdata *data, bool on_off);
static DEFINE_MUTEX(sunxi_modem_mutex);

void sunxi_modem_set_power(bool on_off)
{
	struct platform_device *pdev;
	int ret = 0;

	if (!modem_data)
		return;

	pdev = modem_data->pdev;
	mutex_lock(&sunxi_modem_mutex);
	if (on_off != modem_data->power_state) {
		ret = sunxi_modem_on(modem_data, on_off);
		if (ret)
			dev_err(&pdev->dev, "set power failed\n");
	}
	mutex_unlock(&sunxi_modem_mutex);
}
EXPORT_SYMBOL_GPL(sunxi_modem_set_power);

static int sunxi_modem_on(struct sunxi_modem_platdata *data, bool on_off)
{
	struct platform_device *pdev = data->pdev;
	struct device *dev = &pdev->dev;
	int ret = 0, i;

	if (on_off) {
		for (i = 0; i < PWR_MAX; i++) {
			if (!IS_ERR_OR_NULL(data->power[i])) {
				ret = regulator_enable(data->power[i]);
				if (ret < 0) {
					dev_err(dev, "modem power[%d] (%s) enable failed\n",
								i, data->power_name[i]);
					return ret;
				}

				ret = regulator_get_voltage(data->power[i]);
				if (ret < 0) {
					dev_err(dev, "modem power[%d] (%s) get voltage failed\n",
								i, data->power_name[i]);
					return ret;
				}
				dev_info(dev, "modem power[%d] (%s) voltage: %d\n",
						 i, data->power_name[i], ret);
			}
		}

		if (gpio_is_valid(data->gpio_modem_rst)) {
			mdelay(10);
			gpio_set_value(data->gpio_modem_rst, !data->gpio_modem_rst_assert);
		}
	} else {
		if (gpio_is_valid(data->gpio_modem_rst))
			gpio_set_value(data->gpio_modem_rst, data->gpio_modem_rst_assert);

		for (i = 0; i < PWR_MAX; i++) {
			if (!IS_ERR_OR_NULL(data->power[i])) {
				ret = regulator_disable(data->power[i]);
				if (ret < 0) {
					dev_err(dev, "modem power[%d] (%s) disable failed\n",
								i, data->power_name[i]);
					return ret;
				}
			}
		}
	}

	data->power_state = on_off;

	return 0;
}

static int sunxi_modem_set_block(void *data, bool blocked)
{
	struct sunxi_modem_platdata *platdata = data;
	struct platform_device *pdev = platdata->pdev;
	int ret;

	if (blocked != platdata->power_state) {
		dev_warn(&pdev->dev, "block state already is %d\n", blocked);
		return 0;
	}

	dev_info(&pdev->dev, "set block: %d\n", blocked);
	ret = sunxi_modem_on(platdata, !blocked);
	if (ret) {
		dev_err(&pdev->dev, "set block failed\n");
		return ret;
	}

	return 0;
}

static const struct rfkill_ops sunxi_modem_rfkill_ops = {
	.set_block = sunxi_modem_set_block,
};

static int sunxi_modem_probe(struct platform_device *pdev)
{
	struct device_node *np = pdev->dev.of_node;
	struct device *dev = &pdev->dev;
	struct sunxi_modem_platdata *data;
	struct gpio_config config;
	int ret = 0;
	int count, i;

	if (!dev) {
		pr_err("dev is null!\n");
		return -ENOMEM;
	}

	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);

	data->pdev = pdev;

	count = of_property_count_strings(np, "modem_power");
	if (count <= 0) {
		dev_warn(dev, "Missing modem_power.\n");
	} else {
		if (count > PWR_MAX) {
			dev_warn(dev, "modem power count large than max(%d > %d).\n",
				count, PWR_MAX);
			count = PWR_MAX;
		}
		ret = of_property_read_string_array(np, "modem_power",
			(const char **)data->power_name, count);
		if (ret < 0)
			return -ENOMEM;
	}

	for (i = 0; i < count; i++) {
		data->power[i] = regulator_get(dev, data->power_name[i]);
		if (IS_ERR_OR_NULL(data->power[i]))
			return -ENOMEM;
		dev_info(dev, "modem power[%d] (%s)\n", i, data->power_name[i]);
	}

	data->gpio_modem_rst = of_get_named_gpio_flags(np, "modem_rst",
			0, (enum of_gpio_flags *)&config);
	if (!gpio_is_valid(data->gpio_modem_rst)) {
		dev_err(dev, "get gpio modem_rst failed\n");
	} else {
		dev_info(dev, "modem_rst gpio=%d  mul-sel=%d  pull=%d  drv_level=%d  data=%d\n",
				config.gpio,
				config.mul_sel,
				config.pull,
				config.drv_level,
				config.data);

		ret = devm_gpio_request(dev, data->gpio_modem_rst, "modem_rst");
		if (ret < 0) {
			dev_err(dev, "can't request modem_rst gpio %d\n",
				data->gpio_modem_rst);
			return ret;
		}

		ret = gpio_direction_output(data->gpio_modem_rst, data->gpio_modem_rst_assert);
		if (ret < 0) {
			dev_err(dev, "can't request output direction modem_rst gpio %d\n",
				data->gpio_modem_rst);
			return ret;
		}
		data->gpio_modem_rst_assert = config.data;
		gpio_set_value(data->gpio_modem_rst, data->gpio_modem_rst_assert);
	}

	data->rfkill = rfkill_alloc("sunxi-modem", dev, RFKILL_TYPE_WWAN,
				&sunxi_modem_rfkill_ops, data);
	if (!data->rfkill) {
		ret = -ENOMEM;
		goto failed_alloc;
	}

	rfkill_set_states(data->rfkill, true, false);

	ret = rfkill_register(data->rfkill);
	if (ret)
		goto fail_rfkill;
	platform_set_drvdata(pdev, data);

	data->power_state = 0;
	modem_data = data;
	return 0;

fail_rfkill:
	if (data->rfkill)
		rfkill_destroy(data->rfkill);
failed_alloc:

	modem_data = NULL;
	return ret;
}

static int sunxi_modem_remove(struct platform_device *pdev)
{
	struct sunxi_modem_platdata *data = platform_get_drvdata(pdev);
	struct rfkill *rfk = data->rfkill;

	platform_set_drvdata(pdev, NULL);

	if (rfk) {
		rfkill_unregister(rfk);
		rfkill_destroy(rfk);
	}

	modem_data = NULL;

	return 0;
}

static const struct of_device_id sunxi_modem_ids[] = {
	{ .compatible = "allwinner,sunxi-modem" },
	{ /* Sentinel */ }
};

static struct platform_driver sunxi_modem_driver = {
	.probe  = sunxi_modem_probe,
	.remove = sunxi_modem_remove,
	.driver = {
		.owner = THIS_MODULE,
		.name  = "sunxi-modem",
		.of_match_table = sunxi_modem_ids,
	},
};

module_platform_driver(sunxi_modem_driver);

MODULE_DESCRIPTION("sunxi modem rfkill driver");
MODULE_LICENSE(GPL);
