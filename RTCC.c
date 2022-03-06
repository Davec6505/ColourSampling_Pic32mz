#include "RTCC.h"



unsigned long time=0x00000000;// set time to 04 hr, 15 min, 33 sec
unsigned long date=0x22030306;// set date to Friday 27 Oct 2006


/*************************************************************
/Initialize the RTCC module
*************************************************************/
void InitRTCC(char osc_mod){
    DI(); // Disable all interrupts


    SYSKEY = 0x00000000;
    SYSKEY = 0xAA996655;
    SYSKEY = 0x556699AA;
    if(osc_mod == 1){
        if(!SOSCRDY_bit)
           SOSCEN_bit = 1;
        RTCCONSET = 0x489;    //SOSC,RTSECSEL,WREN
    }
    else {
        if(SOSCRDY_bit)
           SOSCEN_bit = 0;
        RTCCONSET = 0x289;    //INTOSC,RTSECSEL,WREN
    }
    // Lock Sequence
    SYSKEY = 0x33333333;
}

/*************************************************************
* The following code example will update the RTCC time and date.
*assume the secondary oscillator is enabled and ready,
*i.e. OSCCON<1>=1, OSCCON<22>=1, and RTCC write is enabled
*i.e. RTCWREN (RTCCON<3>) =1;
***************************************************************/
void SetRTCCInitial(){
  do{
    RTCCONbits.ON = 0;//RTCCONCLR=0x8000; // turn off the RTCC
    Delay_ms(100);
    LATB10_bit = 1;
  }while(RTCCON&0x40); // wait for clock to be turned off 1=ON
  RTCTIME=time; // safe to update the time
  RTCDATE=date; // update the date

}

// can disable the RTCC write
/* The following code example will update the RTCC time and date. */
/*assume RTCC write is enabled i.e. RTCWREN (RTCCON<3>) =1; */
void SetRTCC(){
  DI(); // disable interrupts, critical section follows
  while((RTCCON&0x4)!=0); // wait for not RTCSYNC
  RTCTIME=time; // safe to update the time
  RTCDATE=date; // update the date
  EI(); // restore interrupts, critical section ended
// can disable the RTCC write
}


void RTCC_ON(){
  do{
    RTCCONbits.ON = 1;//RTCCONSET=0x8000; // turn on the RTCC
    Delay_ms(100);
    LATB10_bit = 0;
  }while((RTCCON&0x40)); // wait for clock to be turned on
}

/*************************************************************
*The following code example illustrates an RTCC initialization
*with interrupts enabled. When the RTCC alarm interrupt is
*generated, the cpu will jump to the vector assigned to
*RTCC interrupt.
*************************************************************/
void InitRTCC_Tnterrupt(){
// assume RTCC write is enabled i.e. RTCWREN (RTCCON<3>) =1;*/
  IEC1CLR=0x00008000; // disable RTCC interrupts
  RTCCONCLR=0x8000; // turn off the RTCC
  while(RTCCON&0x40); // wait for clock to be turned off
  IFS1CLR=0x00008000; // clear RTCC existing event
  IPC8CLR=0x1f000000; // clear the priority
  IPC8SET=0x0d000000; // Set IPL=3, subpriority 1
  IEC1SET=0x00008000; // Enable RTCC interrupts
  RTCTIME=0x16153300; // safe to update time to 16 hr, 15 min, 33 sec
  RTCDATE=0x06102705; // update the date to Friday 27 Oct 2006
  RTCALRMCLR=0xCFFF; // clear ALRMEN, CHIME, AMASK and ARPT;
  ALRMTIME=0x16154300; // set alarm time to 16 hr, 15 min, 43 sec
  ALRMDATE=0x06102705; // set alarm date to Friday 27 Oct 2006
  RTCALRMSET=0x8000|0x00000600; // re-enable the alarm, set alarm mask at once per day
  RTCCONSET=0x8000; // turn on the RTCC
  while(!(RTCCON&0x40)); // wait for clock to be turned on
}

/*************************************************************
* Calibration code for RTCC
*************************************************************/
void RTCC_Calibrate(){
 /* The following code example will update the RTCC calibration. */
int cal=0x3FD; // 10 bits adjustment, -3 in value
unsigned int t0, t1;
  if(RTCCON&0x8000){ // RTCC is ON

    do{
      t0=RTCTIME;
      t1=RTCTIME;
    }while(t0!=t1); // read valid time value
    if((t0&0xFF)==00){ // we're at second 00, wait auto-adjust to be performed
        while(!(RTCCON&0x2)); // wait until second half...
    }
  }
  RTCCONCLR=0x03FF0000; // clear the calibration
  RTCCONSET=cal;
}


/*
The following code example demonstrates a simple interrupt service routine for RTCC
interrupts. The user’s code at this vector should perform any application specific
operations and must clear the RTCC interrupt flag before exiting.
*/
void RTCC_Interrupt() iv IVT_RTCC ilevel 7 ics ICS_SRS {
// ... perform application specific operations
// in response to the interrupt
  IFS1CLR=0x00008000; // be sure to clear RTCC interrupt flag
// before exiting the service routine.
}

void ReadTime(){
char hr10,hr01,min10,min01,sec10,sec01;
char txt[15];
unsigned long rtc;
int secs = 0;
int mins = 0;
  if((RTCCON&0x4)!=0)
      return;
  else{ // wait for not RTCSYNC
    rtc = RTCTIME; // safe to update the time
    //date = RTCDATE; // update the date
    LongToStr(rtc,txt);
#ifdef RTCCDebug
   PrintOut(PrintHandler,"\r\n"
                         " * rtc  %s\r\n"
                         ,txt);
#endif
   }
   
   
}