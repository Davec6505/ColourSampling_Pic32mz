#line 1 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
#line 1 "c:/users/git/coloursampling_pic32mz/rtcc.h"
#line 1 "c:/users/git/coloursampling_pic32mz/uart.h"
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
#line 1 "c:/users/git/coloursampling_pic32mz/config.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 16 "c:/users/git/coloursampling_pic32mz/timers.h"
typedef struct {
unsigned long long millis;
unsigned long long last_millis;
unsigned int ms;
char sec;
char min;
char hr;
}Timers;






void ISR_Init();
void InitTimer1();
void InitTimer2();
static void TMR_System();
static void TMR_Timer();
Timers* GetTimer_Values();
#line 1 "c:/users/git/coloursampling_pic32mz/uart.h"
#line 1 "c:/users/git/coloursampling_pic32mz/stringadv.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdarg.h"


typedef void * va_list[1];
#line 1 "c:/users/git/coloursampling_pic32mz/uart.h"
#line 16 "c:/users/git/coloursampling_pic32mz/stringadv.h"
extern char *SplitBuff[64];









void ArrClear(char** arr,int row);
void SplitStr(char arr[][64],char* str,int chars,...);
#line 1 "c:/users/git/coloursampling_pic32mz/rtcc.h"
#line 21 "c:/users/git/coloursampling_pic32mz/config.h"
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
 void TimeOutputs();
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
#line 13 "c:/users/git/coloursampling_pic32mz/rtcc.h"
extern unsigned long time;
extern unsigned long date;



typedef struct{
unsigned int yr;
unsigned int mth;
unsigned int day;
unsigned int wk;

unsigned int hrs;
unsigned int mins;
unsigned int secs;

}RTCC_Values;






void InitRTCC(char osc_mod);
void InitRTCC_Tnterrupt();
void RTCC_Calibrate();
void SetRTCCInitial();
void SetRTCC(RTCC_Values* set_time);
void RTCC_ON();
void ReadTime(RTCC_Values* _time);
#line 5 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
unsigned long time=0x20260000;
unsigned long date=0x22030600;
#line 12 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
void InitRTCC(char osc_mod){
 DI();

 SYSKEY = 0x00000000;
 SYSKEY = 0xAA996655;
 SYSKEY = 0x556699AA;
 if(osc_mod == 1){
 RTCCONSET = 0x149;
 }
 else {
 RTCCONSET = 0x49;
 }

 SYSKEY = 0x33333333;
}
#line 34 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
void SetRTCCInitial(){

 RTCCONbits.ON = 0;
 Delay_ms(100);


 RTCTIME=time;
 RTCDATE=date;

 RTCCONbits.ON = 1;
 Delay_ms(100);


}




void SetRTCC(){
 DI();
 while((RTCCON&0x4)!=0);
 RTCTIME=time;
 RTCDATE=date;
 EI();

}


void RTCC_ON(RTCC_Values* set_time){
 do{
 RTCCONbits.ON = 1;
 Delay_ms(100);
 }while((RTCCON&0x40));
}
#line 75 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
void InitRTCC_Tnterrupt(){

 IEC1CLR=0x00008000;
 RTCCONCLR=0x8000;
 while(RTCCON&0x40);
 IFS1CLR=0x00008000;
 IPC8CLR=0x1f000000;
 IPC8SET=0x0d000000;
 IEC1SET=0x00008000;
 RTCTIME=0x16153300;
 RTCDATE=0x06102705;
 RTCALRMCLR=0xCFFF;
 ALRMTIME=0x16154300;
 ALRMDATE=0x06102705;
 RTCALRMSET=0x8000|0x00000600;
 RTCCONSET=0x8000;
 while(!(RTCCON&0x40));
}
#line 97 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
void RTCC_Calibrate(){

int cal=0x3FD;
unsigned int t0, t1;
 if(RTCCON&0x8000){

 do{
 t0=RTCTIME;
 t1=RTCTIME;
 }while(t0!=t1);
 if((t0&0xFF)==00){
 while(!(RTCCON&0x2));
 }
 }
 RTCCONCLR=0x03FF0000;
 RTCCONSET=cal;
}
#line 121 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
void RTCC_Interrupt() iv IVT_RTCC ilevel 7 ics ICS_SRS {


 IFS1CLR=0x00008000;

}

void ReadTime(RTCC_Values* _time){
char hr01,min01,sec01;
char txt[15];
unsigned long rtc_time;
unsigned long rtc_date;
#line 142 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
 hr01=min01=sec01=0;
 if((RTCCON&0x4)!=0)
 return;
 else{
 rtc_time = RTCTIME;
 rtc_date = RTCDATE;

 _time->secs = (rtc_time & 0x7f00) >> 8;
 _time->mins = (rtc_time & 0x7f0000) >> 16;
 _time->hrs = (rtc_time & 0x3f000000) >> 24;
 _time->wk = rtc_date & 0x0f;
 _time->day = (rtc_date & 0x3f00) >> 8;
 _time->mth = (rtc_date & 0x1f0000)>> 16;
 _time->yr = (rtc_date & 0xff000000)>> 24;

 }

}
