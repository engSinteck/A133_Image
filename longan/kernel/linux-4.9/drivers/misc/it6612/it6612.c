/*
 * Allwinner SoCs it6612 driver.
 *
 * Copyright (C) 2016 Allwinner.
 *
 * This file is licensed under the terms of the GNU General Public
 * License version 2.  This program is licensed "as is" without any
 * warranty of any kind, whether express or implied.
 */
#include "it6612.h"
#include <linux/device.h>
#include <linux/platform_device.h>
#include <linux/extcon.h>
#include <linux/fs.h>
#include <linux/err.h>
#include <linux/sunxi-gpio.h>
#include <linux/io.h>
#include <asm/io.h>

#define IT6612_NAME		("it6612")
#define IT6612_MATCH_DTS_EN 0
#define IT6612_IIC_ADDR_ID  (TX0ADR / 2)

static struct i2c_client *this_client;
static struct i2c_adapter *this_adap;

static struct i2c_client *edid_client;
static struct i2c_adapter *edid_adap;
static struct i2c_client *rx_client;
static struct i2c_adapter *rx_adap;
static struct i2c_client *cec_client;
static struct i2c_adapter *cec_adap;


BOOL it66121_i2c_write_byte(BYTE address, BYTE offset, BYTE byteno, BYTE *p_data, BYTE device)
{

	BYTE i;
	int ret;
	struct i2c_adapter *adap = NULL;//this_client->adapter;
	struct i2c_msg msg;
	unsigned char data[256];


	if ((address>>1) == this_client->addr){
		adap = this_client->adapter;
	}else if ((rx_client !=  NULL)&&((address>>1) == rx_client->addr)){
		adap = rx_client->adapter;
	}else if ((edid_client !=  NULL)&&((address>>1) == edid_client->addr)){
		adap = edid_client->adapter;
	}else if ((cec_client !=  NULL)&&((address>>1) == cec_client->addr)){
		adap = cec_client->adapter;
	}else{
		if (rx_client !=  NULL){
		}else{
			printk("%d,,,%s:rx_client is null !!!\n",__LINE__,__FUNCTION__);
		}

		if (edid_client !=  NULL){
		}else{
			//printk("%d,,,%s:edid_client is null !!!\n",__LINE__,__FUNCTION__);
		}

		if (cec_client !=  NULL){
			//printk("%d,,,%s:cec_client is not null,,,cec_client->addr = 0x%x\n",__LINE__,__FUNCTION__,cec_client->addr);
		}else{
			printk("%d,,,%s:cec_client is null !!!\n",__LINE__,__FUNCTION__);
		}
		adap = this_client->adapter;
	}
	if (adap == NULL){
		printinfo("adap is null !");
		return 0;
	}
	data[0] = offset;
	if (byteno > 1){
		for(i = 0; i < byteno -1; i++){
			data[i+1] = p_data[i];
			//printk("%d,,,%s,,,p_data[%d] = 0x%2x\n",__LINE__,__FUNCTION__,i,p_data[i]);
		}
	}else{
		data[1] = p_data[0];
		//printk("%d,,,%s,,,offset = 0x%2x p_data = 0x%2x\n",__LINE__,__FUNCTION__,offset,*p_data);
	}

	msg.addr = address>>1;//address;//this_client->addr;
	msg.flags = 0;
	msg.len = byteno +1;//count;
	msg.buf = data;//(char *)buf;

	ret = i2c_transfer(adap, &msg, 1);

	if (ret >=  0) {
		return 1;
	}else{
		printk("%s error! slave = 0x%x, addr = 0x%2x\n ",__func__, address>>1, offset);
	}

	return 0;
}

BOOL it66121_i2c_read_byte(BYTE address, BYTE offset, BYTE byteno, BYTE *p_data, BYTE device)
{
	BYTE i;
	int ret;
	struct i2c_adapter *adap = NULL;//this_client->adapter;
	struct i2c_msg msg[2];
	unsigned char data[256];

	if ((address>>1) == this_client->addr){
		adap = this_client->adapter;
	}else if ((rx_client !=  NULL)&&((address>>1) == rx_client->addr)){
		adap = rx_client->adapter;
	}else if ((edid_client !=  NULL)&&((address>>1) == edid_client->addr)){
		adap = edid_client->adapter;
	}else if ((cec_client !=  NULL)&&((address>>1) == cec_client->addr)){
		adap = cec_client->adapter;
	}else{
		if (rx_client !=  NULL){
			printk("%d,,,%s:rx_client is not null,,,rx_client->addr = 0x%x\n",__LINE__,__FUNCTION__,rx_client->addr);
		}else{
			printk("%d,,,%s:rx_client is null !!!\n",__LINE__,__FUNCTION__);
		}

		if (edid_client !=  NULL){
			printk("%d,,,%s:edid_client is not null,,,edid_client->addr = 0x%x\n",__LINE__,__FUNCTION__,edid_client->addr);
		}else{
			printk("%d,,,%s:edid_client is null !!!\n",__LINE__,__FUNCTION__);
		}

		if (cec_client !=  NULL){
			printk("%d,,,%s:cec_client is not null,,,cec_client->addr = 0x%x\n",__LINE__,__FUNCTION__,cec_client->addr);
		}else{
			printk("%d,,,%s:cec_client is null !!!\n",__LINE__,__FUNCTION__);
		}
		adap = this_client->adapter;
	}
	if (adap == NULL){
		printinfo("adap is null !");
		return 0;
	}
	data[0] = offset;

	/*
	* Send out the register address...
	*/
	msg[0].addr = address>>1;//address;//this_client->addr;
	msg[0].flags = 0;
	msg[0].len = 1;
	msg[0].buf = &data[0];
	/*
	* ...then read back the result.
	*/
	msg[1].addr = address>>1;//address;//this_client->addr;
	msg[1].flags = I2C_M_RD;
	msg[1].len = byteno;
	msg[1].buf = &data[1];

	ret = i2c_transfer(adap, msg, 2);
	if (ret >=  0) {
		if (byteno > 1){
			for(i = 0; i < byteno -1; i++){
				p_data[i] = data[i+1];
			}
		}else{
			p_data[0] = data[1];
		}
		return 1;
	} else {
		//printk("%s error! slave = 0x%x, addr = 0x%2x\n ",__func__, address>>1,offset);
	}
	return 0;
}

static const struct i2c_device_id it6612_id[] = { {"it6612_0", 0 }, { }
};
MODULE_DEVICE_TABLE(i2c, it6612_id);

static struct of_device_id it6612_dt_ids[] = { {.compatible = "allwinner,it6612",}, {},
};
MODULE_DEVICE_TABLE(of, it6612_dt_ids);

static struct task_struct *it6612_fsm_task;

static int it6612_fsm_thread(void *data)
{
	BYTE count = 0;
	while(1) {
		msleep(100);
		//printk("it6612_fsm_thread start ..\n");
		HDMITX_DevLoopProc();
		count++ ;
		// printf("count = %d\n",(int)count) ;
		if ( count > 50 )
		{
			DumpHDMITXReg() ;
			count = 0 ;
		}
		//printk("it6612_fsm_thread end ..\n");
	}
	return 0;
}

static const struct i2c_board_info it6612_rx_info = {
	I2C_BOARD_INFO("it6612_rx", 0x48),
};

static const struct i2c_board_info it6612_edid_info = {
	I2C_BOARD_INFO("it6612_edid", 0x50),
};

static const struct i2c_board_info it6612_cec_info = {
	I2C_BOARD_INFO("it6612_cec", 0x4e),
};

static void register_inside_i2cdevice(void)
{
	printk("register rx_adap \n");
	/*if (rx_adap == NULL){
		printk("register rx_adap before \n");
		rx_adap = i2c_get_adapter(5);
		printk("register rx_adap after \n");
		if (rx_adap){
			printk("%s:rx_adap->name = %s\n",__FUNCTION__,rx_adap->name);
			if (rx_client == NULL){
				rx_client = i2c_new_device(rx_adap, &it6612_rx_info);
				if (rx_client){
					printk("%d,,,%s:rx_client->addr = 0x%x\n",__LINE__,__FUNCTION__,rx_client->addr);
				}else{
					printk("%d,,,%s:i2c_new_device fail\n",__LINE__,__FUNCTION__);
				}
			}else{
				printk("%d,,,%s:rx_client is not null,,,rx_client->addr = 0x%x\n",__LINE__,__FUNCTION__,rx_client->addr);
			}
		}else{
			printk("%s:i2c_get_adapter fail\n",__FUNCTION__);
		}

	}else*/{
		printk("%s:rx_adap is not null,,,rx_adap->name = %s\n",__FUNCTION__,rx_adap->name);
		if (rx_client == NULL){
			rx_client = i2c_new_device(this_adap, &it6612_rx_info);
			if (rx_client){
				printk("%d,,,%s:rx_client->addr = 0x%x\n",__LINE__,__FUNCTION__,rx_client->addr);
			}else{
				printk("%d,,,%s:i2c_new_device fail\n",__LINE__,__FUNCTION__);
			}
		}else{
			printk("%d,,,%s:rx_client is not null,,,rx_client->addr = 0x%x\n",__LINE__,__FUNCTION__,rx_client->addr);
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	printk("register cec_adap \n");
	/*if (cec_adap == NULL){
		cec_adap = i2c_get_adapter(5);
		if (cec_adap){
			printk("%s:cec_adap->name = %s\n",__FUNCTION__,cec_adap->name);
			if (cec_client == NULL){
				cec_client = i2c_new_device(cec_adap, &it6612_cec_info);
				if (cec_client){
					printk("%d,,,%s:cec_client->addr = 0x%x\n",__LINE__,__FUNCTION__,cec_client->addr);
				}else{
					printk("%d,,,%s:i2c_new_device fail\n",__LINE__,__FUNCTION__);
				}
			}else{
				printk("%d,,,%s:cec_client is not null,,,cec_client->addr = 0x%x\n",__LINE__,__FUNCTION__,cec_client->addr);
			}
		}else{
			printk("%d,,,%s:i2c_get_adapter fail\n",__LINE__,__FUNCTION__);
		}

	}else*/{
		printk("%s:cec_adap is not null,,,cec_adap->name = %s\n",__FUNCTION__,cec_adap->name);
		if (cec_client == NULL){
			cec_client = i2c_new_device(this_adap, &it6612_cec_info);
			if (cec_client){
				printk("%d,,,%s:cec_client->addr = 0x%x\n",__LINE__,__FUNCTION__,cec_client->addr);
			}else{
				printk("%d,,,%s:i2c_new_device fail\n",__LINE__,__FUNCTION__);
			}
		}else{
			printk("%d,,,%s:cec_client is not null,,,cec_client->addr = 0x%x\n",__LINE__,__FUNCTION__,cec_client->addr);
		}
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	printk("register edid_adap \n");
	/*if (edid_adap == NULL){
		edid_adap = i2c_get_adapter(5);
		if (edid_adap){
			printk("%s:edid_adap->name = %s\n",__FUNCTION__,edid_adap->name);
			if (edid_client == NULL){
				edid_client = i2c_new_device(edid_adap, &it6612_edid_info);
				if (edid_client){
					printk("%d,,,%s:edid_client->addr = 0x%x\n",__LINE__,__FUNCTION__,edid_client->addr);
				}else{
					printk("%d,,,%s:i2c_new_device fail\n",__LINE__,__FUNCTION__);
				}
			}else{
				printk("%d,,,%s:edid_client is not null,,,edid_client->addr = 0x%x\n",__LINE__,__FUNCTION__,edid_client->addr);
			}
		}else{
			printk("%d,,,%s:i2c_get_adapter fail\n",__LINE__,__FUNCTION__);
		}
	}else*/{
		printk("%s:edid_adap is not null,,,edid_adap->name = %s\n",__FUNCTION__,edid_adap->name);
		if (edid_client == NULL){
			edid_client = i2c_new_device(this_adap, &it6612_edid_info);
			if (edid_client){
				printk("%d,,,%s:edid_client->addr = 0x%x\n",__LINE__,__FUNCTION__,edid_client->addr);
			}else{
				printk("%d,,,%s:i2c_new_device fail\n",__LINE__,__FUNCTION__);
			}
		}else{
			printk("%d,,,%s:edid_client is not null,,,edid_client->addr = 0x%x\n",__LINE__,__FUNCTION__,edid_client->addr);
		}
	}
}

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
static int it6612_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
{

	int err;
	int ret = 0;
	printinfo("entered probe!\n");
	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
		err = -ENODEV;
		return err;
	}
	this_client = client;
	this_adap = client->adapter;
	printinfo("probe ok====>0x%x\n",client->addr);

	register_inside_i2cdevice();
	//init
	InitHDMITX_Variable();
	InitHDMITX();
	//HDMITX_ChangeDisplayOption(HDMI_720p60,HDMI_RGB444) ;
	HDMITX_ChangeDisplayOption(HDMI_1080p60, HDMI_RGB444) ;

	it6612_fsm_task = kthread_create(it6612_fsm_thread, NULL, "it6612_fsm_thread");
	if (IS_ERR(it6612_fsm_task)){
		printk("Unable to start kernel thread. ");
		ret = PTR_ERR(it6612_fsm_task);
		it6612_fsm_task = NULL;
		return ret;
	}
	//kthread_bind(it6612_fsm_task,2);	//这里是绑定在某个cpu上
	wake_up_process(it6612_fsm_task);
	return 0;
}

#if !IT6612_MATCH_DTS_EN
static int  it6612_detect(struct i2c_client *client, struct i2c_board_info *info)
{
	struct i2c_adapter *adapter = client->adapter;
	if (client == NULL || client->adapter == NULL) {
		printinfo("it6612 detect client or client->adapter is NULL\n");
		return -1;
	}
	printinfo("enter it6612 detect==>the adapter number is %d,,,,client->addr = %x\n",adapter->nr,client->addr);
	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)){
		printinfo("it6612 i2c_check_functionality is fail\n");
		return -ENODEV;
	}

	if ((5 == adapter->nr) && (client->addr == IT6612_IIC_ADDR_ID)) {
		printinfo("Detected chip i2c1_it6612 at adapter %d, address 0x%02x\n",i2c_adapter_id(adapter), client->addr);
		//this_client = client;
		strlcpy(info->type, "it6612_0", I2C_NAME_SIZE);
	}else{
		printinfo("Detected chip i2c1_it6612 at adapter 5, address IT6612_IIC_ADDR_ID fail\n");
		return -ENODEV;
	}
	return 0;
}
#endif

static int  it6612_i2c_remove(struct i2c_client *client)
{
	printinfo("it6612 remove:*************************\n");
	return 0;
}

static int it6612_pm_suspend(struct device *dev)
{
	return 0;
}

static int it6612_pm_resume(struct device *dev)
{
	return 0;
}

static const unsigned short normal_i2c[] = {IT6612_IIC_ADDR_ID,I2C_CLIENT_END};

static struct dev_pm_ops it6612_pm_ops = {
	.suspend = it6612_pm_suspend,
	.resume  = it6612_pm_resume,
};

static struct i2c_driver it6612_i2c_driver = {
	.class	  = I2C_CLASS_HWMON,
	.driver = {
		.name   = IT6612_NAME,
		.owner	 =  THIS_MODULE,
#if IT6612_MATCH_DTS_EN
		.of_match_table = it6612_dt_ids,
#endif
#ifndef CONFIG_HAS_EARLYSUSPEND
#if defined(CONFIG_PM)
		.pm		  = &it6612_pm_ops,
#endif
#endif
	},
	.probe	  = it6612_i2c_probe,
	.remove	 = it6612_i2c_remove,
	.id_table   = it6612_id,
#if !IT6612_MATCH_DTS_EN
	.detect = it6612_detect,
	.address_list	 =  normal_i2c,
#endif
};

static struct resource it6612_resource[] = {
};

static void it6612_release(struct device *dev)
{

}

static struct platform_device it6612_device = {
	.name = "ite66121",
	.id = -1,
	.num_resources = ARRAY_SIZE(it6612_resource),
	.resource = it6612_resource,
	.dev = {
		.release = it6612_release,
	},
};

enum hpd_status {
	STATUE_CLOSE = 0,
	STATUE_OPEN  = 1,
};

static const unsigned int hdmi_cable[] = {
	EXTCON_DISP_HDMI,
	EXTCON_NONE,
};
static struct extcon_dev *hdmi_extcon_dev;
static BOOL hdmi_extcon_allocate_flag;

void it66121_report_hdmi_HPDStatus(BYTE status)
{
	printk("it66121_report_hdmi_HPDStatus : hdmi hpd status = %d \n", status);
	if (status) {
		extcon_set_cable_state_(hdmi_extcon_dev, EXTCON_DISP_HDMI, STATUE_OPEN);
	} else {
		extcon_set_cable_state_(hdmi_extcon_dev, EXTCON_DISP_HDMI, STATUE_CLOSE);
	}
}

static inline unsigned int it6612_reg_readl(volatile void __iomem *addr)
{
	return readl(addr);
}

static inline void it6612_reg_writel(volatile void __iomem *addr, unsigned int reg_value)
{
	writel(reg_value, addr);
}

static inline void it6612_reg_clr_set(volatile void __iomem *reg, unsigned int clr_bits, unsigned int set_bits)
{
	unsigned int v = it6612_reg_readl(reg);
	it6612_reg_writel(reg, (v & ~clr_bits) | (set_bits & clr_bits));
}

static int it6612_probe(struct platform_device *pdev)
{
	int ret = 0;
	void __iomem *vtr_addr;
	unsigned int reg_value;
	unsigned long addr = 0x0300b340;

	printinfo("it6612 probe:*************************\n");

	/*set pin signal voltage 1.8v*/
	vtr_addr = ioremap(addr, 4);
	it6612_reg_clr_set(vtr_addr, 1 << 9, 1 << 9);
	reg_value = it6612_reg_readl(vtr_addr);
	if (!(reg_value & (1 << 9))) {
		ret = -1;
		pr_err("Failed to set pin signal voltage 1.8v : %d \n", ret);
		return ret;
	}

	/*regist hdmi ext-connect*/
	hdmi_extcon_dev = extcon_get_extcon_dev("hdmi");
	if (hdmi_extcon_dev == NULL) {
		hdmi_extcon_dev = devm_extcon_dev_allocate(&pdev->dev, hdmi_cable);
		hdmi_extcon_dev->name = "hdmi";
		ret = devm_extcon_dev_register(&pdev->dev, hdmi_extcon_dev);
		if (ret) {
			devm_extcon_dev_free(&pdev->dev, hdmi_extcon_dev);
			printinfo("it6612 register hdmi extcon fail ret = %d***********\n", ret);
		}
		hdmi_extcon_allocate_flag = true;
	}

	/*add i2c driver*/
	ret = i2c_add_driver(&it6612_i2c_driver);
	if (ret !=  0)
	pr_err("Failed to register it6612 i2c driver : %d \n", ret);

	return ret;
}

static int it6612_remove(struct platform_device *pdev)
{
	int ret = 0;

	if (it6612_fsm_task) {
		kthread_stop(it6612_fsm_task);
		it6612_fsm_task = NULL;
		printinfo("kthread_stop:*************************\n");
	}
	i2c_del_driver(&it6612_i2c_driver);

	if (hdmi_extcon_allocate_flag) {
		devm_extcon_dev_unregister(&pdev->dev, hdmi_extcon_dev);
		devm_extcon_dev_free(&pdev->dev, hdmi_extcon_dev);
	}
	printinfo("it6612 remove:*************************\n");

	return ret;
}

static struct platform_driver it6612_driver = {
	.probe    = it6612_probe,
	.remove   = it6612_remove,
	.driver   = {
		  .name           = "ite66121",
		  .owner          = THIS_MODULE,
	},
};

static int hdmi_open(struct inode *inode, struct file *filp)
{
	return 0;
}

static int hdmi_release(struct inode *inode, struct file *filp)
{
	return 0;
}

static ssize_t hdmi_read(struct file *file, char __user *buf,
						size_t count,
						loff_t *ppos)
{
	return -EINVAL;
}

static ssize_t hdmi_write(struct file *file, const char __user *buf,
						size_t count,
						loff_t *ppos)
{
	return -EINVAL;
}

static int hdmi_mmap(struct file *filp, struct vm_area_struct *vma)
{
	return 0;
}

static long hdmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
{
	return 0;
}

static dev_t devid;
static struct cdev *hdmi_cdev;
static struct class *hdmi_class;
static struct device *hdev;

static struct hdmi_tx_drv	*hdmi_drv;

static const struct file_operations hdmi_fops = {
	.owner		= THIS_MODULE,
	.open		= hdmi_open,
	.release	= hdmi_release,
	.write		= hdmi_write,
	.read		= hdmi_read,
	.unlocked_ioctl	= hdmi_ioctl,
	.mmap		= hdmi_mmap,
};

static struct attribute *hdmi_attributes[] = {
};

static struct attribute_group hdmi_attribute_group = {
	.name = "attr",
	.attrs = hdmi_attributes
};

/*******************************************************
Function:
	Driver Install function.
Input:
	None.
Output:
	Executive Outcomes. 0---succeed.
********************************************************/
static int __init it6612_init(void)
{
	int ret = 0, err;
	printinfo("it6612 init:*************************\n");

	/*Create and add a character device*/
	alloc_chrdev_region(&devid, 0, 1, "hdmi");/*corely for device number*/
	hdmi_cdev = cdev_alloc();
	cdev_init(hdmi_cdev, &hdmi_fops);
	hdmi_cdev->owner = THIS_MODULE;
	err = cdev_add(hdmi_cdev, devid, 1);/*/proc/device/hdmi*/
	if (err) {
		pr_err("Error: hdmi cdev_add fail.\n");
		return -1;
	}

	/*Create a path: sys/class/hdmi*/
	hdmi_class = class_create(THIS_MODULE, "hdmi");
	if (IS_ERR(hdmi_class)) {
		pr_err("Error:hdmi class_create fail\n");
		return -1;
	}

	/*Create a path "sys/class/hdmi/hdmi"*/
	hdev = device_create(hdmi_class, NULL, devid, NULL, "hdmi");

	/*Create a path: sys/class/hdmi/hdmi/attr*/
	ret = sysfs_create_group(&hdev->kobj, &hdmi_attribute_group);
	if (ret)
		pr_err("Error: hdmi sysfs_create_group failed!\n");


	ret = platform_device_register(&it6612_device);
	if (ret !=  0)
		pr_err("Failed to register it6612 platform device : %d \n", ret);

	if (ret == 0) {
		ret = platform_driver_register(&it6612_driver);
		if (ret !=  0)
			pr_err("Failed to register it6612 platform driver : %d \n", ret);
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
static void __exit it6612_exit(void)
{
	platform_driver_unregister(&it6612_driver);
	platform_device_unregister(&it6612_device);

	sysfs_remove_group(&hdev->kobj, &hdmi_attribute_group);
	device_destroy(hdmi_class, devid);

	class_destroy(hdmi_class);
	cdev_del(hdmi_cdev);
}

module_init(it6612_init);
module_exit(it6612_exit);

MODULE_AUTHOR("<cuishang@allwinnertech.com>");
MODULE_DESCRIPTION("IT6612 Driver");
MODULE_LICENSE("GPL");

