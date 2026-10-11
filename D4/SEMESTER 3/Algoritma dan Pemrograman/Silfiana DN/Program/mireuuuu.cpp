#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

int main() {
    char choice;
    bool repeat = true;
    float suhuAC = 25;

	printf("---------------------------------------------------------\n");
    printf("D I S P L A Y - A C - M O B I L\n");
	printf("Suhu AC saat ini: %.2f°C\n", suhuAC);
	printf("---------------------------------------------------------\n");
	
	while (repeat) {
    int pilihanAwal;
    float suhu, hasil;
    printf("Pilih satuan suhu yang ingin dikonversi:\n");
    printf("1. Celsius ke Kelvin\n");
    printf("2. Celsius ke Fahrenheit\n");
    printf("3. Kelvin ke Celsius\n");
    printf("4. Kelvin ke Fahrenheit\n");
    printf("5. Fahrenheit ke Celsius\n");
    printf("6. Fahrenheit ke Kelvin\n");
    printf("Pilihan Anda: ");
    scanf("%d", &pilihanAwal);
    
    system("cls");
    
    if (pilihanAwal == 1) {
        hasil = suhuAC + 273.15;
        printf("Suhu dalam Kelvin: %.2f°K\n", hasil);
    } else if (pilihanAwal == 2) {
        hasil = (suhuAC * 9/5) + 32;
        printf("Suhu dalam Fahrenheit: %.2f°F\n", hasil);
    } else if (pilihanAwal == 3) {
        hasil = suhuAC - 273.15;
        printf("Suhu dalam Celsius: %.2f°C\n", hasil);
    } else if (pilihanAwal == 4) {
        hasil = (suhuAC - 273.15) * 9/5 + 32;
        printf("Suhu dalam Fahrenheit: %.2f°F\n", hasil);
    } else if (pilihanAwal == 5) {
        hasil = (suhuAC - 32) * 5/9;
        printf("Suhu dalam Celsius: %.2f°C\n", hasil);
    } else if (pilihanAwal == 6) {
        hasil = (suhuAC - 32) * 5/9 + 273.15;
        printf("Suhu dalam Kelvin: %.2f°K\n", hasil);
    } else {
        printf("Pilihan tidak valid.\n");
        return 1;
    }
    
	printf("---------------------------------------------------------\n");
	
        // Meminta pengguna untuk mengulang atau tidak
        printf("Apakah Anda ingin merubah suhu kedalam satuan lain (y/n)? ");
        scanf(" %c", &choice);

        if (choice != 'y' && choice != 'Y') {
            repeat = false;
        }  
    }
    
    system("cls");
    
    printf("---------------------------------------------------------\n");

    printf("Terima kasih! Sampai jumpa lagi.\n");

    return 0;
}

