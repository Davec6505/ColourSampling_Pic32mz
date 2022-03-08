#line 1 "C:/Users/Git/ColourSampling_Pic32mz/StringAdv.c"
#line 1 "c:/users/git/coloursampling_pic32mz/stringadv.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdarg.h"


typedef void * va_list[1];
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
#line 16 "c:/users/git/coloursampling_pic32mz/stringadv.h"
extern char *SplitBuff[64];









void ArrClear(char** arr,int row);
void SplitStr(char arr[][64],char* str,int chars,...);
#line 8 "C:/Users/Git/ColourSampling_Pic32mz/StringAdv.c"
void ArrClear(char arr[][64],int row){
 int i,j;
 for(i=0;i<row;i++){
 for(j=0;j<sizeof((*arr));j++){
 arr[i][j] = 0;
 }
 }
}
#line 20 "C:/Users/Git/ColourSampling_Pic32mz/StringAdv.c"
void SplitStr(char arr[][64],char* str,int chars,...){
 va_list args;
int i,j,k,l;
char c[10];

  __va_start(args, chars) ;
 for(i=0;i<chars;i++)
 c[i] =  __va_arg(args, char) ;

 for(i=0,j=0,k=0;i<strlen(str);i++){
 arr[j][k] = str[i];
 for(l = 0; l < chars; l++){
 if(str[i] == c[l]){
 arr[j][k] = 0;
 j++;
 k=0;
 break;
 }
 }
 if(l < chars)
 continue;
 k++;
 if(str[i] == 0 || str[i] > 127 || str[i] < 32)
 break;
 }
 arr[j][k] = 0;
#line 57 "C:/Users/Git/ColourSampling_Pic32mz/StringAdv.c"
}
