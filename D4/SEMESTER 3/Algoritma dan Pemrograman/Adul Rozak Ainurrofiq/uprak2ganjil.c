#include <stdio.h>

int main(){
    int i,j;
    int k;

    for (i = 1 ; i <= 5; i++){
        k=i;
         for (j = 1 ; j <= i ; j++){
            printf("%d",k);
              k=k-1; 
         }
         printf("\n");
    }
    return 0;
}