#ifndef TIMERS_H
#define TIMERS_H

#include "Config.h"
#include <stdint.h>
//////////////////////////////////////////////
//defines


/////////////////////////////////////////////
//consta and globals


/////////////////////////////////////////////
//structs, unions and enums




typedef struct {
unsigned long long millis;
unsigned long long last_millis;
unsigned int ms;
char sec;
char min;
char hr;
}Timers;


typedef struct{
char yr10;
char yr01;
char mn10;
char mn01;
char dy10;
char dy01;
char wk;

char hr10;
char hr01;
char min10;
char min01;
char sec10;
char sec01;
}RTCC;


/////////////////////////////////////////////
//function prototypes
void ISR_Init();
void InitTimer1();
void InitTimer2();
static void TMR_System();
static void TMR_Timer();
Timers* GetTimer_Values();


#endif