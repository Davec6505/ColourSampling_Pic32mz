#line 1 "C:/Users/Git/ColourSampling_Pic32mz/UART.c"
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
#line 1 "c:/users/git/coloursampling_pic32mz/uart.h"
#line 1 "c:/users/git/coloursampling_pic32mz/stringadv.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdarg.h"


typedef void * va_list[1];
#line 1 "c:/users/git/coloursampling_pic32mz/uart.h"
#line 16 "c:/users/git/coloursampling_pic32mz/stringadv.h"
extern char *SplitBuff[64];









void ArrClear(char** arr,int row);
void SplitStr(char** arr,char* str,char a);
#line 1 "c:/users/git/coloursampling_pic32mz/rtcc.h"
#line 1 "c:/users/git/coloursampling_pic32mz/uart.h"
#line 13 "c:/users/git/coloursampling_pic32mz/rtcc.h"
extern unsigned long time;
extern unsigned long date;








void InitRTCC(char osc_mod);
void InitRTCC_Tnterrupt();
void RTCC_Calibrate();
void SetRTCCInitial();
void SetRTCC();
void RTCC_ON();
void ReadTime();
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
#line 3 "C:/Users/Git/ColourSampling_Pic32mz/UART.c"
void (*UART2_Get)();
void (*UART2_Put)();
void (*UART3_Get)();
void (*UART3_Put)();

static RingBuffer ringBuffA;
static RingBuffer ringBuffB;

char ringBufferA[1024];
char ringBufferB[1024];


void UART_Init(){
 UART2_Get = &GetUart2Chars;
 UART3_Get = &GetUart3Chars;
 UART3_Put = &PutUart3Chars;
}

void Uart2InterruptSetup(){

 UART2_Init_Advanced(115200, 200000, _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);

 UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);

 Delay_ms(100);



 U2RXIP0_bit = 0;
 U2RXIP1_bit = 1;
 U2RXIP2_bit = 1;

 U3RXIS0_bit = 1;
 U3RXIS1_bit = 1;

 URXISEL1_U2STA_bit = 0;
 IEC4.B18 = 0;
 U2RXIF_bit = 0;
}

void Uart3InterruptSetup(){

 UART3_Init_Advanced(115200, 200000, _UART_HIGH_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);

 UART_Set_Active(&UART3_Read, &UART3_Write, &UART3_Data_Ready, &UART3_Tx_Idle);

 Delay_ms(100);

 LPBACK_bit = 0;


 U3RXIP0_bit = 0;
 U3RXIP1_bit = 1;
 U3RXIP2_bit = 1;

 U3RXIS0_bit = 0;
 U3RXIS1_bit = 1;


 U3STAbits.UTXISEL = 0x00;
 U3STAbits.URXISEL = 0x00;

 Enable_Uart3_Interrupts(2);
 URXISEL1_U3STA_bit = 0;
 IEC4.B30 = 1;
 U3RXIF_bit = 0;
}
#line 74 "C:/Users/Git/ColourSampling_Pic32mz/UART.c"
void USBInterrupt() iv IVT_USB ilevel 7 ics ICS_SRS
{
 USB_Interrupt_Proc();
}

void USBDMAInterrupt() iv IVT_USB_DMA ilevel 7 ics ICS_SRS
{
 USB_Dma_Interrupt_Proc();
}
#line 87 "C:/Users/Git/ColourSampling_Pic32mz/UART.c"
static void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 6 ics ICS_AUTO {
 U2RXIF_bit = 0;



}

static void GetUart2Chars(){
 uart2_rd = UART2_Read();
 UART2_Write( uart2_rd );
}
#line 104 "C:/Users/Git/ColourSampling_Pic32mz/UART.c"
void Enable_Uart3_Interrupts(char rx_tx){
 U3TXIE_bit = rx_tx & 0x01;
 U3RXIE_bit = (rx_tx >> 1) & 0x01;
}

static void uart3_Rx_interrupt() iv IVT_UART3_RX ilevel 6 ics ICS_AUTO {
 U3RXIF_bit = 0;

 UART3_Get();


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
 while(!U3STAbits.TRMT);
}

static void PutUart3Chars(){

 while(ringBuffB.ringTail != ringBuffB.ringHead){
 while(!U3STAbits.TRMT);
 U3TXREG = ringBufferB[ringBuffB.ringTail];
 if(ringBuffB.ringTail == ringBuffB.ringHead)
 break;
 ringBuffB.ringTail++;
 if(ringBuffB.ringTail > 1023)
 ringBuffB.ringTail = 0;

 }

}

void ReadBack_RingBufferB(){
 UART3_Put();
}
#line 153 "C:/Users/Git/ColourSampling_Pic32mz/UART.c"
int GetDiffence_In_Pointers(char buffer){
static int diff = 0;
 switch(buffer){
 case 0:
 diff = ringBuffA.ringHead - ringBuffA.ringTail;
 break;
 case 1:
 diff = ringBuffB.ringHead - ringBuffB.ringTail;
 break;
 default:
 diff = 0;
 break;
 }
 return diff;
}
#line 173 "C:/Users/Git/ColourSampling_Pic32mz/UART.c"
void PrintHandler(char c){
#line 176 "C:/Users/Git/ColourSampling_Pic32mz/UART.c"
 UART3_Write(c);
}
