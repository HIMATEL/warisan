#include <iostream>
using namespace std; // 17. pointer dengan fungsi
void tambah_satu(int *a) {
    (*a)++;
}

int main() {
    int angka;
    cout << "Masukkan angka: ";
    cin >> angka;

    tambah_satu(&angka);
    cout << "Hasil setelah ditambah satu: " << angka << endl;

    return 0;
}