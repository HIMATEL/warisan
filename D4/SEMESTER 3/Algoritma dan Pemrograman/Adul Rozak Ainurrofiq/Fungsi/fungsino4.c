#include <stdio.h>

int RESULT(int x, int c);

int main(){
    int persamaan = RESULT(5, 7);
    printf("Hasil persamaan = %d", persamaan);
    return 0;
}

int RESULT(int x, int c)
{
    int y = x*x+2*x+c;
    return y;
}