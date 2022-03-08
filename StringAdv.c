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
void SplitStr(char arr[][64],char* str,int chars,...){//char a){
 va_list args;
int i,j,k,l;
char c[10];

   va_start(args,chars);
   for(i=0;i<chars;i++)
       c[i] = va_arg(args,char);
       
   for(i=0,j=0,k=0;i<strlen(str);i++){
     arr[j][k] = str[i];
     for(l = 0; l < chars; l++){
       if(str[i] == c[l]){
           arr[j][k] = 0;
           j++;
           k=0;
           break;
       }
     }
     if(l < chars)
        continue;
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