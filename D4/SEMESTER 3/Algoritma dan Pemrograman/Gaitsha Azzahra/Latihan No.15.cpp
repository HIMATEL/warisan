#include <iostream>
using namespace std; // 15. class dengan konstruktor

class Segitiga {
public:
    float alas;
    float tinggi;

    Segitiga(float a, float t) {
        alas = a;
        tinggi = t;
    }

    float hitung_luas() {
        return 0.5 * alas * tinggi;
    }
};

int main() {
    float alas, tinggi;
    cout << "Masukkan alas: ";
    cin >> alas;
    cout << "Masukkan tinggi: ";
    cin >> tinggi;
    Segitiga segitiga(alas, tinggi);
    cout << "Luas segitiga: " << segitiga.hitung_luas() << endl;
    return 0;
}