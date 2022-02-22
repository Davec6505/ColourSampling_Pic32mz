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
#line 12 "c:/users/git/coloursampling_pic32mz/config.h"
 void PerphialSetUp();
 void InitTimer1();
 void InitTimer2();
 void Uart2InterruptSetup();
 void set_USB_Interrupt();
 void set_performance_mode();
#line 4 "C:/Users/Git/ColourSampling_Pic32mz/ColorSamplingPic32mz.c"
uint16_t tmr;
uint16_t tmr_;
char cnt;
char kk;
char readbuff[64];
char writebuff[64];
char uart_rd;

void main() {


 PerphialSetUp();
 EI();

 while(1){

 }
}

void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_AUTO {
 T1IF_bit = 0;

 tmr++;
 if(tmr>99)
 {
 tmr = 0;
 LATB10_bit = !LATB10_bit;
 }

}

void Timer2Interrupt() iv IVT_TIMER_2 ilevel 5 ics ICS_AUTO {
 T2IF_bit = 0;

 tmr_++;
 if(tmr_ > 449){
 tmr_ = 0;
 LATB9_bit = !LATB9_bit;
 }

}

void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 7 ics ICS_AUTO {

 uart_rd = UART2_Read();
 UART2_Write( uart_rd );

 U2RXIF_bit = 0;
}
