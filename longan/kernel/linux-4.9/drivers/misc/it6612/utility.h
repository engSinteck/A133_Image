///*****************************************
//  Copyright (C) 2009-2019
//  ITE Tech. Inc. All Rights Reserved
//  Proprietary and Confidential
///*****************************************
//   @file   <Utility.h>
//   @author Jau-Chih.Tseng@ite.com.tw
//   @date   2019/01/03
//   @fileversion: ITE_HDMITX_SAMPLE_3.27
//******************************************/

#ifndef _Utility_h_
#define _Utility_h_

#include <linux/delay.h>
#include "typedef.h"
#ifdef _MCU_8051_
#include "Reg_c51.h"
#include "Mcu.h"
#endif

//#define MS_TimeOut(x) (((x)+LOOPMS-1)/LOOPMS)
#define MS_TimeOut(x) ((x)+1)//(x/20)+1
/*
#define VSTATE_MISS_SYNC_COUNT MS_TimeOut(2000)
//#define VSATE_CONFIRM_SCDT_COUNT MS_TimeOut(150)
//#define AUDIO_READY_TIMEOUT MS_TimeOut(200)
//#define AUDIO_STABLE_TIMEOUT MS_TimeOut(1000)
#define VSATE_CONFIRM_SCDT_COUNT MS_TimeOut(0)
#define AUDIO_READY_TIMEOUT MS_TimeOut(10)
#define AUDIO_STABLE_TIMEOUT MS_TimeOut(100)



#define MUTE_RESUMING_TIMEOUT MS_TimeOut(2500)
#define HDCP_WAITING_TIMEOUT MS_TimeOut(3000)

#define FORCE_SWRESET_TIMEOUT  MS_TimeOut(32766)
*/


#define VSTATE_CDR_DISCARD_TIME		 MS_TimeOut(6000)

#define VSTATE_MISS_SYNC_COUNT		 MS_TimeOut(5000)
#define VSTATE_SWRESET_TIMEOUT_COUNT MS_TimeOut(50)
#define VSATE_CONFIRM_SCDT_COUNT	 MS_TimeOut(20)
#define AUDIO_READY_TIMEOUT		 MS_TimeOut(20)
#define AUDIO_STABLE_TIMEOUT		 MS_TimeOut(20)	//MS_TimeOut(1000)

#define MUTE_RESUMING_TIMEOUT		 MS_TimeOut(2500)
#define HDCP_WAITING_TIMEOUT		 MS_TimeOut(3000)

#define FORCE_SWRESET_TIMEOUT		  MS_TimeOut(15000)

#define TX_UNPLUG_TIMEOUT		   MS_TimeOut(300)
#define TX_WAITVIDSTBLE_TIMEOUT	 MS_TimeOut(100)

#define TX_HDCP_TIMEOUT			 MS_TimeOut(6000)



#define CAT_HDMI_PORTA 0
#define CAT_HDMI_PORTB 1
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Global variable
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef _RXPOLLING_
USHORT currHTotal;
BYTE currXcnt;
BOOL currScanMode;
#endif
// alex 070327
// for chroma2229 audio error

///////////////////////////////////////////////////////////
// Function Prototype
///////////////////////////////////////////////////////////

//void SetTxLED(BYTE device,BOOL status);

void HoldSystem(void);
void delay1ms(USHORT ms);
void Dump_HDMITXReg(void);
void HoldSystem(void);


#endif//_Utility_h_
