#include <iostream>
using namespace std; // 16.pointer dengan array

int main() {
    int angka[5];
    int *p = angka;

    cout << "Masukkan lima angka: ";
    for (int i = 0; i < 5; i++) {
        cin >> angka[i];
    }

    for (int i = 0; i < 5; i++) {
        cout << *(p + i) << endl;
    }

    return 0;
}
