#include <stdio.h>
int main(){
    int i,j,n,k=i-1,l=k+1;
    printf("masukkan nilai:");
    scanf("%d", &n);
    for(i=1;i<=n;i++){
        for(j=1;j<=5;j++){
            if(i-j==k)
            printf("%d",l);
            else
            printf("*");
        }
        printf("\n");
    }
}