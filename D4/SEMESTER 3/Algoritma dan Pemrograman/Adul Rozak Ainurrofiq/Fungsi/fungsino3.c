#include <stdio.h>

void CETAK(int x, int c);

int main(){
    CETAK(5, 7);
}

void CETAK(int x, int c)
{
    int persamaan = x*x+2*x+c;
    printf ("%d\n", persamaan);
}