#include <stdio.h>

void FungsiER(double *r, double *t);

void fungsiCetak(double r, double t);

int main() {
    double radius, tinggi;
    FungsiER(&radius, &tinggi);
    fungsiCetak(radius, tinggi);
    return 0;
}

void FungsiER(double *r, double *t) {
    printf("Masukkan nilai r: ");
    scanf("%lf", r);
    printf("Masukkan nilai t: ");
    scanf("%lf", t);
} 

void fungsiCetak(double r, double t){
    double luas_selimut = 2 * 3.14 * r * t;
    printf ("Luas selimut tabung adalah: %.2lf\n", luas_selimut);
}