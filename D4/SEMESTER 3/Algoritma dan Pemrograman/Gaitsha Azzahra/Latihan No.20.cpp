#include <iostream>
using namespace std; // 20.penggunaan rekursi lanjutan

int cari_minimum(int angka[], int n) {
    if (n == 1) {
        return angka[0];
    }
    return min(angka[n - 1], cari_minimum(angka, n - 1));
}

int main() {
    int angka[5];
    cout << "Masukkan lima angka: ";
    for (int i = 0; i < 5; i++) {
        cin >> angka[i];
    }
    cout << "Angka terkecil: " << cari_minimum(angka, 5) << endl;
    return 0;
}
