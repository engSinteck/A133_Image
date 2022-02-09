///*****************************************
//  Copyright (C) 2009-2019
//  ITE Tech. Inc. All Rights Reserved
//  Proprietary and Confidential
///*****************************************
//   @file   <TimerProcess.h>
//   @author Jau-Chih.Tseng@ite.com.tw
//   @date   2019/01/03
//   @fileversion: ITE_HDMITX_SAMPLE_3.27
//******************************************/

#ifndef _TIMERPROCESS_H
#define _TIMERPROCESS_H
#include "mcu.h"
#include "io.h"

#define CLOCK				   27000000L//22118400L//11059200L//24000000L////27000000L//12000000L //15000000L
#define MachineCycle			6//12
#define BAUD_RATE			   (115200L/(MachineCycle/6))
#define BAUD_SETTING			(65536L - ((CLOCK*12/MachineCycle)/(32L * BAUD_RATE)))
 //#define BAUD_SETTING			((256L*16L+8)-((CLOCK*16L)/(192L*BAUD_RATE)))/16L

#define One_Sec				 1000L

extern USHORT ucTickCount;

BOOL IsTimeOut(USHORT timeout);

//////////////////////////////////////////////////////////////
#define MAX_TimerTaskC SysTimerTask_non
typedef enum System_TimerTask_Type {
	eVideoCountingTimer,		// 0
	eAudioCountingTimer,		// 1
	eSWResetTimeOut,			// 2
	em_HPDAcceptCount,			// 3
	eusDectTxPlugTimer,			// 4
	euDelayX,					// 5
	eTxHDCPStateCounter,		// 6
	eLED1Ctrl,
	eLED2Ctrl,
	eLED3Ctrl,
	eLEDMonitor,
	eUpdateI2CSlaveReg,
	eCECTimeOut,
	SysTimerTask_non,
} System_TimerTask_Type;

typedef enum System_TimerTask_Run {
	SysTimerTask_AutoRun,
	SysTimerTask_OnceRun,
	SysTimerTask_NonRun,
} System_TimerTask_Run;

typedef struct TimerTask_Description{
	unsigned short  TimerTask_TickCount;
	unsigned short  TimerTask_AimCount;
	System_TimerTask_Type  TimerTask_name;
	System_TimerTask_Run	TimerTaskAutoRun;
} TimerTask_Description, *PTimerTask_Description;


extern void initialTimer0(void);
extern void system_tick(void);
BOOL TimeOutCheck(System_TimerTask_Type cTimerTask);

BOOL DestructTimerTask(System_TimerTask_Type cTimerTask);
BOOL initTimerTask(void);
void ProcessMultiTimerTask(void);
void CreatTimerTask(System_TimerTask_Type cTimerTask,
	USHORT Acount,
	System_TimerTask_Run AutoRun);

#endif

