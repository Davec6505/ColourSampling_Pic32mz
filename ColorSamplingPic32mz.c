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
       case MAIN:  //main thread
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
        case SECONDARY:  //Secondary thread for LCD etc
            pgtime = T0->millis - T0->last_millis ;
            
            
            if(pgtime > 50){
              T0->last_millis = T0->millis;
              pg_cnt = 0;
              LATB10_bit = 0;
            }
            break;
       case USB:   //usb recieve thread 2mms max
            pgtime = T0->millis - T0->last_millis;
            //Get the data from the USB buffer
            if (kk != 0)
            {
                strcpy(str,readbuff);
                SplitStr(spltstr,str,',');
                OutPuts(spltstr,str,0);
               pg_cnt = 0;
               break;
            }
            if(pgtime > 0){//overrun protect 1ms
               T0->last_millis = T0->millis;
               pg_cnt = 0;
            }
            break;
       case UART:  //Serial data
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



void OutPuts(char arr[][64],char *str,char type){
int rows = sizeof(arr);
int i;
   memset(writebuff,0,64);
   switch(type){
     case 0:

           strncpy(writebuff,arr[0],strlen(arr[0]));
           strcat(writebuff,"\r\n");
           for(i = 1; i < rows+1;i++){
             strcat(writebuff,arr[i]);
             strcat(writebuff,"\r\n");
           }
           break;
     case 1:
           strncpy(writebuff,str,strlen(str));
          break;
     default:
          break;
   }
   HID_Write(writebuff, 64);
}



 //UART2_Write_Text("Start");
 // UART2_Write(13);