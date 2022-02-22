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
#line 12 "c:/users/git/coloursampling_pic32mz/config.h"
 void PerphialSetUp();
 void InitTimer1();
 void InitTimer2();
 void Uart2InterruptSetup();
 void set_USB_Interrupt();
 void set_performance_mode();
#line 4 "C:/Users/Git/ColourSampling_Pic32mz/Config.c"
void PerphialSetUp(){

 ANSELB = 0X0000;
 TRISB10_bit = 0;
 TRISB9_bit = 0;
 set_performance_mode();
 Unlock_IOLOCK();
 PPS_Mapping_NoLock(_RPB2, _OUTPUT, _U2TX);
 PPS_Mapping_NoLock(_RPB0, _INPUT, _U2RX);
 Lock_IOLOCK();

 InitTimer1();
 InitTimer2();

}

void InitTimer1(){
 T1CON = 0x8000;
 T1IP0_bit = 1;
 T1IP1_bit = 1;
 T1IP2_bit = 1;
 T1IF_bit = 0;
 T1IE_bit = 1;
 PR1 = 50000;
 TMR1 = 0;
}

void InitTimer2(){
 T2CON = 0x8000;
 T2IP0_bit = 1;
 T2IP1_bit = 0;
 T2IP2_bit = 1;
 T2IF_bit = 0;
 T2IE_bit = 1;
 PR2 = 10000;
 TMR2 = 0;
}


void Uart2InterruptSetup(){


 UART2_Init(13000);
 UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);

 Delay_ms(100);

 URXISEL0_bit = 0;
 URXISEL1_bit = 1;
 IEC4.B18 = 1;

 U2RXIP0_bit = 1;
 U2RXIP1_bit = 1;
 U2RXIP2_bit = 1;

 URXISEL1_U2STA_bit = 0;
 U2RXIF_bit = 0;


}

void set_USB_Interrupt(){

 IEC4SET |= 3ul << 4;
 IFS4CLR |= 3ul << 4;

 IPC33SET |= 5ul << 2;
 IPC33CLR |= 3;

 IPC33SET |= 5ul << 10;
 IPC33CLR |= 3ul << 8;
}


void set_performance_mode()
{


 DI();
 SYSKEY = 0xAA996655;
 SYSKEY = 0x556699AA;



 PB1DIVbits.PBDIV = 1;


 UEN0_bit = 1;
 UEN1_bit = 1;
 PB2DIVbits.ON = 1;
 PB2DIVbits.PBDIV = 10;


 PB3DIVbits.ON = 1;
 PB3DIVbits.PBDIV = 1;


 PB4DIVbits.ON = 1;
 while (!PB4DIVbits.PBDIVRDY);
 PB4DIVbits.PBDIV = 0;


 PB5DIVbits.ON = 1;
 PB5DIVbits.PBDIV = 1;


 PB7DIVbits.ON = 1;
 PB7DIVbits.PBDIV = 0;


 PB8DIVbits.ON = 1;
 PB8DIVbits.PBDIV = 1;


 PRECONbits.PFMSECEN = 0;
 PRECONbits.PREFEN = 0b11;
 PRECONbits.PFMWS = 0b010;
#line 130 "C:/Users/Git/ColourSampling_Pic32mz/Config.c"
 SYSKEY = 0x33333333;

}
