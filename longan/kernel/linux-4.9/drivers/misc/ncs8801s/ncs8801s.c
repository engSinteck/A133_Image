#include <linux/ncs8801s.h>

#define NCS8801S_NAME        ("ncs8801s")
#define NCS8801S_MATCH_DTS_EN 1

#ifndef Debug_message
#define Debug_message 0
#endif

#if Debug_message
#define printinfo(fmt, ...)  printk("%s-<%d>:" fmt,  __func__, __LINE__, ##__VA_ARGS__);
#else
#define printinfo(fmt, ...)
#endif

#if Debug_message
static int i2c_read_byte(unsigned char address, unsigned char offset, unsigned char byteno, unsigned char *p_data);
#endif

struct ncs8801s_config ncs8801s_config_info = {
	.twi_id = 5,
};

static int i2c_write_byte(unsigned char address, unsigned char offset, unsigned char byteno, unsigned char p_data)
{
	int ret;
	struct i2c_adapter *adap = NULL;
	struct i2c_msg msg;
	unsigned char data[256];

	printinfo("address>>1 is 0x%x,,,offset is 0x%x\n", address>>1, offset);
	if ((address >> 1) == ncs8801s_this_client->addr) {
		printinfo("this adapter is ncs8801s first adapter\n");
		adap = ncs8801s_this_client->adapter;
	} else if ((ncs8801s_second_client != NULL) && ((address >> 1) == ncs8801s_second_client->addr)) {
		printinfo("this adapter is ncs8801s second adapter\n");
		adap = ncs8801s_second_client->adapter;
	} else {
		printinfo("this adapter is enter else\n");
		if (ncs8801s_second_client != NULL) {
			printinfo("second_client is not null,,,second_client->addr=0x%x\n", ncs8801s_second_client->addr);
		} else {
			printinfo("second_client is null !!!\n");
		}
		adap = ncs8801s_this_client->adapter;
	}

	data[0] = offset;
	data[1] = p_data;
	printinfo("p_data = 0x%2x\n", p_data);

	msg.addr = address >> 1;
	msg.flags = 0;
	msg.len = byteno + 1;
	msg.buf = data;

	ret = i2c_transfer(adap, &msg, 1);

	if (ret >= 0) {
		return 1;
	} else {
		printinfo("error! slave = 0x%x, addr = 0x%2x\n ", address >> 1, offset);
	}

	return 0;
}

#if Debug_message
static int i2c_read_byte(unsigned char address, unsigned char offset, unsigned char byteno, unsigned char *p_data)
{
	unsigned char i;
	int ret;
	struct i2c_adapter *adap = NULL;
	struct i2c_msg msg[2];
	unsigned char data[256];

	printinfo("address >> 1 is 0x%x,,,offset is 0x%x\n", address >> 1, offset);
	if ((address >> 1) == ncs8801s_this_client->addr) {
		printinfo("this adapter is ncs8801s first adapter\n");
		adap = ncs8801s_this_client->adapter;
	} else if ((ncs8801s_second_client != NULL) && ((address >> 1) == ncs8801s_second_client->addr)) {
		printinfo("this adapter is ncs8801s second adapter\n");
		adap = ncs8801s_second_client->adapter;
	} else {
		printinfo("this adapter is enter else\n");
		if (ncs8801s_second_client != NULL) {
			printinfo("second_client is not null,,,second_client->addr=0x%x\n", ncs8801s_second_client->addr);
		} else {
			printinfo("second_client is null !!!\n");
		}
		adap = ncs8801s_this_client->adapter;
	}
	data[0] = offset;

	/*
	* Send out the register address...
	*/
	msg[0].addr = address >> 1;
	msg[0].flags = 0;
	msg[0].len = 1;
	msg[0].buf = &data[0];
	/*
	* ...then read back the result.
	*/
	msg[1].addr = address >> 1;
	msg[1].flags = I2C_M_RD;
	msg[1].len = byteno;
	msg[1].buf = &data[1];

	ret = i2c_transfer(adap, msg, 2);
	if (ret >= 0) {
		if (byteno > 1) {
			for (i = 0; i < byteno - 1; i++) {
				p_data[i] = data[i+1];
			}
		} else {
			p_data[0] = data[1];
			printinfo("p_data = 0x%2x\n", *p_data);
		}
		return 1;
	} else {
		printinfo("error! slave = 0x%x, addr = 0x%2x\n", address >> 1, offset);
	}
	return 0;
}
#endif

static const struct i2c_device_id ncs8801s_id[] = {
	{"ncs8801s_0", 0},
	{"ncs8801s_1", 1},
	{},
};
MODULE_DEVICE_TABLE(i2c, ncs8801s_id);

#if NCS8801S_MATCH_DTS_EN
static struct of_device_id ncs8801s_dt_ids[] = {
	{.compatible = "allwinner,ncs8801s_two",},
	{},
};
MODULE_DEVICE_TABLE(of, ncs8801s_dt_ids);
#endif

/*******************************************************
Function:
    I2c probe.
Input:
    client: i2c device struct.
    id: device id.
Output:
    Executive outcomes.
0: succeed.
*******************************************************/
static int ncs8801s_probe(struct i2c_client *client, const struct i2c_device_id *id)
{
	int err;
#if Debug_message
	unsigned char buffer;
	unsigned char i = 0;
#endif

	printinfo("probe ok,,,,enter,,,,,\n");
	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
		err = -ENODEV;
		return err;
	}

	ncs8801s_config_info.ncs8801s_power_ldo = regulator_get(&client->dev, "ncs8801s");
	if (client->addr == 0x70) {
		ncs8801s_this_client = client;
		printinfo("probe ok=first client=this_client==>0x%x\n", client->addr);
	}

	if (client->addr == 0x75) {
		ncs8801s_second_client = client;
		printinfo("probe ok=second client=this_client==>0x%x\n", client->addr);
	}

	if (ncs8801s_second_client) {
		i2c_write_byte(0xe0, 0x0f, 1, 0x01);
		i2c_write_byte(0xe0, 0x00, 1, 0x00);
		i2c_write_byte(0xe0, 0x02, 1, 0x07);
		i2c_write_byte(0xe0, 0x03, 1, 0x03);
		i2c_write_byte(0xe0, 0x07, 1, 0xc2);
		i2c_write_byte(0xe0, 0x09, 1, 0x01);
		i2c_write_byte(0xe0, 0x0b, 1, 0x00);
		i2c_write_byte(0xe0, 0x60, 1, 0x00);
		i2c_write_byte(0xe0, 0x70, 1, 0x00);
		i2c_write_byte(0xe0, 0x71, 1, 0x01);
		i2c_write_byte(0xe0, 0x73, 1, 0x80);
		i2c_write_byte(0xe0, 0x74, 1, 0x20);
		i2c_write_byte(0xea, 0x00, 1, 0xb0);
		i2c_write_byte(0xea, 0x84, 1, 0x10);
		i2c_write_byte(0xea, 0x85, 1, 0x32);
		i2c_write_byte(0xea, 0x01, 1, 0x00);
		i2c_write_byte(0xea, 0x02, 1, 0x5c);
		i2c_write_byte(0xea, 0x0b, 1, 0x47);
		i2c_write_byte(0xea, 0x0e, 1, 0x06);
		i2c_write_byte(0xea, 0x0f, 1, 0x06);
		i2c_write_byte(0xea, 0x11, 1, 0x88);
		i2c_write_byte(0xea, 0x22, 1, 0x04);
		i2c_write_byte(0xea, 0x23, 1, 0xf8);
		i2c_write_byte(0xea, 0x00, 1, 0xb1);
		i2c_write_byte(0xe0, 0x0f, 1, 0x00);

#if Debug_message
		for (i = 0; i < 48; i++) {
			buffer = 0x00;
			i2c_read_byte(0xe0, 0x00 + i, 1, &buffer);
			printinfo("i2c_read_byte,,0x%x is buffer=0x%x\n", 0x00 + i, buffer);
		}
#endif
	}
	return 0;
}

#if !NCS8801S_MATCH_DTS_EN
static int  ncs8801s_detect(struct i2c_client *client, struct i2c_board_info *info)
{
	struct i2c_adapter *adapter = client->adapter;
	if (client == NULL || client->adapter == NULL) {
		printinfo("ncs8801s detect client or client->adapter is NULL\n");
		return -1;
	}

	printinfo("enter ncs8801s detect==>the adapter number is %d,,,,client->addr=%x\n", adapter->nr, client->addr);

	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
		printinfo("ncs8801s i2c_check_functionality is fail\n");
		return -ENODEV;
	}

	if ((5 == adapter->nr) && (client->addr == 0x70)) {
		printinfo("Detected chip ncs8801s first at adapter %d, address 0x%02x\n", i2c_adapter_id(adapter), client->addr);
		strlcpy(info->type, "ncs8801s_0", I2C_NAME_SIZE);
	} else if ((5 == adapter->nr) && (client->addr == 0x75)) {
		printinfo("Detected chip ncs8801s second at adapter %d, address 0x%02x\n", i2c_adapter_id(adapter), client->addr);
		strlcpy(info->type, "ncs8801s_1", I2C_NAME_SIZE);
	} else {
		printinfo("Detected chip ncs8801s first & second at adapter, address 0x70 & 0x75 fail\n");
		return -ENODEV;
	}
	return 0;
}
#endif

static int  ncs8801s_remove(struct i2c_client *client)
{
	printk("it6807 remove:*************************\n");
	return 0;
}

static int ncs8801s_pm_suspend(struct device *dev)
{
	if (regulator_is_enabled(ncs8801s_config_info.ncs8801s_power_ldo)) {
		regulator_disable(ncs8801s_config_info.ncs8801s_power_ldo);
	}

	if (regulator_is_enabled(ncs8801s_config_info.ncs8801s_vddio_ldo)) {
		regulator_disable(ncs8801s_config_info.ncs8801s_vddio_ldo);
	}

	if (gpio_is_valid(ncs8801s_config_info.reset_gpio.gpio)) {
		gpio_set_value(ncs8801s_config_info.reset_gpio.gpio, 0);
		gpio_free(ncs8801s_config_info.reset_gpio.gpio);
	}

	return 0;
}

static int ncs8801s_pm_resume(struct device *dev)
{
	int ret;

	if (!IS_ERR(ncs8801s_config_info.ncs8801s_vddio_ldo)) {
		printinfo("resume func set ncs8801s_vddio_ldo .\n");
		regulator_set_voltage(ncs8801s_config_info.ncs8801s_vddio_ldo, (int)(ncs8801s_config_info.ncs8801s_vddio_vol)*1000, (int)(ncs8801s_config_info.ncs8801s_vddio_vol)*1000);
		if (regulator_enable(ncs8801s_config_info.ncs8801s_vddio_ldo) != 0) {
			pr_err("%s: enable ncs8801s_vddio_ldo error!\n", __func__);
			return -1;
		}
	}

	if (!IS_ERR(ncs8801s_config_info.ncs8801s_power_ldo)) {
		printinfo("resume func set ncs8801s_power_ldo .\n");
		regulator_set_voltage(ncs8801s_config_info.ncs8801s_power_ldo, (int)(ncs8801s_config_info.ncs8801s_power_vol)*1000, (int)(ncs8801s_config_info.ncs8801s_power_vol)*1000);
		if (regulator_enable(ncs8801s_config_info.ncs8801s_power_ldo) != 0) {
			pr_err("%s: enable ncs8801s_power_ldo error!\n", __func__);
			return -1;
		}
	}

	if (gpio_is_valid(ncs8801s_config_info.reset_gpio.gpio)) {
		ret = gpio_request(ncs8801s_config_info.reset_gpio.gpio, NULL);
		if (!ret) {
			gpio_direction_output(ncs8801s_config_info.reset_gpio.gpio, 1);
			gpio_set_value(ncs8801s_config_info.reset_gpio.gpio, 0);
			mdelay(40);
			gpio_set_value(ncs8801s_config_info.reset_gpio.gpio, 1);
		}
	}

	if (ncs8801s_second_client) {
		i2c_write_byte(0xe0, 0x0f, 1, 0x01);
		i2c_write_byte(0xe0, 0x00, 1, 0x00);
		i2c_write_byte(0xe0, 0x02, 1, 0x07);
		i2c_write_byte(0xe0, 0x03, 1, 0x03);
		i2c_write_byte(0xe0, 0x07, 1, 0xc2);
		i2c_write_byte(0xe0, 0x09, 1, 0x01);
		i2c_write_byte(0xe0, 0x0b, 1, 0x00);
		i2c_write_byte(0xe0, 0x60, 1, 0x00);
		i2c_write_byte(0xe0, 0x70, 1, 0x00);
		i2c_write_byte(0xe0, 0x71, 1, 0x01);
		i2c_write_byte(0xe0, 0x73, 1, 0x80);
		i2c_write_byte(0xe0, 0x74, 1, 0x20);
		i2c_write_byte(0xea, 0x00, 1, 0xb0);
		i2c_write_byte(0xea, 0x84, 1, 0x10);
		i2c_write_byte(0xea, 0x85, 1, 0x32);
		i2c_write_byte(0xea, 0x01, 1, 0x00);
		i2c_write_byte(0xea, 0x02, 1, 0x5c);
		i2c_write_byte(0xea, 0x0b, 1, 0x47);
		i2c_write_byte(0xea, 0x0e, 1, 0x06);
		i2c_write_byte(0xea, 0x0f, 1, 0x06);
		i2c_write_byte(0xea, 0x11, 1, 0x88);
		i2c_write_byte(0xea, 0x22, 1, 0x04);
		i2c_write_byte(0xea, 0x23, 1, 0xf8);
		i2c_write_byte(0xea, 0x00, 1, 0xb1);
		i2c_write_byte(0xe0, 0x0f, 1, 0x00);
	}

	return 0;
}

static const unsigned short normal_i2c[] = {0x70, 0x75, I2C_CLIENT_END};

static struct dev_pm_ops ncs8801s_pm_ops = {
	.suspend = ncs8801s_pm_suspend,
	.resume  = ncs8801s_pm_resume,
};

static struct i2c_driver ncs8801s_driver = {
	.class      = I2C_CLASS_HWMON,
    .driver = {
		.name   = NCS8801S_NAME,
		.owner    = THIS_MODULE,
#if NCS8801S_MATCH_DTS_EN
		.of_match_table = ncs8801s_dt_ids,
#endif
#ifndef CONFIG_HAS_EARLYSUSPEND
#if defined(CONFIG_PM)
		.pm		  = &ncs8801s_pm_ops,
#endif
#endif
    },
	.probe      = ncs8801s_probe,
    .remove     = ncs8801s_remove,
    .id_table   = ncs8801s_id,
#if !NCS8801S_MATCH_DTS_EN
	.detect = ncs8801s_detect,
    .address_list	= normal_i2c,
#endif
};

static int script_ncs8801s_gpio_init(void)
{
	int ret = -1;
	struct device_node *np = NULL;
	struct ncs8801s_config *data = container_of(&(ncs8801s_config_info.twi_id), struct ncs8801s_config, twi_id);
	struct i2c_client *client_tmp = NULL;
	struct platform_device *pdev = NULL;

	np = data->node;

	if (!np) {
		np = of_find_node_by_name(NULL, "ncs8801s_two_1");
	}

	if (!np) {
		 pr_err("ERROR! get ncs8801s_para failed, func:%s, line:%d\n", __FUNCTION__, __LINE__);
		 return -1;
	}

	if (!of_device_is_available(np)) {
		pr_err("%s: ncs8801s is not used\n", __func__);
		return -1;
	} else {
		ncs8801s_config_info.ncs8801s_used = 1;
		data->ncs8801s_used = ncs8801s_config_info.ncs8801s_used;
	}

	client_tmp = of_find_i2c_device_by_node(np);
	if (client_tmp) {
		data->dev = &client_tmp->dev;
	} else {
		pdev = of_find_device_by_node(np);
		if (pdev) {
			data->dev = &pdev->dev;
		}
	}

	if (!data->dev) {
		pr_err("get ncs8801s device_node fail\n");
		return -1;
	} else {
		pr_err("get ncs8801s device_node success\n");
	}

	ret = of_property_read_u32(np, "ncs8801s_vddio_vol", &data->ncs8801s_vddio_vol);
	if (ret) {
		pr_err("get ncs8801s_vddio_vol is fail, %d\n", ret);
		return -1;
	}
	ncs8801s_config_info.ncs8801s_vddio_vol = data->ncs8801s_vddio_vol;

	ret = of_property_read_u32(np, "ncs8801s_power_vol", &data->ncs8801s_power_vol);
	if (ret) {
		pr_err("get ncs8801s_power_vol is fail, %d\n", ret);
		return -1;
	}
	ncs8801s_config_info.ncs8801s_power_vol = data->ncs8801s_power_vol;


	data->reset_gpio.gpio = of_get_named_gpio_flags(np, "ncs8801s_two_reset", 0, (enum of_gpio_flags *)(&(data->reset_gpio)));

	data->ncs8801s_vddio_ldo = regulator_get(data->dev, "ncs8801s_vddio");
	if (!IS_ERR(data->ncs8801s_vddio_ldo)) {
		printinfo("set ncs8801s_vddio_ldo .\n");
		regulator_set_voltage(data->ncs8801s_vddio_ldo, (int)(data->ncs8801s_vddio_vol)*1000, (int)(data->ncs8801s_vddio_vol)*1000);
		if (regulator_enable(data->ncs8801s_vddio_ldo) != 0) {
			pr_err("%s: enable ncs8801s_vddio_ldo error!\n", __func__);
			goto devicetree_err;
		}

	}

	data->ncs8801s_power_ldo = regulator_get(data->dev, "ncs8801s");
	if (!IS_ERR(data->ncs8801s_power_ldo)) {
		printinfo("set ncs8801s_power_ldo .\n");
		regulator_set_voltage(data->ncs8801s_power_ldo, (int)(data->ncs8801s_power_vol)*1000, (int)(data->ncs8801s_power_vol)*1000);
		if (regulator_enable(data->ncs8801s_power_ldo) != 0) {
			pr_err("%s: enable ncs8801s_power_ldo error!\n", __func__);
			goto devicetree_err;
		}

	}

	if (!gpio_is_valid(data->reset_gpio.gpio)) {
		pr_err("%s: ncs8801s_reset_gpio is invalid.\n", __func__);
		goto devicetree_err;
	} else {
		pr_err("%s: ncs8801s_reset_gpio success. \n", __func__);
		if (0 != gpio_request(data->reset_gpio.gpio, NULL)) {
			printk("reset_gpio_request is failed\n");
			goto devicetree_err;
		}

		if (0 != gpio_direction_output(data->reset_gpio.gpio, 1)) {
			printk("ncs8801s_reset_gpio set err!\n");
			goto devicetree_err;
		}

		gpio_set_value(data->reset_gpio.gpio, 0);
		mdelay(40);
		gpio_set_value(data->reset_gpio.gpio, 1);
		ncs8801s_config_info.reset_gpio = data->reset_gpio;
	}
	return 1;

devicetree_err:
	if (regulator_is_enabled(data->ncs8801s_power_ldo)) {
		regulator_disable(data->ncs8801s_power_ldo);
	}

	if (data->ncs8801s_power_ldo) {
		regulator_put(data->ncs8801s_power_ldo);
		data->ncs8801s_power_ldo = NULL;
	}

	if (regulator_is_enabled(data->ncs8801s_vddio_ldo)) {
		regulator_disable(data->ncs8801s_vddio_ldo);
	}

	if (data->ncs8801s_vddio_ldo) {
		regulator_put(data->ncs8801s_vddio_ldo);
		data->ncs8801s_vddio_ldo = NULL;
	}

	if (gpio_is_valid(data->reset_gpio.gpio)) {
		gpio_free(data->reset_gpio.gpio);
	}

	return -1;
}


/*******************************************************
Function:
    Driver Install function.
Input:
    None.
Output:
    Executive Outcomes. 0---succeed.
********************************************************/
static int __init ncs8801s_init(void)
{
    int ret = 0;
	printk("ncs8801s init:*************************\n");

    if (script_ncs8801s_gpio_init() > 0) {
		ret = i2c_add_driver(&ncs8801s_driver);
		if (ret != 0)
			pr_err("Failed to register ncs8801s i2c driver : %d \n", ret);
	}

    return ret;
}

/*******************************************************
Function:
    Driver uninstall function.
Input:
    None.
Output:
    Executive Outcomes. 0---succeed.
********************************************************/
static void __exit ncs8801s_exit(void)
{
	if (regulator_is_enabled(ncs8801s_config_info.ncs8801s_power_ldo)) {
		regulator_disable(ncs8801s_config_info.ncs8801s_power_ldo);
	}

	if (ncs8801s_config_info.ncs8801s_power_ldo) {
		regulator_put(ncs8801s_config_info.ncs8801s_power_ldo);
		ncs8801s_config_info.ncs8801s_power_ldo = NULL;
	}

	if (regulator_is_enabled(ncs8801s_config_info.ncs8801s_vddio_ldo)) {
		regulator_disable(ncs8801s_config_info.ncs8801s_vddio_ldo);
	}

	if (ncs8801s_config_info.ncs8801s_vddio_ldo) {
		regulator_put(ncs8801s_config_info.ncs8801s_vddio_ldo);
		ncs8801s_config_info.ncs8801s_vddio_ldo = NULL;
	}

	if (gpio_is_valid(ncs8801s_config_info.reset_gpio.gpio)) {
		gpio_free(ncs8801s_config_info.reset_gpio.gpio);
	}

	i2c_del_driver(&ncs8801s_driver);
	printk("it6807 exit:*************************\n");
}

subsys_initcall_sync(ncs8801s_init);
module_exit(ncs8801s_exit);

MODULE_AUTHOR("<wanpeng@allwinnertech.com>");
MODULE_DESCRIPTION("ncs8801s Driver");
MODULE_LICENSE("GPL");
