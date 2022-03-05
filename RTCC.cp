#line 1 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
#line 1 "c:/users/git/coloursampling_pic32mz/rtcc.h"










extern unsigned long time;
extern unsigned long date;








void IniyRTCC();
void InitRTCC_Tnterrupt();
void RTCC_Calibrate();
void SetRTCCInitial();
void SetRTCC();
#line 5 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
unsigned long time=0x04153300;
unsigned long date=0x06102705;
#line 12 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
void IniyRTCC(char osc_mod){
 DI();
 SYSKEY = 0x00000000;
 SYSKEY = 0xAA996655;
 SYSKEY = 0x556699AA;

 RTCCONSET = 0x8;




 SYSKEY = 0x33333333;
}
#line 32 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
void InitRTCC_Tnterrupt(){

 IEC1CLR=0x00008000;
 RTCCONCLR=0x8000;
 while(RTCCON&0x40);
 IFS1CLR=0x00008000;
 IPC8CLR=0x1f000000;
 IPC8SET=0x0d000000;
 IEC1SET=0x00008000;
 RTCTIME=0x16153300;
 RTCDATE=0x06102705;
 RTCALRMCLR=0xCFFF;
 ALRMTIME=0x16154300;
 ALRMDATE=0x06102705;
 RTCALRMSET=0x8000|0x00000600;
 RTCCONSET=0x8000;
 while(!(RTCCON&0x40));
}
#line 54 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
void RTCC_Calibrate(){

int cal=0x3FD;
unsigned int t0, t1;
 if(RTCCON&0x8000){

 do{
 t0=RTCTIME;
 t1=RTCTIME;
 }while(t0!=t1);
 if((t0&0xFF)==00){
 while(!(RTCCON&0x2));
 }
 }
 RTCCONCLR=0x03FF0000;
 RTCCONSET=cal;
}
#line 78 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
void SetRTCCInitial(){

 RTCCONCLR=0x8000;
 while(RTCCON&0x40);
 RTCTIME=time;
 RTCDATE=date;
 RTCCONSET=0x8000;
 while(!(RTCCON&0x40));

}




void SetRTCC(){
 DI();
 while((RTCCON&0x4)!=0);
 RTCTIME=time;
 RTCDATE=date;
 EI();

}
#line 107 "C:/Users/Git/ColourSampling_Pic32mz/RTCC.c"
void RTCC_Interrupt() iv IVT_RTCC ilevel 7 ics ICS_SRS {


 IFS1CLR=0x00008000;

}
