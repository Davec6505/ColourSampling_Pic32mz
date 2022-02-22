#include "Config.h"


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
  T1IF_bit         = 0;
  //Enter your code here
  tmr++;
  if(tmr>99)
  {
    tmr = 0;
    LATB10_bit = !LATB10_bit;
  }

}

void Timer2Interrupt() iv IVT_TIMER_2 ilevel 5 ics ICS_AUTO {
  T2IF_bit         = 0;
  //Enter your code here
   tmr_++;
   if(tmr_ > 449){
     tmr_ = 0;
     LATB9_bit = !LATB9_bit;
   }
     // USB_Polling_Proc();
}

void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 7 ics ICS_AUTO {

     uart_rd = UART2_Read();
     UART2_Write( uart_rd );
     //IFS4.B18 = 0;
     U2RXIF_bit = 0;            // Ensure interrupt is not pending
}

/*void USBInterrupt() iv IVT_USB ilevel 5 ics ICS_AUTO {
    USB_Interrupt_Proc();
}

void USBDMAInterrupt() iv IVT_USB_DMA ilevel 5 ics ICS_SRS
{
    //USB_Dma_Interrupt_Proc();
}*/

          //UART2_Write_Text("Start");
       // UART2_Write(13);
