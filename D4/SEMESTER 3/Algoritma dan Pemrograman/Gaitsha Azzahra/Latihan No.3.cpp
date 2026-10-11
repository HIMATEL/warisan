#include <iostream>
using namespace std; // 3. conditional if/else
int main() {
 int nilai;
 cout << "Masukkan nilai : ";
 cin >> nilai;
 if (nilai % 2 == 0) {
 cout << "Angka Genap" << endl;
 } else {
 cout << "Angka Ganjil" << endl;
 }
 return 0;
}