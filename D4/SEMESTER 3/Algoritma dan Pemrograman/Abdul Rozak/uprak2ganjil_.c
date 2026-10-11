#include <stdio.h>
int main(){
    int i=1;
    while(i<6){
        int j=1;
        while (j<=i){
            int k=i;
            while(k>0){
                printf("%d",k);
                k=k-1;
                j=j+1;
            }
        }
        printf("\n");
        i=i+1;
    }
}
