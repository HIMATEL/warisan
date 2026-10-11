#include <stdio.h>

int Lain();

int main(){
    int returnValue = Lain();
    printf("Nilai yang dikembalikan adalah angka : %d\n", returnValue);
}

int Lain(){
    return 1;
}