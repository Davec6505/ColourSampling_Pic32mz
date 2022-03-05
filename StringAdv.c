#include "StringAdv.h"



/*******************************************************
* Clear 2D Array
*******************************************************/
void ArrClear(char arr[][64],int row){
 int i,j;
   for(i=0;i<row;i++){
      for(j=0;j<sizeof((*arr));j++){
          arr[i][j] = 0;
      }
   }
}

/*******************************************************
*Split String into multi array
*******************************************************/
void SplitStr(char arr[][64],char* str,char a){
int i,j,k;  i=j=k=0;

   for(i=0;i<strlen(str);i++){
     arr[j][k] = str[i];
     if(str[i] == a){
         arr[j][k] = 0;
         j++;
         k=0;
         continue;
     }
     k++;
     if(str[i] == 0 || str[i] > 127 || str[i] < 32)
        break;
   }
   arr[j][k] = 0;
#ifdef StrDebug
   PrintOut(PrintHandler,"\r\n"
                         " * arr[0]   %s\r\n"
                         " * arr[1]   %s\r\n"
                         " * arr[2]   %s\r\n"
                         " * arr[3]   %s\r\n"
                         " * arr[4]   %s\r\n"
                         " * arr[5]   %s\r\n"
                         , arr[0],arr[1],arr[2],arr[3],arr[4],arr[5]);
#endif
}


/*********************************************************
*redundant code
*********************************************************/