#include <stdio.h>
#include <conio.h>

int main(void)
{ 
    int kemana, masuk;
    float ce;
    printf("kamu mau ngeconvert dari mana\n");
    printf("1. celcius\n2. fahrenheit\n3.reamur\n4. kelvin\npilih:\n");
    scanf("%i", &masuk);
    if (masuk == 1 ){
        printf("convert kemana?\n1. fahrenheit\n2. reamur\n3. kelvin\npilih:\n");
        scanf("%i", &kemana);
        if (kemana==3){
            printf("masukan besar suhu dalam celcius:\n");
            scanf("%f", &ce);
            printf ("hasil: %.2f derajat kelvin",ce+273.00);
        }
        else if (kemana==2){
            printf("masukan besar suhu dalam celcius:\n");
            scanf("%f", &ce);
            printf("hasil: %.2f derajat reamur", ce*0.80);
        }
        else if (kemana==1){
            printf("masukkan besar suhu dalam celcius:\n");
            scanf("%f",&ce);
            printf ("hasil: %.2f derajat fahrenheit", ce*1.80+32.00);
        }
        else {
            printf ("pilih 1 atau 2 atau 3 aja goblok");
        }
    }
    else if (masuk == 2){
        printf("convert kemana?\n1. celcius\n2. reamur\n3. kelvin\npilih:\n");
    scanf("%i", &kemana);
        if (kemana==1){
            printf("masukan besar suhu dalam fahrenheit\n");
            scanf("%f", &ce);
            printf("hasil: %.2f derajat celcius",ce*1.80-32.00);
        }
        else if (kemana==2){
            printf("masukkan besar suhu dalam fahrenheit\n");
            scanf("%f", &ce);
            printf("hasil: %.2f derajat reamur",ce*0.8);
        }
        else if (kemana==3){
            printf("masukkan besar suhu dalam fahrenheit\n");
            scanf("%f", &ce);
            printf("hasil: %.2f derajat kelvin",(ce+459)/1.8);
        }
        else {
            printf("minimal yang bener sih milihnya");
        }
    }
    else if (masuk == 3){
        printf("convert kemana?\n1. celcius\n2. fahrenheit\n3. kelvin\npilih:\n");
        scanf("%f", &kemana);
        printf("masukkan besar suhu dalam reamur\n");
        scanf("%f", &ce);
        if (kemana == 1){
            printf("hasil: %.2f derajat celcius", ce*5/4);
        }
        else if (kemana == 2){
            printf("hasil: %.2f derajat fahrenheit", (ce-32)*9/5);
        }
        else if (kemana == 3){
            printf("hasil: %.2f derajat kelvin", (ce*5/4)+273);
        }
    }
}
   