#include <iostream>
using namespace std; // 12. fungsi dengan logika

bool cek_prima(int angka) {
    if (angka <= 1) {
        return false;
    }
    for (int i = 2; i * i <= angka; i++) {
        if (angka % i == 0) {
            return false;
        }
    }
    return true;
}

int main() {
    int angka;
    cout << "Masukkan angka: ";
    cin >> angka;
    bool hasil = cek_prima(angka);
    if (hasil) {
        cout << "Bilangan prima" << endl;
    } else {
        cout << "Bukan bilangan prima" << endl;
    }
    return 0;
}