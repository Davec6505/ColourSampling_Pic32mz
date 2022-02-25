#line 1 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
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
#line 1 "c:/users/git/coloursampling_pic32mz/isrconfig.h"
#line 4 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
static Timers T0;



void (*TMR_Sys)();
void (*TMR_Tmr)();

void ISR_Init(){
 TMR_Sys = &TMR_System;
 TMR_Tmr = &TMR_Timer;
}
#line 19 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
 void USBPoll() iv IVT_USB ilevel 5 ics ICS_SRS {
 USB_Interrupt_Proc();
}
#line 27 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
static void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_AUTO {
 T1IF_bit = 0;


}
static void TMR_System(){

}
#line 41 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
static void Timer2Interrupt() iv IVT_TIMER_2 ilevel 5 ics ICS_AUTO {
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


void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 7 ics ICS_AUTO {

 uart_rd = UART2_Read();
 UART2_Write( uart_rd );

 U2RXIF_bit = 0;
}
