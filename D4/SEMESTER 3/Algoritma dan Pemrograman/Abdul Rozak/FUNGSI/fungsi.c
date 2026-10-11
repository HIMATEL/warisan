#include <stdio.h>

int inputData();
void jumlahkan(int m, int n);

int main(){
    int x, y;
    x = inputData();
    y = inputData();
    jumlahkan (x,y);
}

int inputData(){
    int z;
    printf("Masukkan nilai data: ");
    scanf("%d", &z);
    return z;
}

void jumlahkan(int m, int n){
    int p;
    p = m + n;
    printf ("nilai p adalah : %d", p);
}