#line 1 "C:/Users/Git/ColourSampling_Pic32mz/Config.c"
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
#line 1 "c:/users/git/coloursampling_pic32mz/config.h"
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
#line 4 "C:/Users/Git/ColourSampling_Pic32mz/Config.c"
void PerphialSetUp(){

 ANSELB = 0X0000;
 TRISB10_bit = 0;
 TRISB9_bit = 0;
 set_performance_mode();


 HID_Enable(readbuff, writebuff);
 Unlock_IOLOCK();
 PPS_Mapping_NoLock(_RPB2, _OUTPUT, _U2TX);
 PPS_Mapping_NoLock(_RPB0, _INPUT, _U2RX);
 PPS_Mapping_NoLock(_RPD2, _OUTPUT, _U3TX);
 PPS_Mapping_NoLock(_RPD3, _INPUT, _U3RX);
 Lock_IOLOCK();

 ISR_Init();
 InitTimer1();
 InitTimer2();


 URXISEL0_bit = 1;
 URXISEL1_bit = 1;
 UTXISEL0_bit = 1;
 UTXISEL1_bit = 1;


 Uart2InterruptSetup();
 Uart3InterruptSetup();


}

void HID_Setp(){

 IEC4SET |= 3ul << 4;

 IPC33SET |= 7ul << 2;
 IPC33CLR |= 3;

 IPC33SET |= 7ul << 10;
 IPC33CLR |= 3ul << 8;

}


void InitTimer1(){
 T1CON = 0x8000;

 T1IP0_bit = 1;
 T1IP1_bit = 1;
 T1IP2_bit = 1;

 T1IS0_bit = 0;
 T1IS1_bit = 0;
 T1IF_bit = 0;
 T1IE_bit = 1;
 PR1 = 50000;
 TMR1 = 0;
}

void InitTimer2(){
 T2CON = 0x8000;

 T2IP0_bit = 1;
 T2IP1_bit = 1;
 T2IP2_bit = 1;

 T2IS0_bit = 1;
 T2IS1_bit = 0;
 T2IF_bit = 0;
 T2IE_bit = 1;
 PR2 = 50000;
 TMR2 = 0;
}


void Uart2InterruptSetup(){

 UART2_Init_Advanced(115200, 200000, _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);

 UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);

 Delay_ms(100);

 URXISEL0_bit = 0;
 URXISEL1_bit = 1;


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


 U3STAbits.UTXISEL = 0;
 U3STAbits.URXISEL = 0;

 LPBACK_bit = 1;


 U3RXIP0_bit = 0;
 U3RXIP1_bit = 1;
 U3RXIP2_bit = 1;

 U3RXIS0_bit = 0;
 U3RXIS1_bit = 1;
 URXISEL1_U3STA_bit = 0;

 IEC4.B30 = 1;
 U3RXIF_bit = 0;
}

void set_performance_mode()
{

 DI();
 SYSKEY = 0xAA996655;
 SYSKEY = 0x556699AA;




 PB1DIVbits.PBDIV = 0;


 UEN0_bit = 1;
 UEN1_bit = 1;
 PB2DIVbits.ON = 1;
 while (!PB2DIVbits.PBDIVRDY);
 PB2DIVbits.PBDIV = 1;


 PB3DIVbits.ON = 1;
 while (!PB3DIVbits.PBDIVRDY);
 PB3DIVbits.PBDIV = 3;


 PB4DIVbits.ON = 1;
 while (!PB4DIVbits.PBDIVRDY);
 PB4DIVbits.PBDIV = 0;


 PB5DIVbits.ON = 1;
 while (!PB5DIVbits.PBDIVRDY);
 PB5DIVbits.PBDIV = 1;


 PB7DIVbits.ON = 1;
 while (!PB7DIVbits.PBDIVRDY);
 PB7DIVbits.PBDIV = 0;


 PB8DIVbits.ON = 1;
 while (!PB8DIVbits.PBDIVRDY);
 PB8DIVbits.PBDIV = 1;


 PRECONbits.PFMSECEN = 0;
 PRECONbits.PREFEN = 0b11;
 PRECONbits.PFMWS = 0b010;
#line 190 "C:/Users/Git/ColourSampling_Pic32mz/Config.c"
 SYSKEY = 0x33333333;

}
