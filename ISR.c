#include "Config.h"
#include "ISRConfig.h"

static Timers T0;



void (*TMR_Sys)();
void (*TMR_Tmr)();

void ISR_Init(){
  TMR_Sys = &TMR_System;
  TMR_Tmr = &TMR_Timer;
}

/*******************************************************************
*USB Interrupt polling     not yet working
*******************************************************************/
 void USBPoll() iv IVT_USB ilevel 5 ics ICS_SRS {
    USB_Interrupt_Proc();
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
static void Timer2Interrupt() iv IVT_TIMER_2 ilevel 5 ics ICS_AUTO {
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


void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 7 ics ICS_AUTO {

     uart_rd = UART2_Read();
     UART2_Write( uart_rd );
     //IFS4.B18 = 0;
     U2RXIF_bit = 0;            // Ensure interrupt is not pending
}