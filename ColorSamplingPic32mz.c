#include "Config.h"


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

/***************************************************************************
*main
**************************************************************************/
void main() {
long long pgtime = 0;
long long Lastmillis = 0;
   PerphialSetUp();
   EI();
   pg_cnt = 0;
   while(1){
      USB_Polling_Proc();               // Call this routine periodically
     //Timers to transition states
     T0 = GetTimer_Values();

     //Pol as often a possible


     
     switch(pg_cnt){
       case 0:   //10ms time critical
            pgtime = T0->millis - T0->last_millis;
            kk = HID_Read();
            if (kk != 0)
            {
               for(cnt = 0; cnt < 64; cnt++)
                    writebuff[cnt] = readbuff[cnt];
               HID_Write(writebuff, 64);
            }
            if(pgtime > 10){
              // OutPuts(pgtime);
               pg_cnt = 1;
               T0->last_millis = T0->millis;
               LATB10_bit = 1;
            }
            break;
       case 1:  //100ms
            pgtime = T0->millis - T0->last_millis ;
            if(pgtime > 100){
              // OutPuts(pgtime);
               pg_cnt = 2;
               T0->last_millis = T0->millis;
                LATB10_bit = 0;
            }
            break;
       case 2:  //250ms
            pgtime =  T0->millis - T0->last_millis ;
            if(pgtime > 250){
             //  OutPuts(pgtime);
               pg_cnt = 3;
               T0->last_millis = T0->millis;
               LATB10_bit = 1;
            }
            break;
       case 3:  //50ms
            pgtime =   T0->millis - T0->last_millis ;
            if(pgtime > 50){
             //  OutPuts(pgtime);
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



 //UART2_Write_Text("Start");
 // UART2_Write(13);