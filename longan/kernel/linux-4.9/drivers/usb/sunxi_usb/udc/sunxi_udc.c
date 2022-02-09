/*
 * drivers/usb/sunxi_usb/udc/sunxi_udc.c
 * (C) Copyright 2010-2015
 * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
 * javen, 2010-3-3, create this file
 *
 * usb device contoller driver
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/delay.h>
#include <linux/ioport.h>
#include <linux/sched.h>
#include <linux/slab.h>
#include <linux/errno.h>
#include <linux/init.h>
#include <linux/timer.h>
#include <linux/list.h>
#include <linux/interrupt.h>
#include <linux/platform_device.h>
#include <linux/clk.h>
#include <linux/dma-mapping.h>

#include <linux/debugfs.h>
#include <linux/seq_file.h>

#include <asm/byteorder.h>
#include <asm/io.h>
#include <asm/irq.h>
#include <asm/unaligned.h>

#include  "sunxi_udc_config.h"
#include  "sunxi_udc_board.h"

#include  "sunxi_udc_debug.h"
#include  "sunxi_udc_dma.h"
#include  <linux/of.h>
#include  <linux/of_address.h>
#include  <linux/of_device.h>
#include  <linux/dma-mapping.h>

#if defined(CONFIG_AW_AXP)
#include <linux/power/axp_depend.h>
#elif defined(CONFIG_POWER_SUPPLY)
#include <linux/power_supply.h>
#endif

#include  <linux/wakelock.h>

#define DRIVER_DESC	"SoftWinner USB Device Controller"
#define DRIVER_VERSION	"20080411"
#define DRIVER_AUTHOR	"SoftWinner USB Developer"

char g_androidboot_mode[10];
u32 Is_Charger_Mode;
#define ANDROIDBOOT_MODE "androidboot.mode"
#define CHARGE_MODE "charger"
static struct wake_lock udc_wake_lock;

static const char	gadget_name[] = "sunxi_usb_udc";
static const char	driver_desc[] = DRIVER_DESC;

static u64 sunxi_udc_mask = DMA_BIT_MASK(64);

static struct sunxi_udc	*the_controller;
static u32 usbd_port_no;
static sunxi_udc_io_t g_sunxi_udc_io;
static u32 usb_connect;
static u32 is_controller_alive;
static u8 is_udc_enable;   /* is udc enable by gadget? */

static struct platform_device *g_udc_pdev;

static __u32 dma_working;

static __u8 first_enable = 1;

#define	DMA_ADDR_INVALID	(~(dma_addr_t)0)

static u8 crq_bRequest;
static u8 crq_wIndex;
static const unsigned char TestPkt[54] = {
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAA,
	0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xEE, 0xEE, 0xEE,
	0xEE, 0xEE, 0xEE, 0xEE, 0xEE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF,
	0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x7F, 0xBF, 0xDF,
	0xEF, 0xF7, 0xFB, 0xFD, 0xFC, 0x7E, 0xBF, 0xDF, 0xEF, 0xF7,
	0xFB, 0xFD, 0x7E, 0x00
};

/* debug */
unsigned static int g_queue_debug;
int g_dma_debug;
unsigned static int g_write_debug;
unsigned static int g_read_debug;
unsigned static int g_irq_debug;
unsigned static int g_msc_write_debug;
unsigned static int g_msc_read_debug;



static ssize_t show_ed_test(struct device *dev,
		struct device_attribute *attr, char *buf)
{

	return sprintf(buf, "%u\n", g_queue_debug);
}

static ssize_t ed_test(struct device *dev,
		struct device_attribute *attr,
		const char *buf, size_t count)
{
	void __iomem *fifo = NULL;

	if (!strncmp(buf, "test_j_state", 12)) {
		USBC_EnterMode_Test_J(g_sunxi_udc_io.usb_bsp_hdle);
		DMSG_INFO("test_mode:%s\n", "test_j_state");
	} else if (!strncmp(buf, "test_k_state", 12)) {
		USBC_EnterMode_Test_K(g_sunxi_udc_io.usb_bsp_hdle);
		DMSG_INFO("test_mode:%s\n", "test_k_state");
	} else if (!strncmp(buf, "test_se0_nak", 12)) {
		USBC_EnterMode_Test_SE0_NAK(g_sunxi_udc_io.usb_bsp_hdle);
		DMSG_INFO("test_mode:%s\n", "test_se0_nak");
	} else if (!strncmp(buf, "test_pack", 9)) {
		DMSG_INFO("test_mode___:%s\n", "test_pack");
		fifo = USBC_SelectFIFO(g_sunxi_udc_io.usb_bsp_hdle, 0);
		USBC_WritePacket(g_sunxi_udc_io.usb_bsp_hdle,
				fifo, 54, (u32 *)TestPkt);
		USBC_EnterMode_TestPacket(g_sunxi_udc_io.usb_bsp_hdle);
		USBC_Dev_WriteDataStatus(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0, 0);
	} else if (!strncmp(buf, "disable_test_mode", 17)) {
		DMSG_INFO("start disable_test_mode\n");
		USBC_EnterMode_Idle(g_sunxi_udc_io.usb_bsp_hdle);
	} else {
		DMSG_PANIC("ERR: test_mode Argment is invalid\n");
	}

	return count;
}

static DEVICE_ATTR(otg_ed_test, 0644, show_ed_test, ed_test);

static ssize_t show_phy_range(struct device *dev,
		struct device_attribute *attr, char *buf)
{
	return sprintf(buf, "rate:0x%x\n",
			USBC_Phyx_Read(g_sunxi_udc_io.usb_bsp_hdle));
}

static ssize_t udc_phy_range(struct device *dev, struct device_attribute *attr,
		const char *buf, size_t count)
{
	int val = 0;
	int err;

	if (dev == NULL) {
		DMSG_PANIC("ERR: Argment is invalid\n");
		return 0;
	}

	err = kstrtoint(buf, 16, &val);
	if (err != 0)
		return -EINVAL;

	if ((val >= 0x0) && (val <= 0x3ff)) {
		USBC_Phyx_Write(g_sunxi_udc_io.usb_bsp_hdle, val);
	} else {
		DMSG_PANIC("adjust PHY's paraments 0x%x is fail! value:0x0~0x3ff\n", val);
		return count;
	}

	DMSG_INFO("adjust succeed, PHY's paraments:0x%x.\n",
		USBC_Phyx_Read(g_sunxi_udc_io.usb_bsp_hdle));

	return count;
}

static DEVICE_ATTR(otg_phy_range, 0644, show_phy_range, udc_phy_range);


static ssize_t show_udc_debug(struct device *dev,
		struct device_attribute *attr, char *buf)
{
	return sprintf(buf, "%u\n", g_queue_debug);
}

static ssize_t udc_queue_debug(struct device *dev,
		struct device_attribute *attr,
		const char *buf, size_t count)
{
	int debug = 0;
	int ret = 0;

	ret = kstrtoint(buf, 0, &debug);
	if (ret != 0)
		return ret;

	g_queue_debug = debug;

	return count;
}

static DEVICE_ATTR(queue_debug, 0644, show_udc_debug, udc_queue_debug);

static ssize_t show_dma_debug(struct device *dev,
		struct device_attribute *attr, char *buf)
{
	return sprintf(buf, "%d\n", g_dma_debug);
}

static ssize_t udc_dma_debug(struct device *dev,
		struct device_attribute *attr,
		const char *buf, size_t count)
{
	int debug = 0;
	int ret = 0;

	ret = kstrtoint(buf, 0, &debug);
	if (ret != 0)
		return ret;

	g_dma_debug = debug;

	return count;
}

static DEVICE_ATTR(dma_debug, 0644, show_dma_debug, udc_dma_debug);

static ssize_t show_write_debug(struct device *dev,
		struct device_attribute *attr, char *buf)
{
	return sprintf(buf, "%u\n", g_write_debug);
}

static ssize_t udc_write_debug(struct device *dev,
		struct device_attribute *attr,
		const char *buf, size_t count)
{
	int debug = 0;
	int ret = 0;

	ret = kstrtoint(buf, 0, &debug);
	if (ret != 0)
		return ret;

	g_write_debug = debug;

	return count;
}

static DEVICE_ATTR(write_debug, 0644, show_write_debug, udc_write_debug);

static ssize_t show_read_debug(struct device *dev,
		struct device_attribute *attr, char *buf)
{
	return sprintf(buf, "%u\n", g_read_debug);
}

static ssize_t udc_read_debug(struct device *dev,
		struct device_attribute *attr,
		const char *buf, size_t count)
{
	int debug = 0;
	int ret = 0;

	ret = kstrtoint(buf, 0, &debug);
	if (ret != 0)
		return ret;

	g_read_debug = debug;

	return count;
}

static DEVICE_ATTR(read_debug, 0644, show_read_debug, udc_read_debug);

static ssize_t show_irq_debug(struct device *dev,
		struct device_attribute *attr, char *buf)
{
	return sprintf(buf, "%u\n", g_irq_debug);
}

static ssize_t udc_irq_debug(struct device *dev,
		struct device_attribute *attr,
		const char *buf, size_t count)
{
	int debug = 0;
	int ret = 0;

	ret = kstrtoint(buf, 0, &debug);
	if (ret != 0)
		return ret;

	g_irq_debug = debug;

	return count;
}

static DEVICE_ATTR(irq_debug, 0644, show_irq_debug, udc_irq_debug);

static ssize_t show_msc_write_debug(struct device *dev,
		struct device_attribute *attr, char *buf)
{
	return sprintf(buf, "%u\n", g_msc_write_debug);
}

static ssize_t udc_msc_write_debug(struct device *dev,
		struct device_attribute *attr,
		const char *buf, size_t count)
{
	int debug = 0;
	int ret = 0;

	ret = kstrtoint(buf, 0, &debug);
	if (ret != 0)
		return ret;

	g_msc_write_debug = debug;

	return count;
}

static DEVICE_ATTR(msc_write_debug, 0644,
		show_msc_write_debug, udc_msc_write_debug);

static ssize_t show_msc_read_debug(struct device *dev,
		struct device_attribute *attr, char *buf)
{
	return sprintf(buf, "%u\n", g_msc_read_debug);
}

static ssize_t udc_msc_read_debug(struct device *dev,
		struct device_attribute *attr,
		const char *buf, size_t count)
{
	int debug = 0;
	int ret = 0;

	ret = kstrtoint(buf, 0, &debug);
	if (ret != 0)
		return ret;

	g_msc_read_debug = debug;

	return count;
}

static DEVICE_ATTR(msc_read_debug, 0644,
		show_msc_read_debug, udc_msc_read_debug);

/* function defination */
static void cfg_udc_command(enum sunxi_udc_cmd_e cmd);
static void cfg_vbus_draw(unsigned int ma);

static __u32 is_peripheral_active(void)
{
	return is_controller_alive;
}

/**
 * DMA transfer conditions:
 * 1. the driver support dma transfer
 * 2. not EP0
 * 3. more than one packet
 */
#define  big_req(req, ep)	((req->req.length != req->req.actual) \
				? ((req->req.length - req->req.actual) \
				> ep->ep.maxpacket) \
				: (req->req.length > ep->ep.maxpacket))
#define  is_sunxi_udc_dma_capable(req, ep)	(is_udc_support_dma() \
						&& big_req(req, ep) \
						&& req->req.dma_flag \
						&& ep->num)

#define is_buffer_mapped(req, ep)	(is_sunxi_udc_dma_capable(req, ep) \
					&& (req->map_state != UN_MAPPED))

void sunxi_set_cur_vol_work(struct work_struct *work)
{
#if !defined(CONFIG_AW_AXP) && defined(CONFIG_POWER_SUPPLY)
	struct power_supply *psy = NULL;
	union power_supply_propval temp;
#endif

#if defined CONFIG_AW_AXP && !defined SUNXI_USB_FPGA
		axp_usbvol(CHARGE_USB_20);
		axp_usbcur(CHARGE_USB_20);
#elif defined CONFIG_POWER_SUPPLY && !defined SUNXI_USB_FPGA
	if (of_find_property(g_udc_pdev->dev.of_node, "det_vbus_supply", NULL))
		psy = devm_power_supply_get_by_phandle(&g_udc_pdev->dev,
						     "det_vbus_supply");

	if (!psy || IS_ERR(psy)) {
		DMSG_PANIC("%s()%d WARN: get power supply failed\n",
			   __func__, __LINE__);
	} else {
		temp.intval = 500;

		power_supply_set_property(psy,
					POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT, &temp);
	}
#endif
}

/* Maps the buffer to dma */
static inline void sunxi_udc_map_dma_buffer(
		struct sunxi_udc_request *req,
		struct sunxi_udc *udc,
		struct sunxi_udc_ep *ep)
{
	if (!is_sunxi_udc_dma_capable(req, ep)) {
		DMSG_PANIC("err: need not to dma map\n");
		return;
	}

	req->map_state = UN_MAPPED;

	if (req->req.dma == DMA_ADDR_INVALID) {
		req->req.dma = dma_map_single(
					udc->controller,
					req->req.buf,
					req->req.length,
					(is_tx_ep(ep) ? DMA_TO_DEVICE
							: DMA_FROM_DEVICE));
		if (dma_mapping_error(udc->controller,
						req->req.dma)){
			DMSG_PANIC("dma_mapping_error, %p, %x\n",
				req->req.buf, req->req.length);
			return;
		}
		req->map_state = SW_UDC_USB_MAPPED;
	} else {
		dma_sync_single_for_device(udc->controller,
			req->req.dma,
			req->req.length,
			(is_tx_ep(ep) ? DMA_TO_DEVICE : DMA_FROM_DEVICE));
			req->map_state = PRE_MAPPED;
	}
}

/* Unmap the buffer from dma and maps it back to cpu */
static inline void sunxi_udc_unmap_dma_buffer(
		struct sunxi_udc_request *req,
		struct sunxi_udc *udc,
		struct sunxi_udc_ep *ep)
{
	if (!is_buffer_mapped(req, ep))
		return;

	if (req->req.dma == DMA_ADDR_INVALID) {
		DMSG_PANIC("not unmapping a never mapped buffer\n");
		return;
	}

	if (req->map_state == SW_UDC_USB_MAPPED) {
		dma_unmap_single(udc->controller,
			req->req.dma,
			req->req.length,
			(is_tx_ep(ep) ? DMA_TO_DEVICE : DMA_FROM_DEVICE));

		req->req.dma = DMA_ADDR_INVALID;
	} else { /* PRE_MAPPED */
		dma_sync_single_for_cpu(udc->controller,
			req->req.dma,
			req->req.length,
			(is_tx_ep(ep) ? DMA_TO_DEVICE : DMA_FROM_DEVICE));
	}

	req->map_state = UN_MAPPED;
}

static void sunxi_udc_done(struct sunxi_udc_ep *ep,
		struct sunxi_udc_request *req, int status)
__releases(ep->dev->lock)
__acquires(ep->dev->lock)
{
	unsigned halted = ep->halted;

	if (g_queue_debug) {
		DMSG_INFO("d: (%s, %p, %d, %d)\n\n\n", ep->ep.name,
				&(req->req), req->req.length, req->req.actual);
	}

	list_del_init(&req->queue);

	if (likely(req->req.status == -EINPROGRESS))
		req->req.status = status;
	else
		status = req->req.status;

	ep->halted = 1;
	if (is_sunxi_udc_dma_capable(req, ep)) {
		spin_unlock(&ep->dev->lock);
		sunxi_udc_unmap_dma_buffer(req, ep->dev, ep);
		req->req.complete(&ep->ep, &req->req);
		spin_lock(&ep->dev->lock);
	} else {
		spin_unlock(&ep->dev->lock);
		req->req.complete(&ep->ep, &req->req);
		spin_lock(&ep->dev->lock);
	}

	ep->halted = halted;
}

static void sunxi_udc_nuke(struct sunxi_udc *udc,
		struct sunxi_udc_ep *ep, int status)
{
	/* Sanity check */
	if (&ep->queue == NULL)
		return;

	while (!list_empty(&ep->queue)) {
		struct sunxi_udc_request *req;

		req = list_entry(ep->queue.next,
				struct sunxi_udc_request, queue);
		DMSG_INFO_UDC("nuke: ep num is %d\n", ep->num);
		sunxi_udc_done(ep, req, status);
	}
}

static inline void sunxi_udc_clear_ep_state(struct sunxi_udc *dev)
{
	unsigned i = 0;

	/**
	 * hardware SET_{CONFIGURATION,INTERFACE} automagic resets endpoint
	 * fifos, and pending transactions mustn't be continued in any case.
	 */
	for (i = 1; i < SW_UDC_ENDPOINTS; i++)
		sunxi_udc_nuke(dev, &dev->ep[i], -ECONNABORTED);
}

static inline int sunxi_udc_fifo_count_out(__hdle usb_bsp_hdle, __u8 ep_index)
{
	if (ep_index) {
		return USBC_ReadLenFromFifo(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_RX);
	} else {
		return USBC_ReadLenFromFifo(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0);
	}
}

static inline int sunxi_udc_write_packet(void __iomem *fifo,
					struct sunxi_udc_request *req,
					unsigned max)
{
	unsigned len = min(req->req.length - req->req.actual, max);
	void *buf = req->req.buf + req->req.actual;

	prefetch(buf);

	DMSG_DBG_UDC("W: req.actual(%d), req.length(%d), len(%d), total(%d)\n",
		req->req.actual, req->req.length, len, req->req.actual + len);

	req->req.actual += len;

	udelay(5);
	USBC_WritePacket(g_sunxi_udc_io.usb_bsp_hdle, fifo, len, buf);

	return len;
}

static int pio_write_fifo(struct sunxi_udc_ep *ep,
		struct sunxi_udc_request *req)
{
	unsigned	count		= 0;
	int		is_last		= 0;
	u32		idx		= 0;
	void __iomem    *fifo_reg	= 0;
	__s32		ret		= 0;
	u8		old_ep_index	= 0;

	idx = ep->bEndpointAddress & 0x7F;

	/* write data */

	/* select ep */
	old_ep_index = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, idx);

	/* select fifo */
	fifo_reg = USBC_SelectFIFO(g_sunxi_udc_io.usb_bsp_hdle, idx);

	count = sunxi_udc_write_packet(fifo_reg, req, ep->ep.maxpacket);

	/* check if the last packet */

	/* last packet is often short (sometimes a zlp) */
	if (count != ep->ep.maxpacket)
		is_last = 1;
	else if (req->req.length != req->req.actual || req->req.zero)
		is_last = 0;
	else
		is_last = 2;

	if (g_write_debug) {
		DMSG_INFO("pw: (0x%p, %d, %d)\n",
			&(req->req), req->req.length, req->req.actual);
	}

	if (idx) { /* ep1~4 */
		ret = USBC_Dev_WriteDataStatus(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_TX, is_last);
		if (ret != 0) {
			DMSG_PANIC("ERR: USBC_Dev_WriteDataStatus, failed\n");
			req->req.status = -EOVERFLOW;
		}
	} else {  /* ep0 */
		ret = USBC_Dev_WriteDataStatus(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0, is_last);
		if (ret != 0) {
			DMSG_PANIC("ERR: USBC_Dev_WriteDataStatus, failed\n");
			req->req.status = -EOVERFLOW;
		}
	}

	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_index);

	if (is_last) {
		if (!idx) {  /* ep0 */
			ep->dev->ep0state = EP0_IDLE;
		}

		sunxi_udc_done(ep, req, 0);
		is_last = 1;
	}

	return is_last;
}

static int dma_write_fifo(struct sunxi_udc_ep *ep,
		struct sunxi_udc_request *req)
{
	u32	left_len	= 0;
	u32	idx		= 0;
	void __iomem  *fifo_reg	= 0;
	u8	old_ep_index	= 0;

	idx = ep->bEndpointAddress & 0x7F;

	/* select ep */
	old_ep_index = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, idx);

	/* select fifo */
	fifo_reg = USBC_SelectFIFO(g_sunxi_udc_io.usb_bsp_hdle, idx);

	/* auto_set, tx_mode, dma_tx_en, mode1 */
	USBC_Dev_ConfigEpDma(
			ep->dev->sunxi_udc_io->usb_bsp_hdle,
			USBC_EP_TYPE_TX);

	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_index);

	/* cut fragment part(??) */
	left_len = req->req.length - req->req.actual;
	left_len = left_len - (left_len % ep->ep.maxpacket);

	ep->dma_working	= 1;
	dma_working = 1;
	ep->dma_transfer_len = left_len;

	spin_unlock(&ep->dev->lock);

	sunxi_udc_dma_set_config(ep, req, (__u32)req->req.dma, left_len);
	sunxi_udc_dma_start(ep, fifo_reg, (__u32)req->req.dma, left_len);
	spin_lock(&ep->dev->lock);

	return 0;
}

/* return: 0 = still running, 1 = completed, negative = errno */
static int sunxi_udc_write_fifo(struct sunxi_udc_ep *ep,
		struct sunxi_udc_request *req)
{
	if (ep->dma_working) {
		if (g_dma_debug) {
			struct sunxi_udc_request *req_next = NULL;

			DMSG_PANIC("ERR: dma is busy, write fifo. ep(0x%p, %d), req(0x%p, 0x%p, 0x%p, %d, %d)\n\n",
				ep, ep->num,
				req, &(req->req),
				req->req.buf,
				req->req.length,
				req->req.actual);

			if (likely(!list_empty(&ep->queue)))
				req_next = list_entry(ep->queue.next,
						struct sunxi_udc_request,
						queue);
			else
				req_next = NULL;

			if (req_next) {
				DMSG_PANIC("ERR: dma is busy, write fifo. req(0x%p, 0x%p, 0x%p, %d, %d)\n\n",
					req_next,
					&(req_next->req),
					req_next->req.buf,
					req_next->req.length,
					req_next->req.actual);
			}
		}
		return 0;
	}

	if (is_sunxi_udc_dma_capable(req, ep))
		return dma_write_fifo(ep, req);
	else
		return pio_write_fifo(ep, req);
}

static inline int sunxi_udc_read_packet(void __iomem *fifo,
		void *buf, struct sunxi_udc_request *req, unsigned avail)
{
	unsigned len = 0;

	len = min(req->req.length - req->req.actual, avail);
	req->req.actual += len;

	DMSG_DBG_UDC("R: req.actual(%d), req.length(%d), len(%d), total(%d)\n",
		req->req.actual, req->req.length, len, req->req.actual + len);

	USBC_ReadPacket(g_sunxi_udc_io.usb_bsp_hdle, fifo, len, buf);

	return len;
}

/* return: 0 = still running, 1 = completed, negative = errno */
static int pio_read_fifo(struct sunxi_udc_ep *ep, struct sunxi_udc_request *req)
{
	void		*buf		= NULL;
	unsigned	bufferspace	= 0;
	int		is_last		= 1;
	unsigned	avail		= 0;
	int		fifo_count	= 0;
	u32		idx		= 0;
	void __iomem	*fifo_reg	= 0;
	__s32		ret		= 0;
	u8		old_ep_index	= 0;

	idx = ep->bEndpointAddress & 0x7F;

	/* select fifo */
	fifo_reg = USBC_SelectFIFO(g_sunxi_udc_io.usb_bsp_hdle, idx);

	if (!req->req.length) {
		DMSG_PANIC("ERR: req->req.length == 0\n");
		return 1;
	}

	buf = req->req.buf + req->req.actual;
	bufferspace = req->req.length - req->req.actual;
	if (!bufferspace) {
		DMSG_PANIC("ERR: buffer full!\n");
		return -1;
	}

	/* select ep */
	old_ep_index = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, idx);

	fifo_count = sunxi_udc_fifo_count_out(g_sunxi_udc_io.usb_bsp_hdle, idx);
	if (fifo_count > ep->ep.maxpacket)
		avail = ep->ep.maxpacket;
	else
		avail = fifo_count;

	fifo_count = sunxi_udc_read_packet(fifo_reg, buf, req, avail);

	/**
	 * checking this with ep0 is not accurate as we already
	 * read a control request
	 */
	if (idx != 0 && fifo_count < ep->ep.maxpacket) {
		is_last = 1;
		/* overflowed this request? flush extra data */
		if (fifo_count != avail)
			req->req.status = -EOVERFLOW;
	} else {
		is_last = (req->req.length <= req->req.actual) ? 1 : 0;
	}

	if (g_read_debug) {
		DMSG_INFO("pr: (0x%p, %d, %d)\n",
				&(req->req), req->req.length, req->req.actual);
	}

	if (idx) {
		ret = USBC_Dev_ReadDataStatus(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_RX, is_last);
		if (ret != 0) {
			DMSG_PANIC("ERR: pio_read_fifo: ");
			DMSG_PANIC("USBC_Dev_WriteDataStatus, failed\n");
			req->req.status = -EOVERFLOW;
		}
	} else {
		ret = USBC_Dev_ReadDataStatus(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0, is_last);
		if (ret != 0) {
			DMSG_PANIC("ERR: pio_read_fifo: ");
			DMSG_PANIC("USBC_Dev_WriteDataStatus, failed\n");
			req->req.status = -EOVERFLOW;
		}
	}

	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_index);

	if (is_last) {
		if (!idx)
			ep->dev->ep0state = EP0_IDLE;

		sunxi_udc_done(ep, req, 0);
		is_last = 1;
	}

	return is_last;
}

static int dma_read_fifo(struct sunxi_udc_ep *ep, struct sunxi_udc_request *req)
{
	u32	left_len	= 0;
	u32	idx		= 0;
	void __iomem *fifo_reg	= 0;
	u8	old_ep_index	= 0;

	idx = ep->bEndpointAddress & 0x7F;

	/* select ep */
	old_ep_index = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, idx);

	/* select fifo */
	fifo_reg = USBC_SelectFIFO(g_sunxi_udc_io.usb_bsp_hdle, idx);

	/* auto_set, tx_mode, dma_tx_en, mode1 */
	USBC_Dev_ConfigEpDma(
			ep->dev->sunxi_udc_io->usb_bsp_hdle, USBC_EP_TYPE_RX);

	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_index);

	/* cut fragment packet part */
	left_len = req->req.length - req->req.actual;
	left_len = left_len - (left_len % ep->ep.maxpacket);

	if (g_dma_debug) {
		DMSG_INFO("dr: (0x%p, %d, %d)\n", &(req->req),
				req->req.length, req->req.actual);
	}

	ep->dma_working	= 1;
	dma_working = 1;
	ep->dma_transfer_len = left_len;

	spin_unlock(&ep->dev->lock);

	sunxi_udc_dma_set_config(ep, req, (__u32)req->req.dma, left_len);
	sunxi_udc_dma_start(ep, fifo_reg, (__u32)req->req.dma, left_len);
	spin_lock(&ep->dev->lock);

	return 0;
}

/*
 * If dma is working, RxPktRdy should be clear automatically.
 * If not, we consider a short packet comes in and we will
 * deal with it then.
 *
 * FIXME: The longest time to confirm is up to (5us * 1000).
 */
static int sunxi_udc_confirm_rx_ready(void)
{
	int i = 0;
	int rx_ready_flag = 1;

	for (i = 0; i < 1000; i++) {
		if (!USBC_Dev_IsReadDataReady(g_sunxi_udc_io.usb_bsp_hdle, USBC_EP_TYPE_RX)) {
			rx_ready_flag = 0;
			break;
		}
		udelay(5);
	}
	DMSG_DBG_UDC("[confirm rx ready] rx_ready_flag = %d, i = %d\n",
			rx_ready_flag, i);

	return rx_ready_flag;
}

static int dma_got_short_pkt(struct sunxi_udc_ep *ep, struct sunxi_udc_request *req)
{
	dma_channel_t *pchan = NULL;
	int dma_bc = 0;
	int dma_r_bc = 0;
	int fifo_count = 0;
	unsigned long flags = 0;

	pchan = (dma_channel_t *)ep->dev->dma_hdle;
	if (pchan == NULL) {
		DMSG_DBG_UDC("[dma_got_short_pkt] dma_hdle is NULL!\n");
		return 0;
	}

	dma_bc = USBC_Readw(USBC_REG_DMA_BC(pchan->reg_base, pchan->channel_num));
	dma_r_bc = USBC_Readw(USBC_REG_DMA_RESIDUAL_BC(pchan->reg_base, pchan->channel_num));
	fifo_count = USBC_ReadLenFromFifo(g_sunxi_udc_io.usb_bsp_hdle, USBC_EP_TYPE_RX);

	DMSG_DBG_UDC("read_fifo: dma_working... rx_cnt = %d, dma_channel = %d, dma_bc = %d, dma_r_bc = %d\n",
			fifo_count, pchan->channel_num, dma_bc, dma_r_bc);

	if (!sunxi_udc_confirm_rx_ready())
		return 0;

	/*
	 * rx fifo got a short packet, reassign the transfer len
	 */
	if (fifo_count > 0 && fifo_count < ep->ep.maxpacket) {
		req->req.length = dma_bc - dma_r_bc + fifo_count;
		ep->dma_transfer_len = dma_bc - dma_r_bc;
		DMSG_DBG_UDC("reassign: req.length = %d, req.actual = %d, ep->dma_transfer_len = %d\n",
				req->req.length, req->req.actual, ep->dma_transfer_len);

		/*
		 * we need to stop dma manually
		 */
		sunxi_udc_dma_chan_disable((dm_hdl_t)ep->dev->dma_hdle);
		sunxi_udc_dma_release((dm_hdl_t)ep->dev->dma_hdle);
		ep->dev->dma_hdle = NULL;

		spin_unlock_irqrestore(&ep->dev->lock, flags);
		sunxi_udc_dma_completion(ep->dev, ep, req);
		spin_lock_irqsave(&ep->dev->lock, flags);

		return 1;
	}

	return 0;
}

/* return: 0 = still running, 1 = completed, negative = errno */
static int sunxi_udc_read_fifo(struct sunxi_udc_ep *ep,
		struct sunxi_udc_request *req)
{
	if (ep->dma_working) {
		if (dma_got_short_pkt(ep, req))
			return 1;

		if (g_dma_debug) {
			struct sunxi_udc_request *req_next = NULL;

			DMSG_PANIC("ERR: dma is busy, read fifo. ep(0x%p, %d), req(0x%p, 0x%p, 0x%p, %d, %d)\n\n",
				ep,
				ep->num,
				req,
				&(req->req),
				req->req.buf,
				req->req.length,
				req->req.actual);

			if (likely(!list_empty(&ep->queue)))
				req_next = list_entry(ep->queue.next,
						struct sunxi_udc_request,
						queue);
			else
				req_next = NULL;

			if (req_next) {
				DMSG_PANIC("ERR: dma is busy, read fifo. req(0x%p, 0x%p, 0x%p, %d, %d)\n\n",
					req_next,
					&(req_next->req),
					req_next->req.buf,
					req_next->req.length,
					req_next->req.actual);
			}
		}
		return 0;
	}

	if (is_sunxi_udc_dma_capable(req, ep))
		return dma_read_fifo(ep, req);
	else
		return pio_read_fifo(ep, req);
}

static int sunxi_udc_read_fifo_crq(struct usb_ctrlrequest *crq)
{
	u32 fifo_count  = 0;
	u32 i		= 0;
	void *pOut	= crq;
	void __iomem *fifo = 0;

	fifo = USBC_SelectFIFO(g_sunxi_udc_io.usb_bsp_hdle, 0);
	fifo_count = USBC_ReadLenFromFifo(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0);

	if (fifo_count != 8) {
		i = 0;

		while (i < 16 && (fifo_count != 8)) {
			fifo_count = USBC_ReadLenFromFifo(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_EP0);
			i++;
		}

		if (i >= 16)
			DMSG_PANIC("ERR: get ep0 fifo len failed\n");
	}

	return USBC_ReadPacket(g_sunxi_udc_io.usb_bsp_hdle,
			fifo, fifo_count, pOut);
}

static int sunxi_udc_get_status(struct sunxi_udc *dev,
		struct usb_ctrlrequest *crq)
{
	u16 status  = 0;
	u8  buf[8];
	u8  ep_num  = crq->wIndex & 0x7F;
	u8  is_in   = crq->wIndex & USB_DIR_IN;
	void __iomem *fifo = 0;
	u8 old_ep_index = 0;
	int  ret = 0;

	switch (crq->bRequestType & USB_RECIP_MASK) {
	case USB_RECIP_INTERFACE:
		buf[0] = 0x00;
		buf[1] = 0x00;
		break;

	case USB_RECIP_DEVICE:
		status = dev->devstatus;
		buf[0] = 0x01;
		buf[1] = 0x00;
		break;

	case USB_RECIP_ENDPOINT:
		if (ep_num > 4 || crq->wLength > 2)
			return 1;

		old_ep_index = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);
		USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, ep_num);
		if (ep_num == 0) {
			status = USBC_Dev_IsEpStall(
					g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_EP0);
		} else {
			if (is_in) {
				ret = readw(g_sunxi_udc_io.usb_vbase
						+ USBC_REG_o_TXCSR);
				status = ret & (0x1 << USBC_BP_TXCSR_D_SEND_STALL);
			} else {
				ret = readw(g_sunxi_udc_io.usb_vbase
						+ USBC_REG_o_RXCSR);
				status = ret & (0x1 << USBC_BP_RXCSR_D_SEND_STALL);
			}
		}
		status = status ? 1 : 0;
		if (status) {
			buf[0] = 0x01;
			buf[1] = 0x00;
		} else {
			buf[0] = 0x00;
			buf[1] = 0x00;
		}
		USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_index);
		break;

	default:
		return 1;
	}

	/* Seems to be needed to get it working. ouch :( */
	udelay(5);
	USBC_Dev_ReadDataStatus(
			g_sunxi_udc_io.usb_bsp_hdle,
			USBC_EP_TYPE_EP0, 0);

	fifo = USBC_SelectFIFO(g_sunxi_udc_io.usb_bsp_hdle, 0);
	USBC_WritePacket(g_sunxi_udc_io.usb_bsp_hdle, fifo, crq->wLength, buf);
	USBC_Dev_WriteDataStatus(g_sunxi_udc_io.usb_bsp_hdle,
			USBC_EP_TYPE_EP0, 1);

	return 0;
}

static int sunxi_udc_set_halt(struct usb_ep *_ep, int value);
static int sunxi_udc_set_halt_ex(struct usb_ep *_ep, int value, int is_in);

static void sunxi_udc_handle_ep0_idle(struct sunxi_udc *dev,
						struct sunxi_udc_ep *ep,
						struct usb_ctrlrequest *crq,
						u32 ep0csr)
{
	int len = 0, ret = 0, tmp = 0;
	int is_in = 0;

	/* start control request? */
	if (!USBC_Dev_IsReadDataReady(
			g_sunxi_udc_io.usb_bsp_hdle, USBC_EP_TYPE_EP0)) {
		DMSG_WRN("ERR: data is ready, can not read data.\n");
		return;
	}

	sunxi_udc_nuke(dev, ep, -EPROTO);

	len = sunxi_udc_read_fifo_crq(crq);
	if (len != sizeof(*crq)) {
		USBC_Dev_ReadDataStatus(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0, 0);
		USBC_Dev_EpSendStall(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0);

		return;
	}

	DMSG_DBG_UDC("ep0: bRequest = %d bRequestType %d wLength = %d\n",
		crq->bRequest, crq->bRequestType, crq->wLength);

	/* cope with automagic for some standard requests. */
	dev->req_std = ((crq->bRequestType & USB_TYPE_MASK)
						== USB_TYPE_STANDARD);
	dev->req_config = 0;
	dev->req_pending = 1;

	if (dev->req_std) {   /* standard request */
		switch (crq->bRequest) {
		case USB_REQ_SET_CONFIGURATION:
			DMSG_DBG_UDC("USB_REQ_SET_CONFIGURATION ...\n");

			if (crq->bRequestType == USB_RECIP_DEVICE)
				dev->req_config = 1;
			break;
		case USB_REQ_SET_INTERFACE:
			DMSG_DBG_UDC("USB_REQ_SET_INTERFACE ...\n");

			if (crq->bRequestType == USB_RECIP_INTERFACE)
				dev->req_config = 1;
			break;
		case USB_REQ_SET_ADDRESS:
			DMSG_DBG_UDC("USB_REQ_SET_ADDRESS ...\n");

			if (crq->bRequestType == USB_RECIP_DEVICE) {
				tmp = crq->wValue & 0x7F;
				dev->address = tmp;

				/* rx receive over, dataend, tx_pakect ready */
				USBC_Dev_ReadDataStatus(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_EP0, 1);

				dev->ep0state = EP0_END_XFER;

				crq_bRequest = USB_REQ_SET_ADDRESS;

				return;
			}
			break;
		case USB_REQ_GET_STATUS:
			DMSG_DBG_UDC("USB_REQ_GET_STATUS ...\n");

			if (!sunxi_udc_get_status(dev, crq))
				return;
			break;
		case USB_REQ_CLEAR_FEATURE:
			/* --<1>--data direction must be host to device */
			if (x_test_bit(crq->bRequestType, 7)) {
				DMSG_PANIC("USB_REQ_CLEAR_FEATURE: ");
				DMSG_PANIC("data is not host to device\n");
				break;
			}

			USBC_Dev_ReadDataStatus(
					g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_EP0, 1);

			/* --<3>--data stage */
			if (crq->bRequestType == USB_RECIP_DEVICE) {
				/* wValue 0-1 */
				if (crq->wValue) {
					dev->devstatus &= ~(1 << USB_DEVICE_REMOTE_WAKEUP);
				} else {
					int k = 0;

					for (k = 0; k < SW_UDC_ENDPOINTS; k++) {
						is_in = crq->wIndex & USB_DIR_IN;
						sunxi_udc_set_halt_ex(&dev->ep[k].ep, 0, is_in);
					}
				}

			} else if (crq->bRequestType == USB_RECIP_INTERFACE) {
				/**
				 * --<2>--token stage over
				 * do nothing
				 */
			} else if (crq->bRequestType == USB_RECIP_ENDPOINT) {
				/* --<3>--release the forbidden of ep */
				/* wValue 0-1 */
				if (crq->wValue) {
					dev->devstatus &= ~(1 << USB_DEVICE_REMOTE_WAKEUP);
				} else {
					int k = 0;

					is_in = crq->wIndex & USB_DIR_IN;
					for (k = 0; k < SW_UDC_ENDPOINTS; k++) {
						if (dev->ep[k].bEndpointAddress == (crq->wIndex & 0xff))
							sunxi_udc_set_halt_ex(&dev->ep[k].ep, 0, is_in);
					}
				}

			} else {
				DMSG_PANIC("PANIC : nonsupport set feature request. (%d)\n", crq->bRequestType);
				USBC_Dev_EpSendStall(
					g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_EP0);
			}

			dev->ep0state = EP0_IDLE;

			return;

		case USB_REQ_SET_FEATURE:
			/* --<1>--data direction must be host to device */
			if (x_test_bit(crq->bRequestType, 7)) {
				DMSG_PANIC("USB_REQ_SET_FEATURE: data is not host to device\n");
				break;
			}

			/* --<3>--data stage */
			if (crq->bRequestType == USB_RECIP_DEVICE) {
				if (crq->wValue == USB_DEVICE_TEST_MODE) {
					/* setup packet receive over */
					switch (crq->wIndex) {
					case SUNXI_UDC_TEST_J:
						USBC_Dev_ReadDataStatus(g_sunxi_udc_io.usb_bsp_hdle, USBC_EP_TYPE_EP0, 1);
						dev->ep0state = EP0_END_XFER;
						crq_wIndex = TEST_J;
						crq_bRequest = USB_REQ_SET_FEATURE;
						return;
					case SUNXI_UDC_TEST_K:
						USBC_Dev_ReadDataStatus(g_sunxi_udc_io.usb_bsp_hdle, USBC_EP_TYPE_EP0, 1);
						dev->ep0state = EP0_END_XFER;
						crq_wIndex = TEST_K;
						crq_bRequest = USB_REQ_SET_FEATURE;
						return;
					case SUNXI_UDC_TEST_SE0_NAK:
						USBC_Dev_ReadDataStatus(g_sunxi_udc_io.usb_bsp_hdle, USBC_EP_TYPE_EP0, 1);
						dev->ep0state = EP0_END_XFER;
						crq_wIndex = TEST_SE0_NAK;
						crq_bRequest = USB_REQ_SET_FEATURE;
						return;
					case SUNXI_UDC_TEST_PACKET:
						USBC_Dev_ReadDataStatus(g_sunxi_udc_io.usb_bsp_hdle, USBC_EP_TYPE_EP0, 1);
						dev->ep0state = EP0_END_XFER;
						crq_wIndex = TEST_PACKET;
						crq_bRequest = USB_REQ_SET_FEATURE;
						return;
					default:
						break;
					}
				}

				USBC_Dev_ReadDataStatus(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_EP0, 1);
				dev->devstatus |= (1 << USB_DEVICE_REMOTE_WAKEUP);
			} else if (crq->bRequestType == USB_RECIP_INTERFACE) {
				/* --<2>--token stage over */
				USBC_Dev_ReadDataStatus(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_EP0, 1);
				/* do nothing */
			} else if (crq->bRequestType == USB_RECIP_ENDPOINT) {
				/* --<3>--forbidden ep */
				int k = 0;

				is_in = crq->wIndex & USB_DIR_IN;
				USBC_Dev_ReadDataStatus(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_EP0, 1);
				for (k = 0; k < SW_UDC_ENDPOINTS; k++) {
					if (dev->ep[k].bEndpointAddress == (crq->wIndex & 0xff))
						sunxi_udc_set_halt_ex(&dev->ep[k].ep, 1, is_in);
				}

			} else {
				DMSG_PANIC("PANIC : nonsupport set feature request. (%d)\n", crq->bRequestType);

				USBC_Dev_ReadDataStatus(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_EP0, 1);
				USBC_Dev_EpSendStall(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_EP0);
			}

			dev->ep0state = EP0_IDLE;

			return;

		default:
			/* only receive setup_data packet, cannot set DataEnd */
			USBC_Dev_ReadDataStatus(
					g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_EP0, 0);
			break;
		}
	} else {
		USBC_Dev_ReadDataStatus(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0, 0);
#if defined(CONFIG_USB_G_WEBCAM) || defined(CONFIG_USB_CONFIGFS_F_UVC)
		/**
		 * getinfo request about exposure time asolute,
		 * iris absolute, brightness of webcam.
		 */
		if (crq->bRequest == 0x86
		    && crq->bRequestType == 0xa1
		    && crq->wLength == 0x1
		    && ((crq->wValue == 0x400 && crq->wIndex == 0x100)
			|| (crq->wValue == 0x900 && crq->wIndex == 0x100)
			|| (crq->wValue == 0x200 && crq->wIndex == 0x200))) {
			USBC_Dev_EpSendStall(g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_EP0);
			return;
		}
#endif
	}

	if (crq->bRequestType & USB_DIR_IN)
		dev->ep0state = EP0_IN_DATA_PHASE;
	else
		dev->ep0state = EP0_OUT_DATA_PHASE;

	if (!dev->driver)
		return;

	spin_unlock(&dev->lock);
	ret = dev->driver->setup(&dev->gadget, crq);
	spin_lock(&dev->lock);
	if (ret < 0) {
		if (dev->req_config) {
			DMSG_PANIC("ERR: config change %02x fail %d?\n",
				crq->bRequest, ret);
			return;
		}

		if (ret == -EOPNOTSUPP)
			DMSG_PANIC("ERR: Operation not supported\n");
		else
			DMSG_PANIC("ERR: dev->driver->setup failed. (%d)\n",
				ret);

		udelay(5);

		USBC_Dev_ReadDataStatus(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0, 1);
		USBC_Dev_EpSendStall(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0);

		dev->ep0state = EP0_IDLE;
		/* deferred i/o == no response yet */
	} else if (dev->req_pending) {
		dev->req_pending = 0;
	}

	if (crq->bRequest == USB_REQ_SET_CONFIGURATION
			|| crq->bRequest == USB_REQ_SET_INTERFACE) {
		/* rx_packet receive over */
		USBC_Dev_ReadDataStatus(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0, 1);
	}
}

static void sunxi_udc_handle_ep0(struct sunxi_udc *dev)
{
	u32 ep0csr = 0;
	struct sunxi_udc_ep *ep = &dev->ep[0];
	struct sunxi_udc_request *req = NULL;
	struct usb_ctrlrequest crq;

	DMSG_DBG_UDC("sunxi_udc_handle_ep0--1--\n");

	if (list_empty(&ep->queue))
		req = NULL;
	else
		req = list_entry(ep->queue.next,
				struct sunxi_udc_request, queue);

	DMSG_DBG_UDC("sunxi_udc_handle_ep0--2--\n");

	/**
	 * We make the assumption that sunxi_udc_UDC_IN_CSR1_REG equal to
	 * sunxi_udc_UDC_EP0_CSR_REG when index is zero.
	 */
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, 0);

	/* clear stall status */
	if (USBC_Dev_IsEpStall(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0)) {
		DMSG_PANIC("ERR: ep0 stall\n");

		sunxi_udc_nuke(dev, ep, -EPIPE);
		USBC_Dev_EpClearStall(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0);
		dev->ep0state = EP0_IDLE;
		return;
	}

	/* clear setup end */
	if (USBC_Dev_Ctrl_IsSetupEnd(g_sunxi_udc_io.usb_bsp_hdle)) {
		DMSG_PANIC("handle_ep0: ep0 setup end\n");

		sunxi_udc_nuke(dev, ep, 0);
		USBC_Dev_Ctrl_ClearSetupEnd(g_sunxi_udc_io.usb_bsp_hdle);
		dev->ep0state = EP0_IDLE;
	}

	DMSG_DBG_UDC("sunxi_udc_handle_ep0--3--%d\n", dev->ep0state);

	ep0csr = USBC_Readw(USBC_REG_CSR0(g_sunxi_udc_io.usb_vbase));

	switch (dev->ep0state) {
	case EP0_IDLE:
		sunxi_udc_handle_ep0_idle(dev, ep, &crq, ep0csr);
		break;
	case EP0_IN_DATA_PHASE:			/* GET_DESCRIPTOR etc */
		DMSG_DBG_UDC("EP0_IN_DATA_PHASE ... what now?\n");

		if (!USBC_Dev_IsWriteDataReady(
					g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_EP0)
				&& req) {
			sunxi_udc_write_fifo(ep, req);
		}
		break;
	case EP0_OUT_DATA_PHASE:		/* SET_DESCRIPTOR etc */
		DMSG_DBG_UDC("EP0_OUT_DATA_PHASE ... what now?\n");

		if (USBC_Dev_IsReadDataReady(
					g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_EP0)
				&& req) {
			sunxi_udc_read_fifo(ep, req);
		}
		break;
	case EP0_END_XFER:
		DMSG_DBG_UDC("EP0_END_XFER ... what now?\n");
		DMSG_DBG_UDC("crq_bRequest = 0x%x\n", crq_bRequest);

		switch (crq_bRequest) {
		case USB_REQ_SET_ADDRESS:
			USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, 0);

			USBC_Dev_Ctrl_ClearSetupEnd(
					g_sunxi_udc_io.usb_bsp_hdle);
			USBC_Dev_SetAddress(
					g_sunxi_udc_io.usb_bsp_hdle,
					dev->address);

			DMSG_INFO_UDC("Set address %d\n", dev->address);
			break;
		case USB_REQ_SET_FEATURE:
			switch (crq_wIndex) {
			case TEST_J:
				USBC_EnterMode_Test_J(
						g_sunxi_udc_io.usb_bsp_hdle);
				break;

			case TEST_K:
				USBC_EnterMode_Test_K(
						g_sunxi_udc_io.usb_bsp_hdle);
				break;

			case TEST_SE0_NAK:
				USBC_EnterMode_Test_SE0_NAK(
						g_sunxi_udc_io.usb_bsp_hdle);
				break;

			case TEST_PACKET:
			{
				void __iomem *fifo = 0;

				fifo = USBC_SelectFIFO(
						g_sunxi_udc_io.usb_bsp_hdle, 0);
				USBC_WritePacket(
						g_sunxi_udc_io.usb_bsp_hdle,
						fifo, 54, (u32 *)TestPkt);
				USBC_EnterMode_TestPacket(
						g_sunxi_udc_io.usb_bsp_hdle);
				USBC_Dev_WriteDataStatus(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_EP0, 0);
			}
				break;
			default:
				break;
			}

			crq_wIndex = 0;
			break;
		default:
			break;
		}

		crq_bRequest = 0;

		dev->ep0state = EP0_IDLE;
		break;

	case EP0_STALL:
		DMSG_DBG_UDC("EP0_STALL ... what now?\n");
		dev->ep0state = EP0_IDLE;
		break;
	}

	DMSG_DBG_UDC("sunxi_udc_handle_ep0--4--%d\n", dev->ep0state);
}

static void sunxi_udc_handle_ep(struct sunxi_udc_ep *ep)
{
	struct sunxi_udc_request *req = NULL;
	int is_in = ep->bEndpointAddress & USB_DIR_IN;
	u32 idx = 0;
	u8 old_ep_index = 0;

	/* see sunxi_udc_queue. */
	if (likely(!list_empty(&ep->queue)))
		req = list_entry(ep->queue.next,
				struct sunxi_udc_request, queue);
	else
		req = NULL;

	if (g_irq_debug) {
		DMSG_INFO("e: (%s), tx_csr=0x%x\n", ep->ep.name,
			USBC_Readw(USBC_REG_TXCSR(g_sunxi_udc_io.usb_vbase)));
		if (req) {
			DMSG_INFO("req: (0x%p, %d, %d)\n", &(req->req),
				req->req.length, req->req.actual);
		}
	}

	idx = ep->bEndpointAddress & 0x7F;

	old_ep_index = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, idx);

	if (is_in) {
		if (USBC_Dev_IsEpStall(g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_TX)) {
			DMSG_PANIC("ERR: tx ep(%d) is stall\n", idx);
			USBC_Dev_EpClearStall(
					g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_TX);
			goto end;
		}
	} else {
		if (USBC_Dev_IsEpStall(g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_RX)) {
			DMSG_PANIC("ERR: rx ep(%d) is stall\n", idx);
			USBC_Dev_EpClearStall(
					g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_RX);
			goto end;
		}
	}

	if (req) {
		if (is_in) {
			if (!USBC_Dev_IsWriteDataReady(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_TX)) {
				sunxi_udc_write_fifo(ep, req);
			}
		} else {
			if (USBC_Dev_IsReadDataReady(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_RX)) {
				sunxi_udc_read_fifo(ep, req);
			}
		}
	}

end:
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_index);
}

/* mask the useless irq, save disconect, reset, resume, suspend */
static u32 filtrate_irq_misc(u32 irq_misc)
{
	u32 irq = irq_misc;

	irq &= ~(USBC_INTUSB_VBUS_ERROR
		| USBC_INTUSB_SESSION_REQ
		| USBC_INTUSB_CONNECT
		| USBC_INTUSB_SOF);
	USBC_INT_ClearMiscPending(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_INTUSB_VBUS_ERROR);
	USBC_INT_ClearMiscPending(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_INTUSB_SESSION_REQ);
	USBC_INT_ClearMiscPending(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_INTUSB_CONNECT);
	USBC_INT_ClearMiscPending(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_INTUSB_SOF);

	return irq;
}

static void clear_all_irq(void)
{
	USBC_INT_ClearEpPendingAll(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_TX);
	USBC_INT_ClearEpPendingAll(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_RX);
	USBC_INT_ClearMiscPendingAll(g_sunxi_udc_io.usb_bsp_hdle);
}

static void throw_away_all_urb(struct sunxi_udc *dev)
{
	int k = 0;

	DMSG_INFO_UDC("irq: reset happen, throw away all urb\n");
	for (k = 0; k < SW_UDC_ENDPOINTS; k++)
		sunxi_udc_nuke(dev,
			(struct sunxi_udc_ep *)&(dev->ep[k]),
			-ECONNRESET);
}

/* clear all dma status of the EP, called when dma exception */
static void sunxi_udc_clean_dma_status(struct sunxi_udc_ep *ep)
{
	u8 ep_index = 0;
	u8 old_ep_index = 0;
	struct sunxi_udc_request *req = NULL;

	ep_index = ep->bEndpointAddress & 0x7F;

	old_ep_index = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, ep_index);

	if ((ep->bEndpointAddress) & USB_DIR_IN) {  /* dma_mode1 */
		/* clear ep dma status */
		USBC_Dev_ClearEpDma(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_TX);

		/* select bus to pio */
		sunxi_udc_switch_bus_to_pio(ep, 1);
	} else {  /* dma_mode0 */
		/* clear ep dma status */
		USBC_Dev_ClearEpDma(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_RX);

		/* select bus to pio */
		sunxi_udc_switch_bus_to_pio(ep, 0);
	}

	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_index);

	/* done req */
	while (likely(!list_empty(&ep->queue))) {
		req = list_entry(ep->queue.next,
				struct sunxi_udc_request, queue);
		if (req) {
			req->req.status = -ECONNRESET;
			req->req.actual = 0;
			sunxi_udc_done(ep, req, -ECONNRESET);
		}
	}

	ep->dma_working = 0;
	dma_working = 0;
}

static void sunxi_udc_stop_dma_work(struct sunxi_udc *dev, u32 unlock)
{
	__u32 i = 0;
	struct sunxi_udc_ep *ep = NULL;

	for (i = 0; i < SW_UDC_ENDPOINTS; i++) {
		ep = &dev->ep[i];

		if (sunxi_udc_dma_is_busy(ep)) {
			DMSG_PANIC("wrn: ep(%d) must stop working\n", i);

			if (unlock) {
				spin_unlock(&ep->dev->lock);
				sunxi_udc_dma_stop(ep);
				spin_lock(&ep->dev->lock);
			} else {
				sunxi_udc_dma_stop(ep);
			}

#ifdef SW_UDC_DMA_INNER
			ep->dev->dma_hdle = NULL;
#else
			ep->dev->sunxi_udc_dma[ep->num].is_start = 0;
#endif
			ep->dma_transfer_len = 0;

			sunxi_udc_clean_dma_status(ep);
		}
	}
}

void sunxi_udc_dma_completion(struct sunxi_udc *dev,
		struct sunxi_udc_ep *ep,
		struct sunxi_udc_request *req)
{
	unsigned long		flags			= 0;
	__u8			old_ep_index		= 0;
	__u32			dma_transmit_len	= 0;
	int			is_complete		= 0;
	struct sunxi_udc_request *req_next		= NULL;

	if (dev == NULL || ep == NULL || req == NULL) {
		DMSG_PANIC("ERR: argment invaild. (0x%p, 0x%p, 0x%p)\n",
			dev, ep, req);
		return;
	}

	if (!ep->dma_working) {
		DMSG_PANIC("ERR: dma is not work, can not callback\n");
		return;
	}

	sunxi_udc_unmap_dma_buffer(req, dev, ep);

	spin_lock_irqsave(&dev->lock, flags);

	old_ep_index = USBC_GetActiveEp(dev->sunxi_udc_io->usb_bsp_hdle);
	USBC_SelectActiveEp(dev->sunxi_udc_io->usb_bsp_hdle, ep->num);

	if ((ep->bEndpointAddress) & USB_DIR_IN) {  /* tx, dma_mode1 */
		while (USBC_Dev_IsWriteDataReady_FifoEmpty(
				dev->sunxi_udc_io->usb_bsp_hdle,
				USBC_EP_TYPE_TX))
			;
		USBC_Dev_ClearEpDma(dev->sunxi_udc_io->usb_bsp_hdle,
				USBC_EP_TYPE_TX);
	} else {  /* rx, dma_mode0 */
		USBC_Dev_ClearEpDma(dev->sunxi_udc_io->usb_bsp_hdle,
				USBC_EP_TYPE_RX);
	}

	dma_transmit_len = sunxi_udc_dma_transmit_length(ep);
	if (dma_transmit_len < req->req.length) {
		if ((ep->bEndpointAddress) & USB_DIR_IN)
			USBC_Dev_ClearEpDma(dev->sunxi_udc_io->usb_bsp_hdle,
					USBC_EP_TYPE_TX);
		else
			USBC_Dev_ClearEpDma(dev->sunxi_udc_io->usb_bsp_hdle,
					USBC_EP_TYPE_RX);
	}

	if (g_dma_debug) {
		DMSG_INFO("di: (0x%p, %d, %d),(%d,%d)\n",
				&(req->req), req->req.length, req->req.actual,
				ep->bEndpointAddress, USB_DIR_IN);
	}

	ep->dma_working = 0;
	dma_working = 0;
	ep->dma_transfer_len = 0;

	/* if current data transfer not complete, then go on */
	req->req.actual += dma_transmit_len;
	if (req->req.length > req->req.actual) {
		if (((ep->bEndpointAddress & USB_DIR_IN) != 0)
			&& !USBC_Dev_IsWriteDataReady_FifoEmpty(
					dev->sunxi_udc_io->usb_bsp_hdle,
					USBC_EP_TYPE_TX)) {
			if (pio_write_fifo(ep, req)) {
				req = NULL;
				is_complete = 1;
			}
		} else if (((ep->bEndpointAddress & USB_DIR_IN) == 0)
			&& USBC_Dev_IsReadDataReady(
					dev->sunxi_udc_io->usb_bsp_hdle,
					USBC_EP_TYPE_RX)) {
			if (pio_read_fifo(ep, req)) {
				req = NULL;
				is_complete = 1;
			}
		}
	} else {	/* if DMA transfer data over, then done */
		sunxi_udc_done(ep, req, 0);
		is_complete = 1;
	}

	/* start next transfer */
	if (is_complete) {
		if (likely(!list_empty(&ep->queue)))
			req_next = list_entry(ep->queue.next,
					struct sunxi_udc_request, queue);
		else
			req_next = NULL;

		if (req_next) {
			if ((ep->bEndpointAddress & USB_DIR_IN) != 0) {
				while (USBC_Dev_IsWriteDataReady_FifoEmpty(
						dev->sunxi_udc_io->usb_bsp_hdle,
						USBC_EP_TYPE_TX))
					;
				sunxi_udc_write_fifo(ep, req_next);
			} else if (((ep->bEndpointAddress & USB_DIR_IN) == 0)
				&& USBC_Dev_IsReadDataReady(
						dev->sunxi_udc_io->usb_bsp_hdle,
						USBC_EP_TYPE_RX)) {

				sunxi_udc_read_fifo(ep, req_next);
			}
		}
	}

	USBC_SelectActiveEp(dev->sunxi_udc_io->usb_bsp_hdle, old_ep_index);

	spin_unlock_irqrestore(&dev->lock, flags);
}

static irqreturn_t sunxi_udc_irq(int dummy, void *_dev)
{
	struct sunxi_udc *dev = _dev;
	int usb_irq	= 0;
	int tx_irq	= 0;
	int rx_irq	= 0;
	int i		= 0;
	int dma_irq	= 0;
	u32 old_ep_idx  = 0;
	unsigned long flags = 0;

	spin_lock_irqsave(&dev->lock, flags);

	/* Driver connected ? */
	if (!dev->driver || !is_peripheral_active()) {
		DMSG_PANIC("ERR: functoin driver is not exist, ");
		DMSG_PANIC("or udc is not active.\n");

		/* Clear interrupts */
		clear_all_irq();

		spin_unlock_irqrestore(&dev->lock, flags);

		return IRQ_NONE;
	}

	/* Save index */
	old_ep_idx = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);

	/* Read status registers */
	usb_irq = USBC_INT_MiscPending(g_sunxi_udc_io.usb_bsp_hdle);
	tx_irq  = USBC_INT_EpPending(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_TX);
	rx_irq  = USBC_INT_EpPending(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_RX);
	dma_irq = USBC_Readw(USBC_REG_DMA_INTS(dev->sunxi_udc_io->usb_vbase));

	usb_irq = filtrate_irq_misc(usb_irq);

	if (g_irq_debug) {
		DMSG_INFO("\nirq: %02x,tx_irq=%02x,rx_irq=%02x, dma_irq:%x\n",
				usb_irq, tx_irq, rx_irq, dma_irq);
	}

	/**
	 * Now, handle interrupts. There's two types :
	 * - Reset, Resume, Suspend coming -> usb_int_reg
	 * - EP -> ep_int_reg
	 */

	/* RESET */
	if (usb_irq & USBC_INTUSB_RESET) {
		DMSG_INFO_UDC("IRQ: reset\n");

		DMSG_INFO_UDC("(1:star,2:end): vfs_read:%d, vfs_write:%d,dma_working:%d,amount:%u,file_offset:%llu\n",
			atomic_read(&vfs_read_flag),
			atomic_read(&vfs_write_flag),
			dma_working,
			vfs_amount,
			(unsigned long long)vfs_file_offset);

		USBC_INT_ClearMiscPending(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_INTUSB_RESET);

		clear_all_irq();

		usb_connect = 1;

		/* add wake lock when usb conntect on pc. */
		if (!Is_Charger_Mode) {
			pr_debug("usb_connecting: hold wake lock.\n");
			wake_lock(&udc_wake_lock);
		}
		USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, 0);
		USBC_Dev_SetAddress_default(g_sunxi_udc_io.usb_bsp_hdle);

		if (is_udc_support_dma())
			sunxi_udc_stop_dma_work(dev, 1);

		throw_away_all_urb(dev);

		dev->address = 0;
		dev->ep0state = EP0_IDLE;
		dev->gadget.speed = USB_SPEED_UNKNOWN;
		g_irq_debug = 0;
		g_queue_debug = 0;
		g_dma_debug = 0;

		spin_unlock_irqrestore(&dev->lock, flags);

		schedule_work(&dev->set_cur_vol_work);

		return IRQ_HANDLED;
	}

	/* RESUME */
	if (usb_irq & USBC_INTUSB_RESUME) {
		DMSG_INFO_UDC("IRQ: resume\n");

		/* clear interrupt */
		USBC_INT_ClearMiscPending(g_sunxi_udc_io.usb_bsp_hdle,
					USBC_INTUSB_RESUME);

		if (dev->gadget.speed != USB_SPEED_UNKNOWN
			&& dev->driver
			&& dev->driver->resume) {
			spin_unlock(&dev->lock);
			dev->driver->resume(&dev->gadget);
			spin_lock(&dev->lock);
			usb_connect = 1;
		}
	}

	/* SUSPEND */
	if (usb_irq & USBC_INTUSB_SUSPEND) {
		DMSG_INFO_UDC("IRQ: suspend\n");

		/* clear interrupt */
		USBC_INT_ClearMiscPending(g_sunxi_udc_io.usb_bsp_hdle,
					USBC_INTUSB_SUSPEND);

		if (dev->gadget.speed != USB_SPEED_UNKNOWN) {
			spin_unlock_irqrestore(&dev->lock, flags);
			schedule_work(&dev->vbus_det_work);
			spin_lock_irqsave(&dev->lock, flags);
			usb_connect = 0;
			if (!Is_Charger_Mode) {
				wake_unlock(&udc_wake_lock);
				pr_debug("usb_connecting: release wake lock\n");
			}
		} else {
			DMSG_INFO_UDC("ERR: usb speed is unknown\n");
		}

		if (dev->gadget.speed != USB_SPEED_UNKNOWN
				&& dev->driver
				&& dev->driver->suspend) {
			spin_unlock(&dev->lock);
			dev->driver->suspend(&dev->gadget);
			spin_lock(&dev->lock);
		}

		dev->ep0state = EP0_IDLE;
	}

	/* DISCONNECT */
	if (usb_irq & USBC_INTUSB_DISCONNECT) {
		DMSG_INFO_UDC("IRQ: disconnect\n");

		USBC_INT_ClearMiscPending(g_sunxi_udc_io.usb_bsp_hdle,
					USBC_INTUSB_DISCONNECT);

		dev->ep0state = EP0_IDLE;

		usb_connect = 0;
	}

	/**
	 * EP
	 * control traffic
	 * check on ep0csr != 0 is not a good idea as clearing in_pkt_ready
	 * generate an interrupt
	 */
	if (tx_irq & USBC_INTTx_FLAG_EP0) {
		DMSG_DBG_UDC("USB ep0 irq\n");

		/* Clear the interrupt bit by setting it to 1 */
		USBC_INT_ClearEpPending(g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_TX, 0);

		if (dev->gadget.speed == USB_SPEED_UNKNOWN) {
			if (USBC_Dev_QueryTransferMode(g_sunxi_udc_io.usb_bsp_hdle)
					== USBC_TS_MODE_HS) {
				dev->gadget.speed = USB_SPEED_HIGH;

				DMSG_INFO_UDC("\n++++++++++++++++++++\n");
				DMSG_INFO_UDC(" usb enter high speed.\n");
				DMSG_INFO_UDC("\n++++++++++++++++++++\n");
			} else {
				dev->gadget.speed = USB_SPEED_FULL;

				DMSG_INFO_UDC("\n++++++++++++++++++++\n");
				DMSG_INFO_UDC(" usb enter full speed.\n");
				DMSG_INFO_UDC("\n++++++++++++++++++++\n");
			}
		}

		sunxi_udc_handle_ep0(dev);
	}

	/* firstly to get data */

	/* rx endpoint data transfers */
	for (i = 1; i <= SW_UDC_EPNUMS; i++) {
		u32 tmp = 1 << i;

		if (rx_irq & tmp) {
			DMSG_DBG_UDC("USB rx ep%d irq\n", i);

			/* Clear the interrupt bit by setting it to 1 */
			USBC_INT_ClearEpPending(g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_RX, i);

			sunxi_udc_handle_ep(&dev->ep[ep_fifo_out[i]]);
		}
	}

	/* tx endpoint data transfers */
	for (i = 1; i <= SW_UDC_EPNUMS; i++) {
		u32 tmp = 1 << i;

		if (tx_irq & tmp) {
			DMSG_DBG_UDC("USB tx ep%d irq\n", i);

			/* Clear the interrupt bit by setting it to 1 */
			USBC_INT_ClearEpPending(g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_TX, i);

			sunxi_udc_handle_ep(&dev->ep[ep_fifo_in[i]]);
		}
	}
#ifdef SW_UDC_DMA_INNER
	if (is_udc_support_dma()) {
		struct sunxi_udc_request *req = NULL;
		struct sunxi_udc_ep *ep = NULL;
		int i = 0;

		/* tx endpoint data transfers */
		for (i = 0; i < DMA_CHAN_TOTAL; i++) {
			u32 tmp = 1 << i;

			if (dma_irq & tmp) {
				DMSG_DBG_UDC("USB dma chanle%d irq\n", i);

				/* set 1 to clear pending */
				writel(BIT(i),
					USBC_REG_DMA_INTS(dev->sunxi_udc_io->usb_vbase));

				ep = &dev->ep[dma_chnl[i].ep_num];

				if (ep) {
					/* find req */
					sunxi_udc_dma_release((dm_hdl_t)ep->dev->dma_hdle);
					ep->dev->dma_hdle = NULL;
					if (likely(!list_empty(&ep->queue)))
						req = list_entry(ep->queue.next, struct sunxi_udc_request, queue);
					else
						req = NULL;

					/* call back */
					if (req) {
						spin_unlock_irqrestore(&dev->lock, flags);
						sunxi_udc_dma_completion(dev, ep, req);
						spin_lock_irqsave(&dev->lock, flags);
					}
				} else {
					DMSG_PANIC("ERR: sunxi_udc_dma_callback: dma is remove, but dma irq is happened\n");
				}
			}
		}
	}
#endif

	/* Restore old index */
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_idx);

	spin_unlock_irqrestore(&dev->lock, flags);
	return IRQ_HANDLED;
}

/* sunxi_udc_ep_ops */
static inline struct sunxi_udc_ep *to_sunxi_udc_ep(struct usb_ep *ep)
{
	return container_of(ep, struct sunxi_udc_ep, ep);
}

static inline struct sunxi_udc *to_sunxi_udc(struct usb_gadget *gadget)
{
	return container_of(gadget, struct sunxi_udc, gadget);
}

static inline struct sunxi_udc_request *to_sunxi_udc_req(struct usb_request *req)
{
	return container_of(req, struct sunxi_udc_request, req);
}

static void sunxi_udc_ep_config_reset(struct sunxi_udc_ep *ep)
{
	if (ep->bmAttributes == USB_ENDPOINT_XFER_CONTROL)
		ep->ep.maxpacket = EP0_FIFO_SIZE;
	else if (ep->bmAttributes == USB_ENDPOINT_XFER_ISOC)
		ep->ep.maxpacket = SW_UDC_EP_ISO_FIFO_SIZE;
	else if (ep->bmAttributes == USB_ENDPOINT_XFER_BULK)
		ep->ep.maxpacket = SW_UDC_EP_FIFO_SIZE;
	else if (ep->bmAttributes == USB_ENDPOINT_XFER_INT)
		ep->ep.maxpacket = SW_UDC_EP_FIFO_SIZE;
	else
		DMSG_PANIC("[ep_disable] ep type is invalid!\n");
}

static int sunxi_udc_ep_enable(struct usb_ep *_ep,
				const struct usb_endpoint_descriptor *desc)
{
	struct sunxi_udc	*dev		= NULL;
	struct sunxi_udc_ep	*ep		= NULL;
	u32			max		= 0;
	u32			old_ep_index	= 0;
	__u32			fifo_addr	= 0;
	unsigned long		flags		= 0;
	u32 ep_type   = 0;
	u32 ts_type   = 0;
	u32 fifo_size = 0;
	u8  double_fifo = 0;
	int i = 0;

	if (_ep == NULL || desc == NULL) {
		DMSG_PANIC("ERR: invalid argment\n");
		return -EINVAL;
	}

	if (_ep->name == ep0name || desc->bDescriptorType != USB_DT_ENDPOINT) {
		DMSG_PANIC("PANIC : _ep->name(%s) == ep0name || desc->bDescriptorType(%d) != USB_DT_ENDPOINT\n",
			_ep->name, desc->bDescriptorType);
		return -EINVAL;
	}

	ep = to_sunxi_udc_ep(_ep);
	if (ep == NULL) {
		DMSG_PANIC("ERR: usbd_ep_enable, ep = NULL\n");
		return -EINVAL;
	}

	if (ep->desc) {
		DMSG_PANIC("ERR: usbd_ep_enable, ep->desc is not NULL, ep%d(%s)\n",
			ep->num, _ep->name);
		return -EINVAL;
	}

	DMSG_INFO_UDC("ep enable: ep%d(0x%p, %s, %d, %d)\n",
		ep->num, _ep, _ep->name,
		(desc->bEndpointAddress & USB_DIR_IN), _ep->maxpacket);

	dev = ep->dev;
	if (!dev->driver || dev->gadget.speed == USB_SPEED_UNKNOWN) {
		DMSG_PANIC("PANIC : dev->driver = 0x%p ?= NULL  dev->gadget->speed =%d ?= USB_SPEED_UNKNOWN\n",
			dev->driver, dev->gadget.speed);
		return -ESHUTDOWN;
	}

	max = le16_to_cpu(desc->wMaxPacketSize) & 0x1fff;

	spin_lock_irqsave(&ep->dev->lock, flags);

	_ep->maxpacket = max & 0x7ff;
	ep->desc = desc;
	ep->halted = 0;
	ep->bEndpointAddress = desc->bEndpointAddress;

	/* ep_type */
	if ((ep->bEndpointAddress) & USB_DIR_IN) { /* tx */
		ep_type = USBC_EP_TYPE_TX;
	} else {	 /* rx */
		ep_type = USBC_EP_TYPE_RX;
	}

	/* ts_type */
	switch (desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) {
	case USB_ENDPOINT_XFER_CONTROL:
		ts_type   = USBC_TS_TYPE_CTRL;
		break;
	case USB_ENDPOINT_XFER_BULK:
		ts_type   = USBC_TS_TYPE_BULK;
		break;
	case USB_ENDPOINT_XFER_ISOC:
		ts_type   = USBC_TS_TYPE_ISO;
		break;
	case USB_ENDPOINT_XFER_INT:
		ts_type = USBC_TS_TYPE_INT;
		break;
	default:
		DMSG_PANIC("err: usbd_ep_enable, unknown ep type(%d)\n",
			(desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK));
		goto end;
	}

	/* fifo_addr && fifo_size && double fifo */
	for (i = 0; i < SW_UDC_ENDPOINTS; i++) {
		if (!strcmp(_ep->name, ep_fifo[i].name)) {
			fifo_addr = ep_fifo[i].fifo_addr;
			fifo_size = ep_fifo[i].fifo_size;
			double_fifo = ep_fifo[i].double_fifo;
			break;
		}
	}

	DMSG_INFO_UDC("ep enable: ep%d(0x%p, %s, %d, %d), fifo(%d, %d, %d)\n",
		ep->num,
		_ep,
		_ep->name,
		(desc->bEndpointAddress & USB_DIR_IN),
		_ep->maxpacket,
		fifo_addr,
		fifo_size,
		double_fifo);

	if (i >= SW_UDC_ENDPOINTS) {
		DMSG_PANIC("err: usbd_ep_enable, config fifo failed\n");
		goto end;
	}

	/* check fifo size */
	if ((_ep->maxpacket & 0x7ff) > fifo_size) {
		DMSG_PANIC("err: usbd_ep_enable, fifo size is too small\n");
		goto end;
	}

	/* check double fifo */
	if (double_fifo) {
		if (((_ep->maxpacket & 0x7ff) * 2) > fifo_size) {
			DMSG_PANIC("err: usbd_ep_enable, it is double fifo, ");
			DMSG_PANIC("but fifo size is too small\n");
			goto end;
		}

		/* ????FIFO, ????????????? */
		fifo_size = _ep->maxpacket & 0x7ff;
	}

	if (!is_peripheral_active()) {
		DMSG_INFO_UDC("usbd_ep_enable, usb device is not active\n");
		goto end;
	}

	old_ep_index = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, ep->num);

	USBC_Dev_ConfigEp_Default(g_sunxi_udc_io.usb_bsp_hdle, ep_type);
	USBC_Dev_FlushFifo(g_sunxi_udc_io.usb_bsp_hdle, ep_type);

	/**
	 * set max packet ,type, direction, address;
	 * reset fifo counters, enable irq
	 */
	USBC_Dev_ConfigEp(g_sunxi_udc_io.usb_bsp_hdle,
			ts_type, ep_type, double_fifo,
			(_ep->maxpacket & 0x7ff));
	USBC_ConfigFifo(g_sunxi_udc_io.usb_bsp_hdle,
			ep_type, double_fifo, fifo_size,
			fifo_addr);
	if (ts_type == USBC_TS_TYPE_ISO)
		USBC_Dev_IsoUpdateEnable(g_sunxi_udc_io.usb_bsp_hdle);

	USBC_INT_EnableEp(g_sunxi_udc_io.usb_bsp_hdle, ep_type, ep->num);

	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_index);

end:
	spin_unlock_irqrestore(&ep->dev->lock, flags);

	sunxi_udc_set_halt(_ep, 0);
	return 0;
}

static int sunxi_udc_ep_disable(struct usb_ep *_ep)
{
	struct sunxi_udc_ep *ep = NULL;
	u32 old_ep_index = 0;
	unsigned long flags = 0;

	if (!_ep) {
		DMSG_PANIC("ERR: invalid argment\n");
		return -EINVAL;
	}

	ep = to_sunxi_udc_ep(_ep);
	if (ep == NULL) {
		DMSG_PANIC("ERR: usbd_ep_disable: ep = NULL\n");
		return -EINVAL;
	}

	if (!ep->desc) {
		DMSG_PANIC("ERR: %s not enabled\n", _ep ? ep->ep.name : NULL);
		return -EINVAL;
	}

	DMSG_INFO_UDC("ep disable: ep%d(0x%p, %s, %d, %x)\n",
		ep->num, _ep, _ep->name,
		(ep->bEndpointAddress & USB_DIR_IN), _ep->maxpacket);

	spin_lock_irqsave(&ep->dev->lock, flags);

	DMSG_DBG_UDC("ep_disable: %s\n", _ep->name);

	ep->desc = NULL;
	ep->halted = 1;
	sunxi_udc_ep_config_reset(ep);

	sunxi_udc_nuke(ep->dev, ep, -ESHUTDOWN);

	if (!is_peripheral_active()) {
		DMSG_INFO_UDC("%s_%d: usb device is not active\n",
			__func__, __LINE__);
		goto end;
	}

	old_ep_index = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, ep->num);

	if ((ep->bEndpointAddress) & USB_DIR_IN) { /* tx */
		USBC_Dev_ConfigEp_Default(g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_TX);
		USBC_INT_DisableEp(g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_TX, ep->num);
	} else { /* rx */
		USBC_Dev_ConfigEp_Default(g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_RX);
		USBC_INT_DisableEp(g_sunxi_udc_io.usb_bsp_hdle,
					USBC_EP_TYPE_RX, ep->num);
	}

	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_index);

end:
	spin_unlock_irqrestore(&ep->dev->lock, flags);

	DMSG_DBG_UDC("%s disabled\n", _ep->name);
	return 0;
}

static struct usb_request *sunxi_udc_alloc_request(
		struct usb_ep *_ep,
		gfp_t mem_flags)
{
	struct sunxi_udc_request *req = NULL;

	if (!_ep) {
		DMSG_PANIC("ERR: invalid argment\n");
		return NULL;
	}

	req = kzalloc(sizeof(struct sunxi_udc_request), mem_flags | GFP_ATOMIC);
	if (!req) {
		DMSG_PANIC("ERR: kzalloc failed\n");
		return NULL;
	}

	memset(req, 0, sizeof(struct sunxi_udc_request));

	req->req.dma = DMA_ADDR_INVALID;

	INIT_LIST_HEAD(&req->queue);

	DMSG_INFO_UDC("alloc request: ep(0x%p, %s, %d), req(0x%p)\n",
		_ep, _ep->name, _ep->maxpacket, req);

	return &req->req;
}

static void sunxi_udc_free_request(struct usb_ep *_ep, struct usb_request *_req)
{
	struct sunxi_udc_request	*req = NULL;

	if (_ep == NULL || _req == NULL) {
		DMSG_PANIC("ERR: invalid argment\n");
		return;
	}

	req = to_sunxi_udc_req(_req);
	if (req == NULL) {
		DMSG_PANIC("ERR: invalid argment\n");
		return;
	}

	DMSG_INFO_UDC("free request: ep(0x%p, %s, %d), req(0x%p)\n",
		_ep, _ep->name, _ep->maxpacket, req);

	kfree(req);
}

static int sunxi_udc_queue(struct usb_ep *_ep,
		struct usb_request *_req, gfp_t gfp_flags)
{
	struct sunxi_udc_request *req = NULL;
	struct sunxi_udc_ep *ep = NULL;
	struct sunxi_udc *dev = NULL;
	unsigned long flags = 0;
	u8 old_ep_index = 0;

	if (_ep == NULL || _req == NULL) {
		DMSG_PANIC("ERR: invalid argment\n");
		return -EINVAL;
	}

	ep = to_sunxi_udc_ep(_ep);
	if ((ep == NULL || (!ep->desc && _ep->name != ep0name))) {
		DMSG_PANIC("ERR: sunxi_udc_queue: inval 2\n");
		return -EINVAL;
	}

	dev = ep->dev;
	if (!dev->driver || dev->gadget.speed == USB_SPEED_UNKNOWN) {
		DMSG_PANIC("ERR : dev->driver=0x%p, dev->gadget.speed=%x\n",
			dev->driver, dev->gadget.speed);
		return -ESHUTDOWN;
	}

	if (!_req->complete || !_req->buf) {
		DMSG_PANIC("ERR: usbd_queue: _req is invalid\n");
		return -EINVAL;
	}

	req = to_sunxi_udc_req(_req);
	if (!req) {
		DMSG_PANIC("ERR: req is NULL\n");
		return -EINVAL;
	}

	spin_lock_irqsave(&ep->dev->lock, flags);
	_req->status = -EINPROGRESS;
	_req->actual = 0;

	if (is_sunxi_udc_dma_capable(req, ep)) {
		spin_unlock_irqrestore(&ep->dev->lock, flags);
		sunxi_udc_map_dma_buffer(req, dev, ep);
		spin_lock_irqsave(&ep->dev->lock, flags);
	}

	list_add_tail(&req->queue, &ep->queue);

	if (!is_peripheral_active()) {
		DMSG_PANIC("warn: peripheral is active\n");
		goto end;
	}

	if (g_queue_debug)
		DMSG_INFO("q:(0x%p,%d,%d)\n", _req, _req->length, _req->actual);

	old_ep_index = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);
	if (ep->bEndpointAddress)
		USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle,
				ep->bEndpointAddress & 0x7F);
	else
		USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, 0);

	/* if there is only one in the queue, then execute it */
	if (!ep->halted && (&req->queue == ep->queue.next)) {
		if (ep->bEndpointAddress == 0 /* ep0 */) {
			switch (dev->ep0state) {
			case EP0_IN_DATA_PHASE:
				if (!USBC_Dev_IsWriteDataReady(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_EP0)
				    && sunxi_udc_write_fifo(ep, req)) {
					dev->ep0state = EP0_IDLE;
					req = NULL;
				}
				break;
			case EP0_OUT_DATA_PHASE:
				if ((!_req->length)
				    || (USBC_Dev_IsReadDataReady(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_EP0)
				    && sunxi_udc_read_fifo(ep, req))) {
					dev->ep0state = EP0_IDLE;
					req = NULL;
				}
				break;
			default:
				spin_unlock_irqrestore(&ep->dev->lock, flags);
				return -EL2HLT;
			}
		} else if ((ep->bEndpointAddress & USB_DIR_IN) != 0
				&& !USBC_Dev_IsWriteDataReady(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_TX)) {
#if (defined(CONFIG_USB_G_WEBCAM) || defined(CONFIG_USB_CONFIGFS_F_UVC)) \
	&& defined(CONFIG_SMP)
			/**
			 * not execute req when only one in the queue, otherwise
			 * it will be deadlocked for webcam on SMP.
			 */
			if ((ep->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK)
			    == USB_ENDPOINT_XFER_ISOC) {
				int ret = 0;

				ret = USBC_Dev_WriteDataStatus(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_TX, 1);
				if (ret != 0) {
					DMSG_PANIC("ERR: USBC_Dev_WriteDataStatus, failed\n");
					req->req.status = -EOVERFLOW;
					USBC_SelectActiveEp(
						g_sunxi_udc_io.usb_bsp_hdle,
						old_ep_index);
					spin_unlock_irqrestore(&ep->dev->lock,
						flags);
					return req->req.status;
				}
			} else if (sunxi_udc_write_fifo(ep, req)) {
				req = NULL;
			}
#else
			if (sunxi_udc_write_fifo(ep, req))
				req = NULL;
#endif
		} else if ((ep->bEndpointAddress & USB_DIR_IN) == 0
				&& USBC_Dev_IsReadDataReady(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_RX)) {
			if (sunxi_udc_read_fifo(ep, req))
				req = NULL;
		}
	}

	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_index);

end:
	spin_unlock_irqrestore(&ep->dev->lock, flags);
	return 0;
}

static int sunxi_udc_dequeue(struct usb_ep *_ep, struct usb_request *_req)
{
	struct sunxi_udc_ep *ep = NULL;
	struct sunxi_udc *udc = NULL;
	int retval = -EINVAL;
	struct sunxi_udc_request *req = NULL;
	unsigned long flags = 0;

	DMSG_DBG_UDC("(%p,%p)\n", _ep, _req);

	if (!the_controller->driver) {
		DMSG_PANIC("ERR: sunxi_udc_dequeue: driver is null\n");
		return -ESHUTDOWN;
	}

	if (!_ep || !_req) {
		DMSG_PANIC("ERR: sunxi_udc_dequeue: invalid argment\n");
		return retval;
	}

	ep = to_sunxi_udc_ep(_ep);
	if (ep == NULL) {
		DMSG_PANIC("ERR: ep == NULL\n");
		return -EINVAL;
	}

	udc = to_sunxi_udc(ep->gadget);
	if (udc == NULL) {
		DMSG_PANIC("ERR: ep == NULL\n");
		return -EINVAL;
	}

	DMSG_INFO_UDC("dequeue: ep(0x%p, %d), _req(0x%p, %d, %d)\n",
		ep, ep->num,
			_req, _req->length, _req->actual);

	spin_lock_irqsave(&ep->dev->lock, flags);

	list_for_each_entry(req, &ep->queue, queue) {
		if (&req->req == _req) {
			list_del_init(&req->queue);
			_req->status = -ECONNRESET;
			retval = 0;
			break;
		}
	}

	if (retval == 0) {
		DMSG_DBG_UDC("dequeued req %p from %s, len %d buf %p\n",
			req, _ep->name, _req->length, _req->buf);

		sunxi_udc_done(ep, req, -ECONNRESET);
		/*
		 * If dma is capable, we should disable the dma channel and
		 * clean dma status, or it would cause dma hang when unexpected
		 * abort occurs.
		 */
		if (is_sunxi_udc_dma_capable(req, ep)) {
			sunxi_udc_dma_chan_disable((dm_hdl_t)ep->dev->dma_hdle);
			sunxi_udc_clean_dma_status(ep);
		}
	}

	spin_unlock_irqrestore(&ep->dev->lock, flags);
	return retval;
}

static int sunxi_udc_set_halt_ex(struct usb_ep *_ep, int value, int is_in)
{
	struct sunxi_udc_ep *ep = NULL;
	u32 idx = 0;
	__u8 old_ep_index = 0;

	if (_ep == NULL) {
		DMSG_PANIC("ERR: invalid argment\n");
		return -EINVAL;
	}

	ep = to_sunxi_udc_ep(_ep);
	if (ep == NULL) {
		DMSG_PANIC("ERR: invalid argment\n");
		return -EINVAL;
	}

	if (!ep->desc && ep->ep.name != ep0name) {
		DMSG_PANIC("ERR: !ep->desc && ep->ep.name != ep0name\n");
		return -EINVAL;
	}

	if (!is_peripheral_active()) {
		DMSG_INFO_UDC("%s_%d: usb device is not active\n",
			__func__, __LINE__);
		return 0;
	}

	idx = ep->bEndpointAddress & 0x7F;

	old_ep_index = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, idx);

	if (idx == 0) {
		USBC_Dev_EpClearStall(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0);
	} else {
		if (is_in) {
			if (value) {
				USBC_Dev_EpSendStall(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_TX);
			} else {
				USBC_Dev_EpClearStall(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_TX);
			}
		} else {
			if (value)
				USBC_Dev_EpSendStall(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_RX);
			else
				USBC_Dev_EpClearStall(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_RX);
		}
	}

	ep->halted = value ? 1 : 0;

	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_index);
	return 0;
}

static int sunxi_udc_set_halt(struct usb_ep *_ep, int value)
{
	struct sunxi_udc_ep	*ep = NULL;
	unsigned long		flags = 0;
	u32			idx = 0;
	__u8			old_ep_index = 0;

	if (_ep == NULL) {
		DMSG_PANIC("ERR: invalid argment\n");
		return -EINVAL;
	}

	ep = to_sunxi_udc_ep(_ep);
	if (ep == NULL) {
		DMSG_PANIC("ERR: invalid argment\n");
		return -EINVAL;
	}

	if (!ep->desc && ep->ep.name != ep0name) {
		DMSG_PANIC("ERR: !ep->desc && ep->ep.name != ep0name\n");
		return -EINVAL;
	}

	if (!is_peripheral_active()) {
		DMSG_INFO_UDC("%s_%d: usb device is not active\n",
			__func__, __LINE__);
		return 0;
	}

	spin_lock_irqsave(&ep->dev->lock, flags);

	idx = ep->bEndpointAddress & 0x7F;

	old_ep_index = USBC_GetActiveEp(g_sunxi_udc_io.usb_bsp_hdle);
	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, idx);

	if (idx == 0) {
		USBC_Dev_EpClearStall(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_EP_TYPE_EP0);
	} else {
		if ((ep->bEndpointAddress & USB_DIR_IN) != 0) {
			if (value)
				USBC_Dev_EpSendStall(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_TX);
			else
				USBC_Dev_EpClearStall(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_TX);
		} else {
			if (value)
				USBC_Dev_EpSendStall(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_RX);
			else
				USBC_Dev_EpClearStall(
						g_sunxi_udc_io.usb_bsp_hdle,
						USBC_EP_TYPE_RX);
		}
	}

	ep->halted = value ? 1 : 0;

	USBC_SelectActiveEp(g_sunxi_udc_io.usb_bsp_hdle, old_ep_index);

	spin_unlock_irqrestore(&ep->dev->lock, flags);
	return 0;
}

static const struct usb_ep_ops sunxi_udc_ep_ops = {
	.enable		= sunxi_udc_ep_enable,
	.disable	= sunxi_udc_ep_disable,

	.alloc_request	= sunxi_udc_alloc_request,
	.free_request	= sunxi_udc_free_request,

	.queue		= sunxi_udc_queue,
	.dequeue	= sunxi_udc_dequeue,

	.set_halt	= sunxi_udc_set_halt,
};

static int sunxi_udc_get_frame(struct usb_gadget *_gadget)
{
	int ret = 0;

	if (!is_peripheral_active()) {
		DMSG_INFO_UDC("%s_%d: usb device is not active\n",
			__func__, __LINE__);
		return 0;
	}

	DMSG_INFO_UDC("sunxi_udc_get_frame is no susport\n");

	return ret;
}

static int sunxi_udc_wakeup(struct usb_gadget *_gadget)
{
	if (!is_peripheral_active()) {
		DMSG_INFO_UDC("%s_%d: usb device is not active\n",
			__func__, __LINE__);
		return 0;
	}

	return 0;
}

static int sunxi_udc_set_selfpowered(struct usb_gadget *gadget, int value)
{
	if (!is_peripheral_active()) {
		DMSG_INFO_UDC("%s_%d: usb device is not active\n",
			__func__, __LINE__);
		return 0;
	}

	return 0;
}

static void sunxi_udc_disable(struct sunxi_udc *dev);
static void sunxi_udc_enable(struct sunxi_udc *dev);

static int sunxi_udc_set_pullup(struct sunxi_udc *udc, int is_on)
{
	DMSG_DBG_UDC("sunxi_udc_set_pullup\n");

	is_udc_enable = is_on;

	if (!is_peripheral_active()) {
		DMSG_INFO_UDC("%s_%d: usb device is not active\n",
			__func__, __LINE__);
		return 0;
	}

	if (is_on) {
		sunxi_udc_enable(udc);
	} else {
		if (udc->gadget.speed != USB_SPEED_UNKNOWN) {
			if (udc->driver && udc->driver->disconnect)
				udc->driver->disconnect(&udc->gadget);
		}

		sunxi_udc_disable(udc);
	}

	return 0;
}

static int sunxi_udc_vbus_session(struct usb_gadget *gadget, int is_active)
{
	struct sunxi_udc *udc = to_sunxi_udc(gadget);

	DMSG_DBG_UDC("sunxi_udc_vbus_session\n");

	if (!is_peripheral_active()) {
		DMSG_INFO_UDC("%s_%d: usb device is not active\n",
			__func__, __LINE__);
		return 0;
	}

	udc->vbus = (is_active != 0);
	sunxi_udc_set_pullup(udc, is_active);

	return 0;
}

static int sunxi_udc_pullup(struct usb_gadget *gadget, int is_on)
{
	struct sunxi_udc *udc = to_sunxi_udc(gadget);

	DMSG_INFO_UDC("sunxi_udc_pullup, is_on = %d\n", is_on);

	sunxi_udc_set_pullup(udc, is_on);
	return 0;
}

static int sunxi_udc_vbus_draw(struct usb_gadget *_gadget, unsigned ma)
{
	if (!is_peripheral_active()) {
		DMSG_INFO("%s_%d: usb device is not active\n",
			__func__, __LINE__);
		return 0;
	}

	DMSG_DBG_UDC("sunxi_udc_vbus_draw\n");

	cfg_vbus_draw(ma);
	return 0;
}

static int sunxi_get_udc_base(struct platform_device *pdev,
		sunxi_udc_io_t *sunxi_udc_io)
{

	struct device_node *np = pdev->dev.of_node;

	sunxi_udc_io->usb_vbase  = of_iomap(np, 0);
	if (sunxi_udc_io->usb_vbase == NULL) {
		dev_err(&pdev->dev, "can't get usb_vbase resource\n");
		return -EINVAL;
	}

#if defined(CONFIG_ARCH_SUN50IW10)
	sunxi_udc_io->usb_common_phy_config = of_iomap(np, 2);
	if (sunxi_udc_io->usb_common_phy_config == NULL) {
		dev_err(&pdev->dev, "can't get common phy resource\n");
		return -EINVAL;
	}
#endif

	return 0;
}

static int sunxi_get_udc_clock(struct platform_device *pdev,
		sunxi_udc_io_t *sunxi_udc_io)
{
	struct device_node *np = pdev->dev.of_node;

	sunxi_udc_io->ahb_otg = of_clk_get(np, 1);
	if (IS_ERR(sunxi_udc_io->ahb_otg)) {
		sunxi_udc_io->ahb_otg = NULL;
		DMSG_PANIC("ERR: get usb ahb_otg clk failed.\n");
		return -EINVAL;
	}

	sunxi_udc_io->mod_usbphy = of_clk_get(np, 0);
	if (IS_ERR(sunxi_udc_io->mod_usbphy)) {
		sunxi_udc_io->ahb_otg = NULL;
		DMSG_PANIC("ERR: get usb mod_usbphy failed.\n");
		return -EINVAL;
	}
	return 0;
}

/* gadget driver handling */
static void sunxi_udc_reinit(struct sunxi_udc *dev)
{
	u32 i = 0;

	/* device/ep0 records init */
	INIT_LIST_HEAD(&dev->gadget.ep_list);
	INIT_LIST_HEAD(&dev->gadget.ep0->ep_list);
	dev->ep0state = EP0_IDLE;

	for (i = 0; i < SW_UDC_ENDPOINTS; i++) {
		struct sunxi_udc_ep *ep = &dev->ep[i];

		if (i != 0)
			list_add_tail(&ep->ep.ep_list, &dev->gadget.ep_list);

		ep->dev	 = dev;
		ep->desc = NULL;
		ep->halted  = 0;
		INIT_LIST_HEAD(&ep->queue);
	}
}

static void sunxi_udc_enable(struct sunxi_udc *dev)
{
	DMSG_DBG_UDC("sunxi_udc_enable called\n");

	dev->gadget.speed = USB_SPEED_UNKNOWN;

	DMSG_INFO_UDC("CONFIG_USB_GADGET_DUALSPEED: USBC_TS_MODE_HS\n");

	USBC_Dev_ConfigTransferMode(
				g_sunxi_udc_io.usb_bsp_hdle,
				USBC_TS_TYPE_BULK,
				USBC_TS_MODE_HS);

	/* Enable reset and suspend interrupt interrupts */
	USBC_INT_EnableUsbMiscUint(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_INTUSB_SUSPEND);
	USBC_INT_EnableUsbMiscUint(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_INTUSB_RESUME);
	USBC_INT_EnableUsbMiscUint(g_sunxi_udc_io.usb_bsp_hdle,
				USBC_INTUSB_RESET);

	/* Enable ep0 interrupt */
	USBC_INT_EnableEp(g_sunxi_udc_io.usb_bsp_hdle,
			USBC_EP_TYPE_TX, 0);

	cfg_udc_command(SW_UDC_P_ENABLE);
}

static void sunxi_udc_disable(struct sunxi_udc *dev)
{
	DMSG_DBG_UDC("sunxi_udc_disable\n");
	/* Disable all interrupts */
	USBC_INT_DisableUsbMiscAll(g_sunxi_udc_io.usb_bsp_hdle);
	USBC_INT_DisableEpAll(g_sunxi_udc_io.usb_bsp_hdle, USBC_EP_TYPE_RX);
	USBC_INT_DisableEpAll(g_sunxi_udc_io.usb_bsp_hdle, USBC_EP_TYPE_TX);

	/* Clear the interrupt registers */
	clear_all_irq();
	cfg_udc_command(SW_UDC_P_DISABLE);

	/* Set speed to unknown */
	dev->gadget.speed = USB_SPEED_UNKNOWN;
}

static s32  usbd_start_work(void)
{
	DMSG_INFO_UDC("usbd_start_work\n");

	if (!is_peripheral_active()) {
		DMSG_INFO_UDC("%s_%d: usb device is not active\n",
			__func__, __LINE__);
		return 0;
	}

	USBC_Dev_ConectSwitch(g_sunxi_udc_io.usb_bsp_hdle,
			USBC_DEVICE_SWITCH_ON);
	return 0;
}

static s32  usbd_stop_work(void)
{
	DMSG_INFO_UDC("usbd_stop_work\n");

	if (!is_peripheral_active()) {
		DMSG_INFO_UDC("%s_%d: usb device is not active\n",
			__func__, __LINE__);
		return 0;
	}

	USBC_Dev_ConectSwitch(g_sunxi_udc_io.usb_bsp_hdle,
			USBC_DEVICE_SWITCH_OFF); /* default is pulldown */
	return 0;
}

static int sunxi_udc_start(struct usb_gadget *g,
		struct usb_gadget_driver *driver)
{
	struct sunxi_udc *udc = the_controller;

	/* Sanity checks */
	if (!udc) {
		DMSG_PANIC("ERR: udc is null\n");
		return -ENODEV;
	}

	if (udc->driver) {
		DMSG_PANIC("ERR: udc->driver is not null\n");
		return -EBUSY;
	}

	/**
	 * the struct usb_gadget_driver has a little change
	 * between linux 3.0 and linux-3.3, speed->max_speed
	 */
	if (!driver->setup || driver->max_speed < USB_SPEED_FULL) {
		DMSG_PANIC("ERR: Invalid setup %p speed %d\n",
			driver->setup, driver->max_speed);
		return -EINVAL;
	}

#if defined(MODULE)
	if (!driver->unbind) {
		DMSG_PANIC("Invalid driver: no unbind method\n");
		return -EINVAL;
	}
#endif

	/* Hook the driver */
	udc->driver = driver;
	udc->gadget.dev.driver = &driver->driver;

	DMSG_INFO_UDC("[%s]: binding gadget driver '%s'\n",
		gadget_name, driver->driver.name);

	return 0;
}

static int sunxi_udc_stop(struct usb_gadget *g)
{
	struct sunxi_udc *udc = the_controller;
	struct usb_gadget_driver *driver;

	if (!udc) {
		DMSG_PANIC("ERR: udc is null\n");
		return -ENODEV;
	}
	driver = udc->driver;
	if (!driver || driver != udc->driver || !driver->unbind) {
		DMSG_PANIC("ERR: driver is null\n");
		return -EINVAL;
	}

	DMSG_INFO_UDC("[%s]: usb_gadget_unregister_driver() '%s'\n",
		gadget_name, driver->driver.name);

	udc->gadget.dev.driver = NULL;
	udc->driver = NULL;

	/* Disable udc */
	sunxi_udc_disable(udc);
	return 0;
}

static const struct usb_gadget_ops sunxi_udc_ops = {
	.get_frame		= sunxi_udc_get_frame,
	.wakeup			= sunxi_udc_wakeup,
	.set_selfpowered	= sunxi_udc_set_selfpowered,
	.pullup			= sunxi_udc_pullup,
	.vbus_session		= sunxi_udc_vbus_session,
	.vbus_draw		= sunxi_udc_vbus_draw,
	.udc_start		= sunxi_udc_start,
	.udc_stop		= sunxi_udc_stop,
};

static struct sunxi_udc sunxi_udc = {
	.gadget = {
		.ops		= &sunxi_udc_ops,
		.ep0		= &sunxi_udc.ep[0].ep,
		.name		= gadget_name,
		.dev = {
			.init_name	= "gadget",
		},
	},

	.ep[0] = {
		.num			= 0,
		.ep = {
			.name		= ep0name,
			.ops		= &sunxi_udc_ep_ops,
			.maxpacket	= EP0_FIFO_SIZE,
			.maxpacket_limit = EP0_FIFO_SIZE,
			.caps	= USB_EP_CAPS(USB_EP_CAPS_TYPE_CONTROL,
				USB_EP_CAPS_DIR_ALL),
		},
		.dev			= &sunxi_udc,
	},

	.ep[1] = {
		.num			= 1,
		.ep = {
			.name		= ep1in_bulk_name,
			.ops		= &sunxi_udc_ep_ops,
			.maxpacket	= SW_UDC_EP_FIFO_SIZE,
			.maxpacket_limit = SW_UDC_EP_FIFO_SIZE,
			.caps	= USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK,
					USB_EP_CAPS_DIR_IN),
		},
		.dev		        = &sunxi_udc,
		.bEndpointAddress   = (USB_DIR_IN | 1),
		.bmAttributes	    = USB_ENDPOINT_XFER_BULK,
	},

	.ep[2] = {
		.num			= 1,
		.ep = {
			.name		= ep1out_bulk_name,
			.ops		= &sunxi_udc_ep_ops,
			.maxpacket	= SW_UDC_EP_FIFO_SIZE,
			.maxpacket_limit = SW_UDC_EP_FIFO_SIZE,
			.caps	= USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK,
					USB_EP_CAPS_DIR_OUT),
		},
		.dev		        = &sunxi_udc,
		.bEndpointAddress   = (USB_DIR_OUT | 1),
		.bmAttributes	    = USB_ENDPOINT_XFER_BULK,
	},

	.ep[3] = {
		.num			= 2,
		.ep = {
			.name		= ep2in_bulk_name,
			.ops		= &sunxi_udc_ep_ops,
			.maxpacket	= SW_UDC_EP_FIFO_SIZE,
			.maxpacket_limit = SW_UDC_EP_FIFO_SIZE,
			.caps	= USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK,
					USB_EP_CAPS_DIR_IN),
		},
		.dev		        = &sunxi_udc,
		.bEndpointAddress   = (USB_DIR_IN | 2),
		.bmAttributes	    = USB_ENDPOINT_XFER_BULK,
	},

	.ep[4] = {
		.num			= 2,
		.ep = {
			.name		= ep2out_bulk_name,
			.ops		= &sunxi_udc_ep_ops,
			.maxpacket	= SW_UDC_EP_FIFO_SIZE,
			.maxpacket_limit = SW_UDC_EP_FIFO_SIZE,
			.caps	= USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK,
					USB_EP_CAPS_DIR_OUT),
		},
		.dev		        = &sunxi_udc,
		.bEndpointAddress   = (USB_DIR_OUT | 2),
		.bmAttributes	    = USB_ENDPOINT_XFER_BULK,
	},

	.ep[5] = {
		.num			= 3,
		.ep = {
			.name		= ep3_iso_name,
			.ops		= &sunxi_udc_ep_ops,
			.maxpacket	= SW_UDC_EP_ISO_FIFO_SIZE,
			.maxpacket_limit = SW_UDC_EP_ISO_FIFO_SIZE,
			.caps	= USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO,
					USB_EP_CAPS_DIR_ALL),
		},
		.dev		        = &sunxi_udc,
		.bEndpointAddress   = 3,
		.bmAttributes	    = USB_ENDPOINT_XFER_ISOC,
	},

	.ep[6] = {
		.num			= 4,
		.ep = {
			.name		= ep4_int_name,
			.ops		= &sunxi_udc_ep_ops,
			.maxpacket	= SW_UDC_EP_FIFO_SIZE,
			.maxpacket_limit = SW_UDC_EP_FIFO_SIZE,
			.caps	= USB_EP_CAPS(USB_EP_CAPS_TYPE_INT,
					USB_EP_CAPS_DIR_ALL),
		},
		.dev		        = &sunxi_udc,
		.bEndpointAddress   = 4,
		.bmAttributes	    = USB_ENDPOINT_XFER_INT,
	},

#if defined(CONFIG_ARCH_SUN50IW1) || defined(CONFIG_ARCH_SUN50IW3) \
	|| defined(CONFIG_ARCH_SUN8IW6) || defined(CONFIG_ARCH_SUN8IW15)
	.ep[7] = {
		.num			= 5,
		.ep = {
			.name		= ep5in_bulk_name,
			.ops		= &sunxi_udc_ep_ops,
			.maxpacket	= SW_UDC_EP_FIFO_SIZE,
			.maxpacket_limit = SW_UDC_EP_FIFO_SIZE,
			.caps	= USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK,
					USB_EP_CAPS_DIR_IN),
		},
		.dev		        = &sunxi_udc,
		.bEndpointAddress   = (USB_DIR_IN | 5),
		.bmAttributes	    = USB_ENDPOINT_XFER_BULK,
	},

	.ep[8] = {
		.num			= 5,
		.ep = {
			.name		= ep5out_bulk_name,
			.ops		= &sunxi_udc_ep_ops,
			.maxpacket	= SW_UDC_EP_FIFO_SIZE,
			.maxpacket_limit = SW_UDC_EP_FIFO_SIZE,
			.caps	= USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK,
					USB_EP_CAPS_DIR_OUT),
		},
		.dev		        = &sunxi_udc,
		.bEndpointAddress   = (USB_DIR_OUT | 5),
		.bmAttributes	    = USB_ENDPOINT_XFER_BULK,
	},
#endif

};

static void sunxi_vbus_det_work(struct work_struct *work)
{
	struct sunxi_udc *udc = NULL;
#if !defined(CONFIG_AW_AXP) && defined(CONFIG_POWER_SUPPLY)
	struct power_supply *psy = NULL;
	union power_supply_propval temp;
#endif

	/* wait for axp vbus detect ready */
	msleep(100);

	udc = container_of(work, struct sunxi_udc, vbus_det_work);

#if defined(CONFIG_AW_AXP)
	while (axp_usb_is_connected()) {
		msleep(1000);

		/* after resume */
		if (usb_connect)
			return;
	}
#elif defined CONFIG_POWER_SUPPLY
	if (of_find_property(g_udc_pdev->dev.of_node, "det_vbus_supply", NULL))
		psy = devm_power_supply_get_by_phandle(&g_udc_pdev->dev,
						     "det_vbus_supply");

	if (!psy || IS_ERR(psy)) {
		DMSG_PANIC("%s()%d WARN: get power supply failed\n", __func__, __LINE__);
	} else {
		power_supply_get_property(psy,
					POWER_SUPPLY_PROP_ONLINE, &temp);

		while (temp.intval) {
			msleep(1000);

			/* after resume */
			if (usb_connect)
				return;
		}
	}
#endif

	if (udc->driver && udc->driver->disconnect)
		udc->driver->disconnect(&udc->gadget);
}

void __iomem *get_otgc_vbase(void)
{
	return  g_sunxi_udc_io.usb_vbase;

}
EXPORT_SYMBOL_GPL(get_otgc_vbase);

int get_dp_dm_status_normal(void)
{
	__u32 reg_val = 0;
	__u32 dp = 0;
	__u32 dm = 0;

	if (g_sunxi_udc_io.usb_vbase == NULL)
		return 0;
	/* USBC_EnableDpDmPullUp */
	reg_val = USBC_Readl(USBC_REG_ISCR(g_sunxi_udc_io.usb_vbase));
	reg_val |= (1 << USBC_BP_ISCR_DPDM_PULLUP_EN);
	USBC_Writel(reg_val, USBC_REG_ISCR(g_sunxi_udc_io.usb_vbase));

	/* USBC_EnableIdPullUp */
	reg_val = USBC_Readl(USBC_REG_ISCR(g_sunxi_udc_io.usb_vbase));
	reg_val |= (1 << USBC_BP_ISCR_ID_PULLUP_EN);
	USBC_Writel(reg_val, USBC_REG_ISCR(g_sunxi_udc_io.usb_vbase));

	msleep(20);

	reg_val = USBC_Readl(USBC_REG_ISCR(g_sunxi_udc_io.usb_vbase));
	dp = (reg_val >> USBC_BP_ISCR_EXT_DP_STATUS) & 0x01;
	dm = (reg_val >> USBC_BP_ISCR_EXT_DM_STATUS) & 0x01;

	return ((dp << 1) | dm);
}
EXPORT_SYMBOL_GPL(get_dp_dm_status_normal);
static int sunxi_get_udc_resource(struct platform_device *pdev,
		sunxi_udc_io_t *sunxi_udc_io);

int sunxi_usb_device_enable(void)
{
	struct platform_device *pdev	= g_udc_pdev;
	struct sunxi_udc	*udc	= &sunxi_udc;
	int			retval  = 0;
#if defined(CONFIG_ARCH_SUN50IW10)
	int val;
#endif

	DMSG_INFO_UDC("sunxi_usb_device_enable start\n");

	if (pdev == NULL) {
		DMSG_PANIC("pdev is null\n");
		return -1;
	}

	usb_connect	= 0;
	crq_bRequest	= 0;
	is_controller_alive = 1;

#if defined(CONFIG_ARCH_SUN8IW6)
	retval = sunxi_get_udc_resource(pdev, &g_sunxi_udc_io);
	if (retval != 0) {
		DMSG_PANIC("ERR: sunxi_get_udc_resource, is fail\n");
		return -ENODEV;
	}

	retval = sunxi_udc_io_init(usbd_port_no, &g_sunxi_udc_io);
	if (retval != 0) {
		DMSG_PANIC("ERR: sunxi_udc_io_init fail\n");
		return -1;
	}
#endif

#if defined(CONFIG_ARCH_SUN50IW10)
	/*phy reg, offset:0x10 bit3 set 0, enable siddq*/
	val = USBC_Readl(g_sunxi_udc_io.usb_common_phy_config + SUNXI_HCI_PHY_CTRL);
	val &= ~(0x1 << SUNXI_HCI_PHY_CTRL_SIDDQ);
	USBC_Writel(val, g_sunxi_udc_io.usb_common_phy_config + SUNXI_HCI_PHY_CTRL);
#endif

	retval = sunxi_udc_bsp_init(&g_sunxi_udc_io);
	if (retval != 0) {
		DMSG_PANIC("ERR: sunxi_udc_bsp_init failed\n");
		return -1;
	}

	sunxi_udc_disable(udc);

	udc->irq_no = platform_get_irq(pdev, 0);

	if (udc->irq_no < 0) {
		DMSG_PANIC("%s,%d: error to get irq\n", __func__, __LINE__);
		return -EINVAL;
	}

	udc->sunxi_udc_io = &g_sunxi_udc_io;
	udc->usbc_no = usbd_port_no;
	strcpy((char *)udc->driver_name, gadget_name);
	udc->pdev	= pdev;
	udc->controller = &(pdev->dev);

#ifdef CONFIG_OF
	udc->controller->dma_mask = &sunxi_udc_mask;
	udc->controller->coherent_dma_mask = DMA_BIT_MASK(64);
#endif

	if (is_udc_support_dma()) {
		retval = sunxi_udc_dma_probe(udc);
		if (retval != 0) {
			DMSG_PANIC("ERR: sunxi_udc_dma_probe failef\n");
			retval = -EBUSY;
			goto err;
		}
	}

	if (first_enable) {
		first_enable = 0;
		INIT_WORK(&udc->vbus_det_work, sunxi_vbus_det_work);
		INIT_WORK(&udc->set_cur_vol_work, sunxi_set_cur_vol_work);
	}

	retval = request_irq(udc->irq_no, sunxi_udc_irq,
			0, gadget_name, udc);
	if (retval != 0) {
		DMSG_PANIC("ERR: cannot get irq %i, err %d\n",
			udc->irq_no, retval);
		retval = -EBUSY;
		goto err;
	}

	if (udc->driver && is_udc_enable) {
		sunxi_udc_enable(udc);
		cfg_udc_command(SW_UDC_P_ENABLE);
	}

	DMSG_INFO_UDC("sunxi_usb_device_enable end\n");

	return 0;
err:
	if (is_udc_support_dma())
		sunxi_udc_dma_remove(udc);

	sunxi_udc_bsp_exit(&g_sunxi_udc_io);
#if defined(CONFIG_ARCH_SUN8IW6)
	sunxi_udc_io_exit(&g_sunxi_udc_io);
#endif

	return retval;
}
EXPORT_SYMBOL_GPL(sunxi_usb_device_enable);

int sunxi_usb_device_disable(void)
__releases(sunxi_udc.lock)
__acquires(sunxi_udc.lock)
{
	struct platform_device *pdev = g_udc_pdev;
	struct sunxi_udc *udc = NULL;
	unsigned long	flags = 0;

	DMSG_INFO_UDC("sunxi_usb_device_disable start\n");

	if (pdev == NULL) {
		DMSG_PANIC("pdev is null\n");
		return -1;
	}

	udc = platform_get_drvdata(pdev);
	if (udc == NULL) {
		DMSG_PANIC("udc is null\n");
		return -1;
	}

	/* disable usb controller */
	if (udc->driver && udc->driver->disconnect)
		udc->driver->disconnect(&udc->gadget);

	if (is_udc_support_dma()) {
		spin_lock_irqsave(&udc->lock, flags);
		sunxi_udc_stop_dma_work(udc, 0);
		spin_unlock_irqrestore(&udc->lock, flags);
		sunxi_udc_dma_remove(udc);
	}

	free_irq(udc->irq_no, udc);

	sunxi_udc_bsp_exit(&g_sunxi_udc_io);

	spin_lock_irqsave(&udc->lock, flags);

	usb_connect	= 0;

	if (!Is_Charger_Mode) {
		wake_unlock(&udc_wake_lock);
		pr_debug("usb_connecting: release wake lock\n");
	}
	crq_bRequest   = 0;
	is_controller_alive = 0;

	spin_unlock_irqrestore(&udc->lock, flags);

	DMSG_INFO_UDC("sunxi_usb_device_disable end\n");

	return 0;
}
EXPORT_SYMBOL_GPL(sunxi_usb_device_disable);

int sunxi_udc_is_enable(struct platform_device *pdev)
{
	struct device_node *usbc_np = NULL;
	int ret = 0;
	int is_enable = 0;

	const char  *used_status;

	usbc_np = of_find_node_by_type(NULL, SET_USB0);
	ret = of_property_read_string(usbc_np, "status", &used_status);
	if (ret) {
		DMSG_PANIC("get sunxi_udc_is_enable is fail, %d\n", -ret);
		is_enable = 0;
	} else if (!strcmp(used_status, "okay")) {
		is_enable = 1;
	} else {
		is_enable = 0;
	}

	return is_enable;
}

static int sunxi_get_udc_resource(struct platform_device *pdev,
		sunxi_udc_io_t *sunxi_udc_io)
{
	int retval = 0;

	memset(&g_sunxi_udc_io, 0, sizeof(sunxi_udc_io_t));

	retval = sunxi_get_udc_base(pdev, sunxi_udc_io);
	if (retval != 0) {
		dev_err(&pdev->dev, "can't get udc base\n");
		goto err0;
	}

	retval = sunxi_get_udc_clock(pdev, sunxi_udc_io);
	if (retval != 0) {
		dev_err(&pdev->dev, "can't get udc clock\n");
		goto err0;
	}

	return 0;
err0:
	return retval;

}

static const struct of_device_id sunxi_udc_match[] = {
	{.compatible = "allwinner,sunxi-udc", },
	{},
};
MODULE_DEVICE_TABLE(of, sunxi_udc_match);

static int sunxi_udc_probe_otg(struct platform_device *pdev)
{
	struct sunxi_udc *udc = &sunxi_udc;
	int retval = 0;

	g_udc_pdev = pdev;

	spin_lock_init(&udc->lock);

	if (!sunxi_udc_is_enable(pdev)) {
		DMSG_INFO("sunxi udc is no enable\n");
		return -ENODEV;
	}

	udc->gadget.dev.parent = &pdev->dev;

#ifdef CONFIG_OF
	udc->gadget.dev.dma_mask = &sunxi_udc_mask;
	udc->gadget.dev.coherent_dma_mask = DMA_BIT_MASK(64);
#endif
	retval = sunxi_get_udc_resource(pdev, &g_sunxi_udc_io);
	if (retval != 0) {
		DMSG_PANIC("ERR: sunxi_get_udc_resource, is fail\n");
		return -ENODEV;
	}

	sunxi_udc_io_init(usbd_port_no, &g_sunxi_udc_io);

	sunxi_udc_reinit(udc);

	the_controller = udc;

	platform_set_drvdata(pdev, udc);

	retval = usb_add_gadget_udc(&pdev->dev, &udc->gadget);
	if (retval != 0) {
		dev_err(&pdev->dev, "can't usb_add_gadget_udc\n");
		return retval;
	}

	device_create_file(&pdev->dev, &dev_attr_otg_ed_test);
	device_create_file(&pdev->dev, &dev_attr_otg_phy_range);
	device_create_file(&pdev->dev, &dev_attr_queue_debug);
	device_create_file(&pdev->dev, &dev_attr_dma_debug);
	device_create_file(&pdev->dev, &dev_attr_write_debug);
	device_create_file(&pdev->dev, &dev_attr_read_debug);
	device_create_file(&pdev->dev, &dev_attr_irq_debug);
	device_create_file(&pdev->dev, &dev_attr_msc_read_debug);
	device_create_file(&pdev->dev, &dev_attr_msc_write_debug);

#if !IS_ENABLED(CONFIG_USB_SUNXI_USB_MANAGER)
	sunxi_usb_device_enable();
#endif

	return 0;

}

static int sunxi_udc_remove_otg(struct platform_device *pdev)
{
	struct sunxi_udc *udc = NULL;

	udc = platform_get_drvdata(pdev);
	if (udc->driver) {
		DMSG_PANIC("ERR: invalid argment, udc->driver(0x%p)\n",
			udc->driver);
		return -EBUSY;
	}

	device_remove_file(&pdev->dev, &dev_attr_otg_ed_test);
	device_remove_file(&pdev->dev, &dev_attr_otg_phy_range);
	device_remove_file(&pdev->dev, &dev_attr_queue_debug);
	device_remove_file(&pdev->dev, &dev_attr_dma_debug);
	device_remove_file(&pdev->dev, &dev_attr_write_debug);
	device_remove_file(&pdev->dev, &dev_attr_read_debug);
	device_remove_file(&pdev->dev, &dev_attr_irq_debug);
	device_remove_file(&pdev->dev, &dev_attr_msc_read_debug);
	device_remove_file(&pdev->dev, &dev_attr_msc_write_debug);

#if !IS_ENABLED(CONFIG_USB_SUNXI_USB_MANAGER)
	sunxi_usb_device_disable();
#endif

	g_udc_pdev = NULL;

	usb_del_gadget_udc(&udc->gadget);

	sunxi_udc_io_exit(&g_sunxi_udc_io);
	memset(&g_sunxi_udc_io, 0, sizeof(sunxi_udc_io_t));

	return 0;
}

static int sunxi_udc_probe(struct platform_device *pdev)
{
	return sunxi_udc_probe_otg(pdev);
}

static int sunxi_udc_remove(struct platform_device *pdev)
{
	return sunxi_udc_remove_otg(pdev);
}

#ifdef CONFIG_PM
static int sunxi_udc_suspend(struct device *dev)
{
	struct sunxi_udc *udc = the_controller;

	DMSG_INFO_UDC("sunxi_udc_suspend start\n");

	if (udc == NULL) {
		DMSG_INFO_UDC("udc is NULL, need not enter to suspend\n");
		return 0;
	}

	if (!is_peripheral_active()) {
		DMSG_INFO("udc is disable, need not enter to suspend\n");
		return 0;
	}

	/* soft disconnect */
	cfg_udc_command(SW_UDC_P_DISABLE);

	/* disable usb controller */
	sunxi_udc_disable(udc);

	/* close USB clock */
	close_usb_clock(&g_sunxi_udc_io);

	DMSG_INFO_UDC("sunxi_udc_suspend end\n");
	return 0;
}

static int sunxi_udc_resume(struct device *dev)
{
	struct sunxi_udc *udc = the_controller;
#if defined(CONFIG_ARCH_SUN50IW10)
	int val;
#endif

	DMSG_INFO_UDC("sunxi_udc_resume start\n");

	if (udc == NULL) {
		DMSG_INFO_UDC("udc is NULL, need not enter to suspend\n");
		return 0;
	}

	if (!is_peripheral_active()) {
		DMSG_INFO("udc is disable, need not enter to resume\n");
		return 0;
	}

#if defined(CONFIG_ARCH_SUN50IW10)
	/*phy reg, offset:0x10 bit3 set 0, enable siddq*/
	val = USBC_Readl(g_sunxi_udc_io.usb_common_phy_config + SUNXI_HCI_PHY_CTRL);
	val &= ~(0x1 << SUNXI_HCI_PHY_CTRL_SIDDQ);
	USBC_Writel(val, g_sunxi_udc_io.usb_common_phy_config + SUNXI_HCI_PHY_CTRL);
#endif

	sunxi_udc_bsp_init(&g_sunxi_udc_io);
	if (is_udc_enable) {

		if (udc->driver && udc->driver->disconnect)
			udc->driver->disconnect(&udc->gadget);

		/* enable usb controller */
		sunxi_udc_enable(udc);

		/* soft connect */
		cfg_udc_command(SW_UDC_P_ENABLE);
	}

	DMSG_INFO_UDC("sunxi_udc_resume end\n");
	return 0;
}
static const struct dev_pm_ops sunxi_udc_pm_ops = {
	.suspend = sunxi_udc_suspend,
	.resume = sunxi_udc_resume,
};

#define UDC_PM_OPS        (&sunxi_udc_pm_ops)

#else /* !CONFIG_PM */

#define UDC_PM_OPS        NULL
#endif /* CONFIG_PM */

static struct platform_driver sunxi_udc_driver = {
	.driver		= {
		.name	= (char *)gadget_name,
		.pm     = UDC_PM_OPS,
		.bus	= &platform_bus_type,
		.owner	= THIS_MODULE,
		.of_match_table = sunxi_udc_match,
	},

	.probe		= sunxi_udc_probe,
	.remove		= sunxi_udc_remove,
};

static void cfg_udc_command(enum sunxi_udc_cmd_e cmd)
{
	struct sunxi_udc *udc = the_controller;

	switch (cmd) {
	case SW_UDC_P_ENABLE:
		{
			if (udc->driver)
				usbd_start_work();
			else
				DMSG_INFO_UDC("udc->driver is null, ");
				DMSG_INFO_UDC("udc is need not start\n");
		}
		break;
	case SW_UDC_P_DISABLE:
		{
			if (udc->driver)
				usbd_stop_work();
			else
				DMSG_INFO_UDC("udc->driver is null, ");
				DMSG_INFO_UDC("udc is need not stop\n");
		}
		break;
	case SW_UDC_P_RESET:
		DMSG_PANIC("ERR: reset is not support\n");
		break;
	default:
		DMSG_PANIC("ERR: unknown cmd(%d)\n", cmd);
		break;
	}
}

static void cfg_vbus_draw(unsigned int ma)
{
}
static int get_para_from_cmdline(const char *cmdline, const char *name, char *value, int maxsize)
{
	char *p = (char *)cmdline;
	char *value_p = value;
	int size = 0;

	if (!cmdline || !name || !value) {
		return -1;
	}

	for (; *p != 0;) {
		if (*p++ == ' ') {
			if (!strncmp(p, name, strlen(name))) {
				p += strlen(name);
				if (*p++ != '=') {
					continue;
				}
				while ((*p != 0) && (*p != ' ') && (++size < maxsize)) {
					*value_p++ = *p++;
				}
				*value_p = '\0';
				return value_p - value;
			}
		}
	}
	return 0;
}
static int udc_init(void)
{
	int retval = 0;
	int ret = 0;
	usb_connect = 0;

	atomic_set(&vfs_read_flag, 0);
	atomic_set(&vfs_write_flag, 0);

	/* driver register */
	retval = platform_driver_register(&sunxi_udc_driver);
	if (retval) {
		DMSG_PANIC("ERR: platform_driver_register failed\n");
		retval = -1;
		goto err;
	}
	ret = get_para_from_cmdline(saved_command_line, ANDROIDBOOT_MODE, g_androidboot_mode, sizeof(g_androidboot_mode));
	if (ret <= 0) {
		printk("get androidboot.mode fail\n");
		Is_Charger_Mode = 0;
	} else {
		pr_debug("%s,%s\n",  __func__, g_androidboot_mode);
		if (strncmp(g_androidboot_mode, CHARGE_MODE, 8)) {
			Is_Charger_Mode = 0;
		} else {
			Is_Charger_Mode = 1;
		}
		printk("%s,%d\n", __func__, Is_Charger_Mode);
	}
	pr_debug("usb_connecting: init wake lock.\n");
	if (!Is_Charger_Mode)
		wake_lock_init(&udc_wake_lock, WAKE_LOCK_SUSPEND, "usb_connecting");
	return 0;

err:
	return retval;
}

static void  udc_exit(void)
{
	DMSG_INFO_UDC("udc_exit: version %s\n", DRIVER_VERSION);
	if (!Is_Charger_Mode)
		wake_lock_destroy(&udc_wake_lock);
	platform_driver_unregister(&sunxi_udc_driver);
}

fs_initcall(udc_init);
module_exit(udc_exit);

MODULE_AUTHOR(DRIVER_AUTHOR);
MODULE_DESCRIPTION(DRIVER_DESC);
MODULE_VERSION(DRIVER_VERSION);
MODULE_LICENSE("GPL");
MODULE_ALIAS("platform:softwinner-usbgadget");
