#include "Config.h"


const char newline[] = {'\r','\n','\0'};
Timers *T0;

uint16_t tmr;
uint16_t tmr_;
static uint16_t pg_cnt;

char cnt,cntA;
char kk;
char readbuff[64];
char writebuff[64];

char uart2_rd;
char uart3_rd;
char txtA[20];
char *txtPtr;


/***************************************************************************
*main
**************************************************************************/
void main() {
long long pgtime = 0;
long long Lastmillis = 0;
int test,i;
char str[200];
char spltstr[20][64];
static uint8_t cntr;
   PerphialSetUp();
   EI();
   pg_cnt = 0;
   while(1){
     // Call this routine periodically
     USB_Polling_Proc();
     //Get Timer values to transition states
     T0 = GetTimer_Values();

     switch(pg_cnt){
       case 0:  //main thread
            pgtime =  T0->millis - T0->last_millis ;
            
            if(pgtime > 150){
              T0->last_millis = T0->millis;
              test = GetDiffence_In_Pointers(1);
              if(test != 0){
                 pg_cnt = 3;
                 break;
              }
              kk = HID_Read();
              if(kk != 0){
                pg_cnt = 2;
                break;
              }
                
              pg_cnt = 1;
              LATB10_bit = 1;
            }
            break;
        case 1:  //Secondary thread for LCD etc
            pgtime = T0->millis - T0->last_millis ;
            
            
            if(pgtime > 50){
              T0->last_millis = T0->millis;
              pg_cnt = 0;
              LATB10_bit = 0;
            }
            break;
       case 2:   //usb recieve thread 2mms max
            pgtime = T0->millis - T0->last_millis;
            //Get the data from the USB buffer
            if (kk != 0)
            {

              // ArrClear(spltstr,20);
               strcpy(str,readbuff);
               //strcpy(writebuff,str);
              // HID_Write(writebuff, 64);
               SplitStr(spltstr,str,',');
               strcpy(writebuff,spltstr[0]);
               strcat(writebuff,"\r\n");
               strcat(writebuff,spltstr[1]);
               strcat(writebuff,"\r\n");
               strcat(writebuff,spltstr[2]);
               strcat(writebuff,"\r\n");
               strcat(writebuff,spltstr[3]);
               strcat(writebuff,"\r\n");
               HID_Write(writebuff, 64);

               pg_cnt = 0;
               break;
            }
            if(pgtime > 0){//overrun protect 1ms
               T0->last_millis = T0->millis;
               pg_cnt = 0;
            }
            break;
       case 3:  //Serial data
            pgtime = T0->millis - T0->last_millis ;
            if(test != 0){
              ReadBack_RingBufferB();
              pg_cnt = 0;
              break;
            }
            if(pgtime > 0){//overrun protect 1ms
               T0->last_millis = T0->millis;
               pg_cnt = 0;
            }
            break;
        default:
           pg_cnt = 0;
           T0->last_millis = T0->millis;
           break;
     }

   }
}



void OutPuts(long long output){
    sprintf(txtA,"%d",output);
    txtPtr = strncat(txtA,newline,strlen(newline));
    memcpy(writebuff,txtPtr,strlen(txtPtr));
    HID_Write(writebuff, 64);
}



 //UART2_Write_Text("Start");
 // UART2_Write(13);