#ifndef ISRCONFIG_H
#define ISRCONFIG_H

//////////////////////////////////////////////
//defines


/////////////////////////////////////////////
//consta and globals
extern char readbuff[64];
extern char writebuff[64];

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





/////////////////////////////////////////////
//function prototypes
void ISR_Init();
static void TMR_System();
static void TMR_Timer();
Timers* GetTimer_Values();
#endif