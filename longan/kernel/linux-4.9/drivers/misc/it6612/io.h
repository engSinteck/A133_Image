///*****************************************
//  Copyright (C) 2009-2019
//  ITE Tech. Inc. All Rights Reserved
//  Proprietary and Confidential
///*****************************************
//   @file   <IO.h>
//   @author Jau-Chih.Tseng@ite.com.tw
//   @date   2019/01/03
//   @fileversion: ITE_HDMITX_SAMPLE_3.27
//******************************************/

#ifndef _IO_h_
#define _IO_h_
#include "mcu.h"
#include "Reg_c51.h"
#include "utility.h"
#include "it6612.h"

///////////////////////////////////////////////////////////////////////////////
// Start: I2C for 8051
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// I2C for original function call
///////////////////////////////////////////////////////////////////////////////


void UartCommand();

BYTE HDMITX_ReadI2C_Byte(BYTE RegAddr);
SYS_STATUS HDMITX_WriteI2C_Byte(BYTE RegAddr,BYTE d);
SYS_STATUS HDMITX_ReadI2C_ByteN(BYTE RegAddr,BYTE *pData,int N);
SYS_STATUS HDMITX_WriteI2C_ByteN(BYTE RegAddr,BYTE *pData,int N);
SYS_STATUS HDMITX_SetI2C_Byte(BYTE Reg,BYTE Mask,BYTE Value);
SYS_STATUS HDMITX_ToggleBit(BYTE Reg,BYTE n);

BYTE CEC_ReadI2C_Byte(BYTE RegAddr);
SYS_STATUS CEC_WriteI2C_Byte(BYTE RegAddr,BYTE d);
SYS_STATUS CEC_ReadI2C_ByteN(BYTE RegAddr,BYTE *pData,int N);
SYS_STATUS CEC_WriteI2C_ByteN(BYTE RegAddr,BYTE *pData,int N);
SYS_STATUS CEC_SetI2C_Byte(BYTE Reg,BYTE Mask,BYTE Value);
SYS_STATUS CEC_ToggleBit(BYTE Reg,BYTE n);

BYTE HDMIRX_ReadI2C_Byte(BYTE RegAddr);
SYS_STATUS HDMIRX_WriteI2C_Byte(BYTE RegAddr,BYTE d);
SYS_STATUS HDMIRX_ReadI2C_ByteN(BYTE RegAddr,BYTE *pData,int N);
SYS_STATUS HDMIRX_WriteI2C_ByteN(BYTE RegAddr,BYTE *pData,int N);
SYS_STATUS HDMIRX_SetI2C_Byte(BYTE Reg,BYTE Mask,BYTE Value);
SYS_STATUS HDMIRX_ToggleBit(BYTE Reg,BYTE n);

#endif
