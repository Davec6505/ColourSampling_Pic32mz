#include "Config.h"


const char newline[] = {'\r','\n','\0'};
Timers *T0;
RTCC_Values rtc_vals;
RTCC_Values rtc_set_vals;

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
static bit time_once;

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
            
            //usb
            kk = HID_Read();
            if(kk != 0){
                pg_cnt = USB;
                break;
            }
            
            //serial
            test = GetDiffence_In_Pointers(1);
            if(test != 0){
                pg_cnt = UART;
                break;
            }
            
            //jump to secondary thread
            if(pgtime > 150){
              T0->last_millis = T0->millis;
              LATB9_bit = 1;//!LATB9_bit;
              pg_cnt = 1;
            }
            break;
        case SECONDARY:  //Secondary thread for LCD etc
            pgtime = T0->millis - T0->last_millis ;
            
            //check the time
            TimeOutputs();
            
            //go back to main thread
            if(pgtime > 50){
              T0->last_millis = T0->millis;
              LATB9_bit = 0;//!LATB9_bit;
              pg_cnt = MAIN;
            }
            break;
       case USB:   //usb recieve thread 2mms max
            pgtime = T0->millis - T0->last_millis;
            //Get the data from the USB buffer
            if (kk != 0)
            {
               ArrClear(spltstr,6);
               strncpy(str,readbuff,64);
               SplitStr(spltstr,str,2,',','#');
               OutPuts(spltstr,str+0,0);
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

void TimeOutputs(){
static bit time_once;
static int cnt_to_print = 0;
char txt_[6];
  LATB10_bit =  RTCCONbits.HALFSEC;
  if(!time_once && RTCCONbits.HALFSEC){
     time_once = 1;
     ReadTime(&rtc_vals);
     
#ifdef timeDebug
     cnt_to_print++;
     if(cnt_to_print > 29){
         cnt_to_print = 0;
         sprintf(txt_,"%x",rtc_vals.secs);
         UART3_Write_Text(txt_);
  /*   PrintOut(PrintHandler,
             " * rtc %x-%x-%x %x %x:%x:%x\r\n"
             ,rtc_vals.yr,rtc_vals.mth,rtc_vals.day
             ,rtc_vals.wk,rtc_vals.hrs,rtc_vals.mins
             ,rtc_vals.secs); */
    }
#endif
  }else if(time_once && !RTCCONbits.HALFSEC)
    time_once = 0;

}

 //UART2_Write_Text("Start");
 // UART2_Write(13);