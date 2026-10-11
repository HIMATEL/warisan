#include <stdio.h>

// Deklarasi fungsi RESULT
int RESULT(int X, int C);

int main() {
    // Deklarasi variabel X dan C
    int X, C;
    
    // Meminta input dari pengguna untuk nilai X dan C
    printf("Masukkan nilai X: ");
    scanf("%d", &X);
    printf("Masukkan nilai C: ");
    scanf("%d", &C);
    
    // Memanggil fungsi RESULT dengan nilai X dan C sebagai parameter
    int Y = RESULT(X, C);
    
    // Mencetak hasil persamaan
    printf("Hasil yang dikembalikan adalah: %d\n", X, C, Y);
    
    return 0;
}

// Implementasi fungsi RESULT
int RESULT(int X, int C) {
    // Menghitung hasil persamaan Y = X^2 + 2X + C
    int Y;
	Y = X*X + 2*X + C;
    printf("Hasil Y = %d \n", Y);
    // Mengembalikan nilai hasil persamaan
    return Y;
}
