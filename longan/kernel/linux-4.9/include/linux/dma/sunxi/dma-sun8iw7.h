/*
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 */

#ifndef __DMA_SUN8IW7__
#define __DMA_SUN8IW7__

/*
 * The source DRQ type and port corresponding relation
 */
#define DRQSRC_SRAM		0
#define DRQSRC_SDRAM		0
#define DRQSRC_SPDIFRX		2
#define DRQSRC_OWARX		DRQSRC_SPDIFRX
#define DRQSRC_DAUDIO_0_RX	3
#define DRQSRC_DAI0_RX		DRQSRC_DAUDIO_0_RX
#define DRQSRC_DAUDIO_1_RX	4
#define DRQSRC_DAI1_RX		DRQSRC_DAUDIO_1_RX
/*#define DRQSRC_AC97		5*/
/*#define DRQSRC_DAUDIO_2_RX	6*/
#define DRQSRC_DAUDIO_2_RX	27
#define DRQSRC_NAND0		5
#define DRQSRC_UART0_RX		6
#define DRQSRC_UART1_RX		7
#define DRQSRC_UART2_RX		8
#define DRQSRC_UART3_RX		9
#define DRQSRC_SS_RX		16
#define DRQSRC_OTG_EP1		17
/* #define DRQSRC_RESEVER	18 */
#define DRQSRC_AUDIO_CODEC	15
#define DRQSRC_CODEC		DRQSRC_AUDIO_CODEC
#define DRQSRC_CODEC_ADC	DRQSRC_AUDIO_CODEC
/*#define DRQSRC_IR0RX		20
#define DRQSRC_IR1RX		21
#define DRQSRC_EMAC		22
#define DRQSRC_TP		23
#define DRQSRC_TPRX		DRQSRC_TP*/
#define DRQSRC_SPI0_RX		23
#define DRQSRC_SPI1_RX		24
/*#define DRQSRC_SPI2_RX	26*/
/*#define DRQSRC_SPI3_RX	27*/
#define DRQSRC_OTG_EP2		18
#define DRQSRC_OTG_EP3		19
#define DRQSRC_OTG_EP4		20
/*#define DRQSRC_OTG_EP5	21*/

/*
 * The destination DRQ type and port corresponding relation
 */

#define DRQDST_SRAM		0
#define DRQDST_SDRAM		0
#define DRQDST_SPDIFTX		2
#define DRQDST_OWATX		DRQDST_SPDIFTX
#define DRQDST_DAUDIO_0_TX	3
#define DRQDST_DAI0_TX		DRQDST_DAUDIO_0_TX
#define DRQDST_DAUDIO_1_TX	4
#define DRQDST_DAI1_TX		DRQDST_DAUDIO_1_TX
/*#define DRQDST_AC97		5*/
/*#define DRQDST_DAUDIO_2_TX	6*/
#define DRQDST_DAUDIO_2_TX	27
#define DRQDST_DAI2_TX		DRQDST_DAUDIO_2_TX
#define DRQDST_NAND0		5
#define DRQDST_UART0_TX		6
#define DRQDST_UART1_TX		7
#define DRQDST_UART2_TX		8
#define DRQDST_UART3_TX		9
#define DRQDST_SS_TX		16
#define DRQDST_OTG_EP1		17
/* #define DRQDST_RESEVER	18 */
#define DRQDST_AUDIO_CODEC	15
#define DRQDST_CODEC		DRQDST_AUDIO_CODEC
#define DRQDST_CODEC_ADC	DRQDST_AUDIO_CODEC
/*#define DRQDST_IR0RX		20
#define DRQDST_IR1RX		21
#define DRQDST_EMAC		22
#define DRQDST_TP		23
#define DRQDST_TPRX		DRQDST_TP*/
#define DRQDST_SPI0_TX		23
#define DRQDST_SPI1_TX		24
/*#define DRQDST_SPI2_RX	26*/
/*#define DRQDST_SPI3_RX	27*/
#define DRQDST_OTG_EP2		18
#define DRQDST_OTG_EP3		19
#define DRQDST_OTG_EP4		20
/*#define DRQSRC_OTG_EP5	21*/
#endif /*__DMA_SUN8IW7__  */

