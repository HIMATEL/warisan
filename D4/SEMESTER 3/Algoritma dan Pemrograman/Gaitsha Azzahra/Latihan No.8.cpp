#include <iostream>
using namespace std; //8. array

int main() {
    int angka[5];
    cout << "Masukkan lima angka: ";
    for (int i = 0; i < 5; i++) {
        cin >> angka[i];
    }
    int max = angka[0];
    for (int i = 1; i < 5; i++) {
        if (angka[i] > max) {
            max = angka[i];
        }
    }
    cout << "Angka terbesar: " << max << endl;
    return 0;
}