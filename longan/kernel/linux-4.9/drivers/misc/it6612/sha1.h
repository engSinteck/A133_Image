///*****************************************
//  Copyright (C) 2009-2016
//  ITE Tech. Inc. All Rights Reserved
//  Proprietary and Confidential
///*****************************************
//   @file   <sha1.h>
//   @author Jau-Chih.Tseng@ite.com.tw
//   @date   2016/06/21
//   @fileversion: ITE_HDMITX_SAMPLE_3.21
//******************************************/

#ifndef _SHA_1_H_
#define _SHA_1_H_

#ifdef _MCU_8051_
	#include "Mcu.h"
#endif

#ifdef Debug_message
// #include <stdio.h>
#endif
// #include <string.h>
#include "debug.h"
#include "config.h"
#include "typedef.h"

#ifndef HDCP_DEBUG_PRINTF
	#define HDCP_DEBUG_PRINTF(x)
#endif //HDCP_DEBUG_PRINTF

#ifndef HDCP_DEBUG_PRINTF1
	#define HDCP_DEBUG_PRINTF1(x)
#endif //HDCP_DEBUG_PRINTF1

#ifndef HDCP_DEBUG_PRINTF2
	#define HDCP_DEBUG_PRINTF2(x)
#endif //HDCP_DEBUG_PRINTF2


#ifndef DISABLE_HDCP
void SHA_Simple(void *p,WORD len,BYTE *output);
void SHATransform(ULONG * h);
#endif

#endif // _SHA_1_H_
