///*****************************************
//  Copyright (C) 2009 - 2019
//  ITE Tech. Inc. All Rights Reserved
//  Proprietary and Confidential
///*****************************************
//   @file   <TimerProcess.c>
//   @author Jau - Chih.Tseng@ite.com.tw
//   @date   2019/01/03
//   @fileversion: ITE_HDMITX_SAMPLE_3.27
//******************************************/

#include "TimerProcess.h"

USHORT ucTickCount;
USHORT ucPrevTickCount ;

#ifdef _MCU_8051_
void init_timer(void)
{
	TMOD&=0xF0;
	TMOD|=0x01;	 // Timer 0,Mode 0,16 bit
	TH0 = (65536L - (CLOCK/(1000L*MachineCycle))) >> 8;
	TL0 = (65536L - (CLOCK/(1000L*MachineCycle)));
	ET0 = TRUE;
	TR0 = TRUE;
////////////////////////////////////////////////////////////////
#if 0
	SCON = 0x50;		 /* Setup serial port control register */
						/* Mode 1: 8-bit uart var. baud rate */
						/* REN: enable receiver */
	PCON&= 0x7F;		/* Clear SMOD bit in power ctrl reg */
	PCON|= 0x80;		/* This bit doubles the baud rate */
	TMOD&= 0xCF;		/* Setup timer/counter mode register */
						/* Clear M1 and M0 for timer 1 */
	TMOD|= 0x20;		/* Set M1 for 8-bit autoreload timer */
	TH1 = BAUD_SETTING;
	TR1 = 1;			 /* Start timer 1 */
	TI = 1;			  /* Set TI to indicate ready to xmit */
#endif
#if 1
	TL2 = BAUD_SETTING;
	TH2 = BAUD_SETTING >> 8;
	RCAP2L = BAUD_SETTING;
	RCAP2H = BAUD_SETTING >> 8;

	SCON = 0x52;	//  For stdio.h (printf),  TI(SCON[1]) must set to "1"
	T2CON = 0x34;
	TR2 = FALSE;
	TR2 = TRUE;
#endif
////////////////////////////////////////////////////////////////
	EA = TRUE;
}

/*
USHORT CalTimer(ULONG SetupCnt)
{
	if (SetupCnt > ucTickCount) {
		return (0xffff - (SetupCnt - ucTickCount));
	}
	else {
		return (ucTickCount - SetupCnt);
	}
}
*/
/*
void timerCountDown(void)
{

}
*/
///////////////////////////////////////////////////////////////////////
void int_t0(void) interrupt 1// using 2
{
//			 1000								  CLOCK
//1ms = ------------------------------------ = ---------------------
//		1000000(u sec)						 1000*MachineCycle
//	  ---------------- * MachineCycle
//		   CLOCK

	TH0 = (65536L - (CLOCK/(2000L*MachineCycle))) >> 8;
	TL0 = (65536L - (CLOCK/(2000L*MachineCycle)));
	ucTickCount++;
	//timerCountDown(void);
}

#endif


TimerTask_Description TimerTask[MAX_TimerTaskC];

BYTE TimerTaskCheck(void);
BYTE MateTimerTask(System_TimerTask_Type cTimerTask);
BYTE NewTimerTaskAlloca(void);

BOOL IsTimeOut(USHORT timeout)
{
	USHORT diff ;

	diff = (ucTickCount - ucPrevTickCount) & 0xFFFF ;
	if ( diff > timeout ) {
		ucPrevTickCount = ucTickCount ;
		return TRUE ;
	}
	return FALSE ;
}

BOOL initTimerTask(void)
{
	BYTE j = 0;
	for(j = 0; j < MAX_TimerTaskC; j++) {
		TimerTask[j].TimerTask_name = SysTimerTask_non;
	}
	return TRUE;
}



void CreatTimerTask(System_TimerTask_Type cTimerTask,
	USHORT Acount,
	System_TimerTask_Run AutoRun)
{
		TimerTask[cTimerTask].TimerTask_name = cTimerTask;
		TimerTask[cTimerTask].TimerTask_AimCount = Acount;
		TimerTask[cTimerTask].TimerTask_TickCount = ucTickCount;
		TimerTask[cTimerTask].TimerTaskAutoRun = AutoRun;

// disable 	printf("[%06u]---CreatTimerTask[ %s ] : [%u] : [%u] \n",ucTickCount,
// disable 											TimeStr[cTimerTask],
// disable 											TimerTask[cTimerTask].TimerTask_AimCount,
// disable 											TimerTask[cTimerTask].TimerTask_TickCount);
}

USHORT CalTimer(ULONG SetupCnt)
{
	if (SetupCnt > ucTickCount) {
		return (0xffff - (SetupCnt  -  ucTickCount));
	}
	else {
		return (ucTickCount - SetupCnt);
	}
}



BOOL DestructTimerTask(System_TimerTask_Type cTimerTask)
{
// disable 	printf("[%06u]DestructTimerTask[ %s ] : [%u] : [%u] \n",ucTickCount,
// disable 											TimeStr[cTimerTask],
// disable 											TimerTask[cTimerTask].TimerTask_AimCount,
// disable 											ucTickCount);
	TimerTask[cTimerTask].TimerTask_name = SysTimerTask_non;

		return TRUE;
}

BOOL TimeOutCheck(System_TimerTask_Type cTimerTask)
{
	if (TimerTask[cTimerTask].TimerTask_name == SysTimerTask_non)
		return TRUE;
	else
		return FALSE;

}

void ProcessMultiTimerTask(void)
{
	BYTE j = 0,i = 0;
	System_TimerTask_Type ProcessCnt;
	for(ProcessCnt = 0; ProcessCnt < MAX_TimerTaskC; ProcessCnt++) {
		if (TimerTask[ProcessCnt].TimerTask_name == SysTimerTask_non)
			continue;

		if (CalTimer(TimerTask[ProcessCnt].TimerTask_TickCount) >
			TimerTask[ProcessCnt].TimerTask_AimCount )
		{

			if (TimerTask[ProcessCnt].TimerTaskAutoRun == SysTimerTask_AutoRun)
				TimerTask[ProcessCnt].TimerTask_TickCount = ucTickCount;
			else
				DestructTimerTask(TimerTask[ProcessCnt].TimerTask_name);
		}

	}
}
