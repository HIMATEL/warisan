#include <iostream>
using namespace std; // (boolean logic)

int main() {
    int a, b;
    cout << "Masukkan dua angka: " << endl;
    cin >> a >> b;

if (a > 0 && b > 0) {
   cout << " Keduanya positif" << endl;
} else {
    cout << "Salah Satu atau keduanya negatif" << endl;
    }
    return 0;
}