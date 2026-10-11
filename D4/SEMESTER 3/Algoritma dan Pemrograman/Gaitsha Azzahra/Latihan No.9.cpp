#include <iostream>
using namespace std; // 9. looping dengan array

int main() {
    int angka[5];
    cout << "Masukkan lima angka: ";
    for (int i = 0; i < 5; i++) {
        cin >> angka[i];
    }
    int sum = 0;
    for (int i = 0; i < 5; i++) {
        sum += angka[i];
    }
    cout << "Jumlah: " << sum << endl;
    return 0;
}