#line 1 "C:/Users/Git/ColourSampling_Pic32mz/ColorSamplingPic32mz.c"
#line 1 "c:/users/git/coloursampling_pic32mz/config.h"
#line 1 "c:/users/git/coloursampling_pic32mz/isrconfig.h"









extern char readbuff[64];
extern char writebuff[64];





typedef struct {
unsigned long long millis;
unsigned long long last_millis;
unsigned int ms;
char sec;
char min;
char hr;
}Timers;







void ISR_Init();
static void TMR_System();
static void TMR_Timer();
Timers* GetTimer_Values();
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
#line 12 "c:/users/git/coloursampling_pic32mz/config.h"
extern uint16_t tmr;
extern uint16_t tmr_;
extern char uart_rd;



 void PerphialSetUp();
 void HID_Setp();
 void InitTimer1();
 void InitTimer2();
 void Uart2InterruptSetup();
 void set_USB_Interrupt();
 void set_performance_mode();
 void OutPuts(long long output);
#line 4 "C:/Users/Git/ColourSampling_Pic32mz/ColorSamplingPic32mz.c"
const char newline[] = {'\r','\n','\0'};
Timers *T0;

uint16_t tmr;
uint16_t tmr_;
static uint16_t pg_cnt;

char cnt;
char kk;
char readbuff[64];
char writebuff[64];

char uart_rd;
char txtA[20];
char *txtPtr;
#line 23 "C:/Users/Git/ColourSampling_Pic32mz/ColorSamplingPic32mz.c"
void main() {
long long pgtime = 0;
long long Lastmillis = 0;
 PerphialSetUp();
 EI();
 pg_cnt = 0;
 while(1){
 USB_Polling_Proc();

 T0 = GetTimer_Values();





 switch(pg_cnt){
 case 0:
 pgtime = T0->millis - T0->last_millis;
 kk = HID_Read();
 if (kk != 0)
 {
 for(cnt = 0; cnt < 64; cnt++)
 writebuff[cnt] = readbuff[cnt];
 HID_Write(writebuff, 64);
 }
 if(pgtime > 10){

 pg_cnt = 1;
 T0->last_millis = T0->millis;
 LATB10_bit = 1;
 }
 break;
 case 1:
 pgtime = T0->millis - T0->last_millis ;
 if(pgtime > 100){

 pg_cnt = 2;
 T0->last_millis = T0->millis;
 LATB10_bit = 0;
 }
 break;
 case 2:
 pgtime = T0->millis - T0->last_millis ;
 if(pgtime > 250){

 pg_cnt = 3;
 T0->last_millis = T0->millis;
 LATB10_bit = 1;
 }
 break;
 case 3:
 pgtime = T0->millis - T0->last_millis ;
 if(pgtime > 50){

 pg_cnt = 0;
 T0->last_millis = T0->millis;
 LATB10_bit = 0;
 }
 break;
 default:
 pg_cnt = 0;
 Lastmillis = T0->millis;
 break;
 }

 }
}

void PrintHandler(char c){
 UART1_Write(c);
}

void OutPuts(long long output){
 sprintf(txtA,"%d",output);
 txtPtr = strncat(txtA,newline,strlen(newline));
 memcpy(writebuff,txtPtr,strlen(txtPtr));
 HID_Write(writebuff, 64);
}
