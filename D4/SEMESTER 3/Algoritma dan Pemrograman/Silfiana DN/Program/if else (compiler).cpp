#include <stdio.h>

int main() {
    int nilai;

    // Meminta pengguna memasukkan nilai
    printf("Masukkan nilai: ");
    scanf("%d", &nilai);

    // Melakukan klasifikasi berdasarkan nilai
    if (nilai >= 90) {
        printf("Klasifikasi: TOP\n");
    } else if (nilai >= 70) {
        printf("Klasifikasi: GOOD\n");
    } else if (nilai >= 60) {
        printf("Klasifikasi: ENOUGH\n");
    } else if (nilai >= 50) {
        printf("Klasifikasi: NOT ENOUGH\n");
    } else {
        printf("Klasifikasi: LESS\n");
    }

    return 0;
}

