/* sound\soc\sunxi\sunxi-pcm.h
 * (C) Copyright 2014-2017
 * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
 * Wolfgang Huang <huangjinhui@allwinnertech.com>
 *
 * some simple description for this code
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 */
#ifndef __SUNXI_PCM_H_
#define __SUNXI_PCM_H_

struct sunxi_dma_params {
	char *name;
	dma_addr_t dma_addr;
	u8 src_maxburst;
	u8 dst_maxburst;
	u8 dma_drq_type_num;
};

struct sndhdmi_priv {
	unsigned int hdmi_format;
};

extern int asoc_dma_platform_register(struct device *dev, unsigned int flags);
extern void asoc_dma_platform_unregister(struct device *dev);
extern int sunxi_ahub_get_rawflag(void);

enum {
	RX_SYNC_AUDIOCODEC = 0,
	RX_SYNC_DAUDIO0,
	RX_SYNC_DAUDIO1,
	RX_SYNC_DAUDIO2,
	RX_SYNC_DAUDIO3,
	RX_SYNC_DMIC,
	RX_SYNC_MAX,
};
enum {
	RX_SYNC_STATE_IDLE = 0,
	RX_SYNC_STATE_WORK,
	RX_SYNC_STATE_SHUTDOWN,
};

void sunxi_rx_sync_startup(void *data, int type,
				void (*route_enable)(void *data, bool onoff),
				void (*rx_enable)(void *data, bool onoff));
void sunxi_rx_sync_shutdown(int type);
void sunxi_rx_sync_control(int type, bool enable);

#endif /* __SUNXI_PCM_H_ */
