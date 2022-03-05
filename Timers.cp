#line 1 "C:/Users/Git/ColourSampling_Pic32mz/Timers.c"
#line 1 "c:/users/git/coloursampling_pic32mz/timers.h"
#line 1 "c:/users/git/coloursampling_pic32mz/config.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stddef.h"



typedef long ptrdiff_t;
typedef unsigned long size_t;
typedef unsigned long wchar_t;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/coloursampling_pic32mz/timers.h"
#line 1 "c:/users/git/coloursampling_pic32mz/uart.h"
#line 1 "c:/users/git/coloursampling_pic32mz/config.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 13 "c:/users/git/coloursampling_pic32mz/uart.h"
extern char readbuff[64];
extern char writebuff[64];

extern char ringBufferA[1024];
extern char ringBufferB[1024];




typedef struct {
int ringHead;
int ringTail;
int ringDiff;
}RingBuffer;







void UART_Init();
void Uart2InterruptSetup();
void Uart3InterruptSetup();
static void GetUart2Chars();
static void PutUart2Chars();
void Enable_Uart3_Interrupts(char rx_tx);
static void GetUart3Chars();
static void PutUart3Chars();
void ReadBack_RingBufferB();
int GetDiffence_In_Pointers(char buffer);
void PrintHandler(char c);
#line 1 "c:/users/git/coloursampling_pic32mz/stringadv.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdarg.h"


typedef void * va_list[1];
#line 1 "c:/users/git/coloursampling_pic32mz/uart.h"
#line 16 "c:/users/git/coloursampling_pic32mz/stringadv.h"
extern char *SplitBuff[64];









void ArrClear(char** arr,int row);
void SplitStr(char** arr,char* str,char a);
#line 1 "c:/users/git/coloursampling_pic32mz/rtcc.h"










extern unsigned long time;
extern unsigned long date;








void IniyRTCC();
void InitRTCC_Tnterrupt();
void RTCC_Calibrate();
void SetRTCCInitial();
void SetRTCC();
#line 17 "c:/users/git/coloursampling_pic32mz/config.h"
extern uint16_t tmr;
extern uint16_t tmr_;

extern char uart2_rd;
extern char uart3_rd;



enum Thread{
MAIN,
SECONDARY,
USB,
UART};



 void PerphialSetUp();
 void HID_Setp();
 void set_performance_mode();
 void OutPuts(char arr[][64],char* str,char type);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 20 "c:/users/git/coloursampling_pic32mz/timers.h"
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




void ISR_Init();
void InitTimer1();
void InitTimer2();
static void TMR_System();
static void TMR_Timer();
Timers* GetTimer_Values();
#line 5 "C:/Users/Git/ColourSampling_Pic32mz/Timers.c"
static Timers T0;



void (*TMR_Sys)();
void (*TMR_Tmr)();


void ISR_Init(){
 TMR_Sys = &TMR_System;
 TMR_Tmr = &TMR_Timer;
}
#line 25 "C:/Users/Git/ColourSampling_Pic32mz/Timers.c"
void InitTimer1(){
 T1CON = 0x8000;

 T1IP0_bit = 0;
 T1IP1_bit = 1;
 T1IP2_bit = 1;

 T1IS0_bit = 1;
 T1IS1_bit = 0;

 T1IF_bit = 0;
 T1IE_bit = 1;
 PR1 = 50000;
 TMR1 = 0;
}

void InitTimer2(){
 T2CON = 0x8000;

 T2IP0_bit = 0;
 T2IP1_bit = 1;
 T2IP2_bit = 1;

 T2IS0_bit = 0;
 T2IS1_bit = 1;

 T2IF_bit = 0;
 T2IE_bit = 1;
 PR2 = 50000;
 TMR2 = 0;
}

static void Timer1Interrupt() iv IVT_TIMER_1 ilevel 6 ics ICS_AUTO {
 T1IF_bit = 0;


}

static void TMR_System(){

}
#line 72 "C:/Users/Git/ColourSampling_Pic32mz/Timers.c"
static void Timer2Interrupt() iv IVT_TIMER_2 ilevel 6 ics ICS_AUTO {
 T2IF_bit = 0;

 TMR_Tmr();
}

static void TMR_Timer(){
 T0.millis++;
 T0.ms++;
 if(T0.ms > 999){
 T0.ms = 0;
 T0.sec++;
 LATB9_bit = !LATB9_bit;
 if(T0.sec > 59){
 T0.sec = 0;
 T0.min++;
 if(T0.sec > 59){
 T0.min = 0;
 T0.hr++;
 if(T0.hr > 23){
 T0.hr = 0;
 }
 }
 }
 }
}


Timers* GetTimer_Values(){
 return &T0;
}
