#include <iostream>
using namespace std; // 18.pointer ke struct

struct Karyawan {
    string nama;
    int gaji;
};

int main() {
    Karyawan karyawan;
    Karyawan *p = &karyawan;

    cout << "Masukkan nama: ";
    cin >> p->nama;
    cout << "Masukkan gaji: ";
    cin >> p->gaji;

    cout << "Nama: " << p->nama << endl;
    cout << "Gaji: " << p->gaji << endl;

    return 0;
}