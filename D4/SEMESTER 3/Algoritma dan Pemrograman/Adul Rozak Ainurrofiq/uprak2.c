#include <stdio.h>
int main(){
    int i=1;
    while(i<6){
        int j=1;
        while (j<=i){
            printf("*");
            j = j+1;
        }
        printf("\n");
        i=i+1;
    }
}
