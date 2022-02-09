///*****************************************
//  Copyright (C) 2009-2019
//  ITE Tech. Inc. All Rights Reserved
//  Proprietary and Confidential
///*****************************************
//   @file   <Utility.c>
//   @author Jau-Chih.Tseng@ite.com.tw
//   @date   2019/01/03
//   @fileversion: ITE_HDMITX_SAMPLE_3.27
//******************************************/
#include "mcu.h"
#include "hdmitx.h"
#include "TimerProcess.h"

#ifdef _MCU_8051_
void delay1ms(USHORT ms)
{
	USHORT ucStartTickCount, diff;
#ifdef MySon
	 if (ms < 50)
		ms=ms * 6;
#endif
	ucStartTickCount=ucTickCount;
	do {
		if (ucTickCount<ucStartTickCount)
		{
			diff=0xffff-(ucStartTickCount-ucTickCount);
		}
		else
		{
			diff=ucTickCount-ucStartTickCount;
		}
	}while(diff<ms);
}
#else
void delay1ms(USHORT ms)
{
	mdelay(ms);
}
#endif

void HoldSystem(void)
{
	/*
	Hold_Pin=1;
	while(!Hold_Pin) {
		printf("Hold\\\r") ;
		printf("Hold-\r") ;
		printf("Hold/\r") ;
		printf("Hold|\r") ;
	}
	*/
}

#ifdef SUPPORT_UART_CMD
///////////////////////////////////////////////////////////////////////////////
// I2C for original function call
///////////////////////////////////////////////////////////////////////////////

void DumpReg(BYTE dumpAddress)
{
	int i, j ;
	BYTE BuffData[16] ;
	BYTE DataIn;
	printf("	   ");
	for( j = 0; j < 16; j++ ) {
		printf(" %02X", (int)j);
		if ( (j == 3) ||(j == 7) ||(j == 11))
		{
			printf(("  "));
		}
	}
	printf("\n		-----------------------------------------------------\n");
///////////////////////////////////////////////
	DataIn=0;
	it66121_i2c_write_byte(dumpAddress, 0x0f, 1, &DataIn, 0);
///////////////////////////////////////////////
	for(i = 0 ; i < 0x100 ; i+=16 ) {
		printf("[%3X]  ", (int)i);
		it66121_i2c_read_byte(dumpAddress, i, 16, BuffData, 0);
		for( j = 0 ; j < 16 ; j++ )
		{
			printf(" %02X", (int)BuffData[j]);
			if ( (j == 3) ||(j == 7) ||(j == 11))
			{
				printf(" -");
			}
		}
		printf("\n");
		if ( (i % 0x40) == 0x30)
		{
			printf("		-----------------------------------------------------\n");
		}
	}
	///////////////////////////////////////////////
	DataIn=1;
	it66121_i2c_write_byte(dumpAddress, 0x0f, 1, &DataIn, 0);
	///////////////////////////////////////////////
	for(i = 0x100; i < 0x200 ; i+=16 ) {
		printf("[%3X]  ", (int)i);
		it66121_i2c_read_byte(dumpAddress, i&0xff, 16, BuffData, 0);
		for( j = 0 ; j < 16 ; j++ )
		{
			printf(" %02X", (int)BuffData[j]);
			if ( (j == 3) ||(j == 7) ||(j == 11))
			{
				printf(" -");
			}
		}
		printf("\n");
		if ( (i % 0x40)  ==  0x30)
		{
			printf("		-----------------------------------------------------\n");
		}

	}

	///////////////////////////////////////////////
	DataIn=0;
	it66121_i2c_write_byte(dumpAddress, 0x0f, 1, &DataIn, 0);
	///////////////////////////////////////////////
}

void ConfigfHdmiVendorSpecificInfoFrame(BYTE _3D_Stru);
void SetOutputColorDepthPhase(BYTE ColorDepth, BYTE bPhase);

void UartCommand(void)
{
	char STR[1];
	static int address = 0x98;
	if (RI) {
		while(1)
		{
			printf("Operation[W/R/D]:");
			scanf("%0s", STR);printf("\n");
			if (0 == strcmp(STR, "D") || 0 == strcmp(STR, "d"))
			{
				DumpReg(address);
			}
			else if (0 == strcmp(STR, "c")  || 0 == strcmp(STR, "C"))
			{
				int ewdata=0;
				printf("Color depth [8/10/12]:");
				scanf("%d", &ewdata);printf("\n");
				if (ewdata == 12)		  ewdata=36;
				else if (ewdata == 10)	ewdata=30;
				else					ewdata=0;
				SetOutputColorDepthPhase((BYTE)ewdata, 0);
			}
			else if (0 == strcmp(STR, "3"))
			{
				int ewdata=0, __3D_Stru;
				printf("[1]:2D  [0]:Frame Packing  [6]:Top and Botton  [8]:Side by Side\n");
				scanf("%02x", &__3D_Stru);printf("\n");
				if (__3D_Stru == 1)
				{
					it66121_i2c_write_byte((BYTE)address, 0xd2, 1, ((BYTE *)&ewdata), 0);
				}
				else
				{
					ConfigfHdmiVendorSpecificInfoFrame(__3D_Stru);
				}
			}
			else if (0 == strcmp(STR, "W") || 0 == strcmp(STR, "w"))
			{
				int offset, ewdata;
				printf("[Address][Offset][Data]:");
				scanf("%02x %02x %02x", &address, &offset, &ewdata);printf("\n");
				it66121_i2c_write_byte((BYTE)address, (BYTE)offset, 1, ((BYTE *)&ewdata)+1, 0);
				it66121_i2c_read_byte((BYTE)address, (BYTE)offset, 1, ((BYTE *)&ewdata)+1, 0);
				printf("%02x, %02x, %02x\n", address, offset, ewdata);
			}
			else if ( 0 == strcmp(STR, "R") || 0 == strcmp(STR, "r"))
			{
				int offset, count, j;
				BYTE DataBf[16];
				printf("[Address][Offset][count]:");
				scanf("%02x %02x %02d", &address, &offset, &count);printf("\n");
				printf("Address = %02x, Offset = %02x, \n", address, offset);
				if (count>26)count=26;
				while(RI == 0)
				{
					printf("[%3X]  ", (int)offset);
					if (it66121_i2c_read_byte(address, offset, count, DataBf, 0))
					{
						for( j = 0 ; j < count ; j++ )
						{
							if (0 == (j%4) && j)
							{
								printf(" -");
							}
							printf(" %02X", (int)DataBf[j]);
						}
						printf("\r");
					}
					else
					{
						printf("\r*****I2C Read Fail******\n");
						break;
					}
				}
				printf("\n");
			}
			else if ( 0 == strcmp(STR, "P") || 0 == strcmp(STR, "p"))
			{
				//show_vid_info();
			}
			else if ( 0 == strcmp(STR, "S") || 0 == strcmp(STR, "s"))
			{
				int setVIC;
				extern _IDATA BYTE bOutputColorMode;
				#include "hdmitx_sys.h"
				printf("HDMITX_ChangeDisplayOption == >VIC = ");
				scanf(" %d", &setVIC);
				printf("\n");
				HDMITX_ChangeDisplayOption(setVIC, bOutputColorMode) ;
				HDMITX_SetOutput();
			}
			else
			{
				printf("Press not 'Z/z'  key continue\n");
				if (0 == strcmp(STR, "Z") || 0 == strcmp(STR, "z"))
				{
					printf(" ==  == Continue Normal Operation ==  == \n");
					break;
				}
				else
				{
					printf("Press 'Z/z' key to break setup mode\n");
					continue;
				}
			}
		}
	}
}
#endif
