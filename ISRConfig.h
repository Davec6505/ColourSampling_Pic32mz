#ifndef ISRCONFIG_H
#define ISRCONFIG_H

#include "Config.h"
#include <stdint.h>
//////////////////////////////////////////////
//defines


/////////////////////////////////////////////
//consta and globals
extern char readbuff[64];
extern char writebuff[64];

extern char ringBufferA[1024];
extern char ringBufferB[1024];
/////////////////////////////////////////////
//structs, unions and enums

typedef struct {
int16_t ringHead;
int16_t ringTail;
int16_t ringDiff;
}RingBuffer;


typedef struct {
unsigned long long millis;
unsigned long long last_millis;
unsigned int ms;
char sec;
char min;
char hr;
}Timers;





/////////////////////////////////////////////
//function prototypes
void ISR_Init();
static void TMR_System();
static void TMR_Timer();
Timers* GetTimer_Values();
static void GetUart2Chars();
static void PutUart2Chars();
static void GetUart3Chars();
static void PutUart3Chars();
RingBuffer* GetDiffence_In_Pointers(RingBuffer *diffPtr);


#endif