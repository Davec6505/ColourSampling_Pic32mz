#ifndef RTCC_H
#define RTCC_H

//////////////////////////////////////////////////////////////
//includes
#include "UART.h"
/////////////////////////////////////////////////////////////
//defines
#define RTCCDebug

/////////////////////////////////////////////////////////////
//consts and vars
extern unsigned long time;// set time to 04 hr, 15 min, 33 sec
extern unsigned long date;// set date to Friday 27 Oct 2006

////////////////////////////////////////////////////////////
//structs unions enums
typedef struct{
unsigned int yr;
unsigned int mth;
unsigned int day;
unsigned int wk;

unsigned int hrs;
unsigned int mins;
unsigned int secs;

}RTCC_Values;




////////////////////////////////////////////////////////////
//function Prototypes
void InitRTCC(char osc_mod);
void InitRTCC_Tnterrupt();
void RTCC_Calibrate();
void SetRTCCInitial();
void SetRTCC(RTCC_Values* set_time);
void RTCC_ON();
void ReadTime(RTCC_Values* _time);

#endif