#include <stdio.h>

int main(void)
{
    float nilai;
    printf ("masukan nilai\n");
    scanf ("%f",&nilai);
    if (nilai >= 90 && nilai <= 100)
    {
    printf ("anda termasuk kategori A");
    }
    else if (nilai >= 70 && nilai < 90)
    {
        printf ("anda termasuk kategori B");
    }
    else if (nilai >= 60 && nilai < 70)
    {
        printf ("anda termasuk kategori C");
    }
    else if (nilai >=50 && nilai < 60){
        printf ("anda termasuk kategori D");
    }
    else if (nilai < 50 && nilai >=0) {
        printf ("anda termasuk kategori E");
    }
    else {
        printf ("nilai yang anda masukan salah");
    }
} 