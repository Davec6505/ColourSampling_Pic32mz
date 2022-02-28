#include "ISRConfig.h"



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

/*******************************************************************
*USB Interrupt polling     not yet working
*******************************************************************/
void USBInterrupt() iv IVT_USB ilevel 7 ics ICS_SRS
{
    USB_Interrupt_Proc();
}

void USBDMAInterrupt() iv IVT_USB_DMA ilevel 7 ics ICS_SRS
{
    USB_Dma_Interrupt_Proc();
}
/*******************************************************************
*Timer
*******************************************************************/
static void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_AUTO {
  T1IF_bit         = 0;
  //Enter your code here

}

static void TMR_System(){

}



/*******************************************************************
*system timming
*******************************************************************/
static void Timer2Interrupt() iv IVT_TIMER_2 ilevel 7 ics ICS_AUTO {
  T2IF_bit         = 0;
  //Enter your code here
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

/************************************************************************
* UART2  GSM module communication
************************************************************************/
static void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 6 ics ICS_AUTO {
     U2RXIF_bit = 0;            // Ensure interrupt is not pending

     //IFS4.B18 = 0;

}

static void GetUart2Chars(){
     uart2_rd = UART2_Read();
     UART2_Write( uart2_rd );
}


/***********************************************************************
* UART3 User interactive communication
***********************************************************************/

static void uart3_Rx_interrupt() iv IVT_UART3_RX ilevel 6 ics ICS_AUTO {
     U3RXIF_bit = 0;
     //IFS4.B18 = 0;
     UART3_Get();
     //uncomment this when code is functional
     UART3_Put();  //use to write to user
}


static void GetUart3Chars(){
     while(U3STAbits.URXDA){
       ringBufferB[ringBuffB.ringHead] =  U3RXREG;
       ringBuffB.ringHead++;
       if(ringBuffB.ringHead > 1023)
           ringBuffB.ringHead = 0;
     }
}

static void uart3_Tx_interrupt() iv IVT_UART3_TX ilevel 6 ics ICS_AUTO {
     U3TXIF_bit = 0;
     while(!U3STAbits.TRMT);                                          \
}

static void PutUart3Chars(){
     while(ringBuffB.ringTail != ringBuffB.ringHead){
       if(ringBuffB.ringTail == ringBuffB.ringHead)
           break;
       U3TXREG = ringBufferB[ringBuffB.ringTail];         //  UART3_Write( uart3_rd );
       ringBuffB.ringTail++;
       if(ringBuffB.ringTail > 1023)
            ringBuffB.ringTail = 0;

     }
}
