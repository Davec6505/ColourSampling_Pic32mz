#line 1 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
#line 1 "c:/users/git/coloursampling_pic32mz/isrconfig.h"
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
#line 1 "c:/users/git/coloursampling_pic32mz/isrconfig.h"
#line 12 "c:/users/git/coloursampling_pic32mz/config.h"
extern uint16_t tmr;
extern uint16_t tmr_;

extern char uart2_rd;
extern char uart3_rd;


 void PerphialSetUp();
 void HID_Setp();
 void InitTimer1();
 void InitTimer2();
 void Uart2InterruptSetup();
 void Uart3InterruptSetup();
 void set_performance_mode();
 void PrintHandler(char c);
 void OutPuts(long long output);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 12 "c:/users/git/coloursampling_pic32mz/isrconfig.h"
extern char readbuff[64];
extern char writebuff[64];

extern char ringBufferA[1024];
extern char ringBufferB[1024];



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







void ISR_Init();
static void TMR_System();
static void TMR_Timer();
Timers* GetTimer_Values();
static void GetUart2Chars();
static void PutUart2Chars();
static void GetUart3Chars();
static void PutUart3Chars();
RingBuffer* GetDiffence_In_Pointers(RingBuffer *diffPtr);
#line 5 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
static Timers T0;

static RingBuffer ringBuffA = {
 0,0,0
};
static RingBuffer ringBuffB ={
0,0,0
};

char ringBufferA[1024];
char ringBufferB[1024];

void (*TMR_Sys)();
void (*TMR_Tmr)();
void (*UART2_Get)();
void (*UART2_Put)();
void (*UART3_Get)();
void (*UART3_Put)();

void ISR_Init(){
 TMR_Sys = &TMR_System;
 TMR_Tmr = &TMR_Timer;
 UART2_Get = &GetUart2Chars;
 UART3_Get = &GetUart3Chars;
 UART3_Put = &PutUart3Chars;
}
#line 35 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
void USBInterrupt() iv IVT_USB ilevel 7 ics ICS_SRS
{
 USB_Interrupt_Proc();
}

void USBDMAInterrupt() iv IVT_USB_DMA ilevel 7 ics ICS_SRS
{
 USB_Dma_Interrupt_Proc();
}
#line 47 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
static void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_AUTO {
 T1IF_bit = 0;


}

static void TMR_System(){

}
#line 62 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
static void Timer2Interrupt() iv IVT_TIMER_2 ilevel 7 ics ICS_AUTO {
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
#line 97 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
static void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 6 ics ICS_AUTO {
 U2RXIF_bit = 0;



}

static void GetUart2Chars(){
 uart2_rd = UART2_Read();
 UART2_Write( uart2_rd );
}
#line 114 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
static void uart3_Rx_interrupt() iv IVT_UART3_RX ilevel 6 ics ICS_AUTO {
 U3RXIF_bit = 0;

 UART3_Get();

 UART3_Put();
}


static void GetUart3Chars(){
 while(U3STAbits.URXDA){
 ringBufferB[ringBuffB.ringHead] = U3RXREG;
 ringBuffB.ringHead++;
 if(ringBuffB.ringHead > 1023)
 ringBuffB.ringHead = 0;
 }
}

static void uart3_Tx_interrupt() iv IVT_UART3_TX ilevel 6 ics ICS_AUTO {
 U3TXIF_bit = 0;
#line 135 "C:/Users/Git/ColourSampling_Pic32mz/ISR.c"
 while(!U3STAbits.TRMT); }

static void PutUart3Chars(){
 while(ringBuffB.ringTail != ringBuffB.ringHead){
 if(ringBuffB.ringTail == ringBuffB.ringHead)
 break;
 U3TXREG = ringBufferB[ringBuffB.ringTail];
 ringBuffB.ringTail++;
 if(ringBuffB.ringTail > 1023)
 ringBuffB.ringTail = 0;

 }
}
