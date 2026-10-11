#include <iostream>
using namespace std; // 11. pengantar fungsi

int perkalian(int num1, int num2) {
    return num1 * num2;
}

int main() {
    int num1, num2;
    cout << "Masukkan dua angka: ";
    cin >> num1 >> num2;
    int hasil = perkalian(num1, num2);
    cout << "Hasil perkalian: " << hasil << endl;
    return 0;
}