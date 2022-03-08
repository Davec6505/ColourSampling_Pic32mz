#line 1 "C:/Users/Git/ColourSampling_Pic32mz/ColorSamplingPic32mz.c"
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
void SplitStr(char arr[][64],char* str,int chars,...);
#line 1 "c:/users/git/coloursampling_pic32mz/rtcc.h"
#line 1 "c:/users/git/coloursampling_pic32mz/uart.h"
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
#line 4 "C:/Users/Git/ColourSampling_Pic32mz/ColorSamplingPic32mz.c"
const char newline[] = {'\r','\n','\0'};
Timers *T0;
RTCC_Values rtc_vals;
RTCC_Values rtc_set_vals;

uint16_t tmr;
uint16_t tmr_;
static uint16_t pg_cnt;

char cnt,cntA;
char kk;
char readbuff[64];
char writebuff[64];

char uart2_rd;
char uart3_rd;
char txtA[20];
char *txtPtr;
#line 27 "C:/Users/Git/ColourSampling_Pic32mz/ColorSamplingPic32mz.c"
void main() {
long long pgtime = 0;
long long Lastmillis = 0;
int test,i;
char str[200];
char spltstr[20][64];
static uint8_t cntr;
static bit time_once;

 PerphialSetUp();
 EI();
 pg_cnt = 0;

 while(1){

 USB_Polling_Proc();

 T0 = GetTimer_Values();

 switch(pg_cnt){
 case MAIN:
 pgtime = T0->millis - T0->last_millis ;


 kk = HID_Read();
 if(kk != 0){
 pg_cnt = USB;
 break;
 }


 test = GetDiffence_In_Pointers(1);
 if(test != 0){
 pg_cnt = UART;
 break;
 }


 if(pgtime > 150){
 T0->last_millis = T0->millis;
 LATB9_bit = 1;
 pg_cnt = 1;
 }
 break;
 case SECONDARY:
 pgtime = T0->millis - T0->last_millis ;


 TimeOutputs();


 if(pgtime > 50){
 T0->last_millis = T0->millis;
 LATB9_bit = 0;
 pg_cnt = MAIN;
 }
 break;
 case USB:
 pgtime = T0->millis - T0->last_millis;

 if (kk != 0)
 {
 ArrClear(spltstr,6);
 strncpy(str,readbuff,64);
 SplitStr(spltstr,str,2,',','#');
 OutPuts(spltstr,str+0,0);
 pg_cnt = 0;
 break;
 }
 if(pgtime > 0){
 T0->last_millis = T0->millis;
 pg_cnt = 0;
 }
 break;
 case UART:
 pgtime = T0->millis - T0->last_millis ;
 if(test != 0){
 ReadBack_RingBufferB();
 pg_cnt = 0;
 break;
 }
 if(pgtime > 0){
 T0->last_millis = T0->millis;
 pg_cnt = 0;
 }
 break;
 default:
 pg_cnt = 0;
 T0->last_millis = T0->millis;
 break;
 }

 }
}



void OutPuts(char arr[][64],char *str,char type){
int rows = sizeof(arr);
int i;
 memset(writebuff,0,64);
 switch(type){
 case 0:
 strncpy(writebuff,arr[0],strlen(arr[0]));
 strcat(writebuff,"\r\n");
 for(i = 1; i < rows+1;i++){
 strcat(writebuff,arr[i]);
 strcat(writebuff,"\r\n");
 }
 break;
 case 1:
 strncpy(writebuff,str,strlen(str));
 break;
 default:
 break;
 }
 HID_Write(writebuff, 64);
}

void TimeOutputs(){
static bit time_once;
static int cnt_to_print = 0;
char txt_[6];
 LATB10_bit = RTCCONbits.HALFSEC;
 if(!time_once && RTCCONbits.HALFSEC){
 time_once = 1;
 ReadTime(&rtc_vals);
#line 168 "C:/Users/Git/ColourSampling_Pic32mz/ColorSamplingPic32mz.c"
 }else if(time_once && !RTCCONbits.HALFSEC)
 time_once = 0;

}
