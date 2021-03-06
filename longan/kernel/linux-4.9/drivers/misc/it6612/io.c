///*****************************************
//  Copyright (C) 2009-2019
//  ITE Tech. Inc. All Rights Reserved
//  Proprietary and Confidential
///*****************************************
//   @file   <IO.c>
//   @author Jau-Chih.Tseng@ite.com.tw
//   @date   2019/01/03
//   @fileversion: ITE_HDMITX_SAMPLE_3.27
//******************************************/
// #include <stdlib.h>
// #include <string.h>
#include "typedef.h"
#include "mcu.h"
#include "io.h"



// BYTE I2CADR = RXADR;
// BYTE I2CDEV = RXDEV;

///////////////////////////////////////////////////////////////////////////////
// Start: I2C for 8051
///////////////////////////////////////////////////////////////////////////////

BYTE HDMITX_ReadI2C_Byte(BYTE RegAddr)
{
	BYTE p_data;

	it66121_i2c_read_byte(TX0ADR, RegAddr, 1, &p_data, TX0DEV);

	return p_data;
}

SYS_STATUS HDMITX_WriteI2C_Byte(BYTE RegAddr, BYTE d)
{
	BOOL flag;

	flag = it66121_i2c_write_byte(TX0ADR, RegAddr, 1, &d, TX0DEV);

	return !flag;
}

SYS_STATUS HDMITX_ReadI2C_ByteN(BYTE RegAddr, BYTE *pData, int N)
{
	BOOL flag;

	flag = it66121_i2c_read_byte(TX0ADR, RegAddr, N, pData, TX0DEV);

	return !flag;
}

// SYS_STATUS HDMITX_WriteI2C_ByteN(BYTE RegAddr, BYTE _CODE *pData,int N)
// {
//	 //BOOL data flag;
//	 //flag = it66121_i2c_write_byte(TX0ADR, RegAddr, N, pData, TX0DEV);
//	 BOOL flag;
//	 BYTE I2C_buf[18];
//	 int	 i;
//	 for (i = 0; i < N; i++)
//	 {
//		 I2C_buf[i] = pData[i];
//		 flag = it66121_i2c_write_byte(TX0ADR, RegAddr++, 1, &I2C_buf[i], TX0DEV);
//	 }
//	 //flag = it66121_i2c_write_byte(TX0ADR, RegAddr++, N, I2C_buf, TX0DEV);
//	 return !flag;
// }

SYS_STATUS HDMITX_SetI2C_Byte(BYTE Reg, BYTE Mask, BYTE Value)
{
	BYTE Temp;
	if (Mask != 0xFF) {
		Temp = HDMITX_ReadI2C_Byte(Reg);
		Temp &= (~Mask);
		Temp |= Value&Mask;
	}
	else {
		Temp = Value;
	}
	return HDMITX_WriteI2C_Byte(Reg, Temp);
}

#if 0
SYS_STATUS HDMITX_ToggleBit(BYTE Reg, BYTE n)
{
	BYTE Temp;
	Temp = HDMITX_ReadI2C_Byte(Reg);
//	HDMITX_DEBUG_PRINTF(("INVERVIT  0x%bx[%bx]", Reg,n));
	printf("reg%02X = %02X -> toggle %dth bit ->", (int)Reg, (int)Temp, (int)n) ;
	Temp^= (1<<n) ;
	printf(" %02X\n",(int)Temp) ;

//	HDMITX_DEBUG_PRINTF(("0x%bx\n",Temp));
	return HDMITX_WriteI2C_Byte(Reg,Temp);
}
#endif

#ifdef SUPPORT_HDMIRX_I2C
BYTE HDMIRX_ReadI2C_Byte(BYTE RegAddr)
{
	BYTE p_data;

	it66121_i2c_read_byte(RXADR, RegAddr, 1, &p_data, TX0DEV);

	return p_data;
}

SYS_STATUS HDMIRX_WriteI2C_Byte(BYTE RegAddr, BYTE d)
{
	BOOL flag;

	flag = it66121_i2c_write_byte(RXADR, RegAddr, 1, &d, TX0DEV);

	return !flag;
}

SYS_STATUS HDMIRX_ReadI2C_ByteN(BYTE RegAddr, BYTE *pData, int N)
{
	BOOL flag;

	flag = it66121_i2c_read_byte(RXADR, RegAddr, N, pData, TX0DEV);

	return !flag;
}

SYS_STATUS HDMIRX_WriteI2C_ByteN(BYTE RegAddr, BYTE _CODE *pData, int N)
{
	//BOOL data flag;
	//flag = it66121_i2c_write_byte(RXADR,RegAddr,N,pData,TX0DEV);
	BOOL flag;
	BYTE I2C_buf[18];
	int	 i;
	for (i = 0; i < N; i++) {
		I2C_buf[i] = pData[i];
		flag = it66121_i2c_write_byte(RXADR, RegAddr++, 1, &I2C_buf[i], TX0DEV);
	}
	//flag = it66121_i2c_write_byte(RXADR, RegAddr++, N, I2C_buf, TX0DEV);
	return !flag;
}

SYS_STATUS HDMIRX_SetI2C_Byte(BYTE Reg, BYTE Mask, BYTE Value)
{
	BYTE Temp;
	Temp = HDMIRX_ReadI2C_Byte(Reg);
	Temp &= (~Mask);
	Temp |= Value & Mask;
	return HDMIRX_WriteI2C_Byte(Reg, Temp);
}

SYS_STATUS HDMIRX_ToggleBit(BYTE Reg, BYTE n)
{
	BYTE Temp;
	Temp = HDMIRX_ReadI2C_Byte(Reg);
//	HDMIRX_DEBUG_PRINTF(("INVERVIT  0x%bx[%bx]",Reg,n));
	printf("reg%02X = %02X -> toggle %dth bit ->", (int)Reg, (int)Temp, (int)n) ;
	Temp ^= (1 << n) ;
	printf(" %02X\n", (int)Temp) ;

//	HDMIRX_DEBUG_PRINTF(("0x%bx\n",Temp));
	return HDMIRX_WriteI2C_Byte(Reg, Temp);
}
#endif

BYTE CEC_ReadI2C_Byte(BYTE RegAddr)
{
	BYTE p_data;

	it66121_i2c_read_byte(TX0CECADR, RegAddr, 1, &p_data, TX0DEV);

	return p_data;
}

SYS_STATUS CEC_WriteI2C_Byte(BYTE RegAddr, BYTE d)
{
	BOOL flag;

	flag = it66121_i2c_write_byte(TX0CECADR, RegAddr, 1, &d, TX0DEV);

	return !flag;
}


SYS_STATUS CEC_SetI2C_Byte(BYTE Reg, BYTE Mask, BYTE Value)
{
	BYTE Temp;
	Temp = CEC_ReadI2C_Byte(Reg);
	Temp &= (~Mask);
	Temp |= Value & Mask;
	return CEC_WriteI2C_Byte(Reg, Temp);
}
#if 0

SYS_STATUS CEC_ReadI2C_ByteN(BYTE RegAddr,BYTE *pData,int N)
{
	BOOL data flag;

	flag = it66121_i2c_read_byte(TX0CECADR, RegAddr, N, pData, TX0DEV);

	return !flag;
}

SYS_STATUS CEC_WriteI2C_ByteN(BYTE RegAddr,BYTE _CODE *pData,int N)
{
	//BOOL data flag;
	//flag = it66121_i2c_write_byte(TX0CECADR,RegAddr,N,pData,TX0DEV);
	BOOL flag;
	BYTE I2C_buf[18];
	int	 i;
	for (i = 0; i < N; i++) {
		I2C_buf[i] = pData[i];
		flag = it66121_i2c_write_byte(TX0CECADR, RegAddr++, 1, &I2C_buf[i], TX0DEV);
	}
	//flag = it66121_i2c_write_byte(TX0CECADR, RegAddr++, N, I2C_buf, TX0DEV);
	return !flag;
}


SYS_STATUS CEC_ToggleBit(BYTE Reg,BYTE n)
{
	BYTE Temp;
	Temp = CEC_ReadI2C_Byte(Reg);
//	CEC_DEBUG_PRINTF(("INVERVIT  0x%bx[%bx]",Reg,n));
	printf("reg%02X = %02X -> toggle %dth bit ->",(int)Reg,(int)Temp,(int)n) ;
	Temp^= (1<<n) ;
	printf(" %02X\n",(int)Temp) ;

//	CEC_DEBUG_PRINTF(("0x%bx\n",Temp));
	CEC_WriteI2C_Byte(Reg,Temp);
	return ER_SUCCESS ;
}

#endif
