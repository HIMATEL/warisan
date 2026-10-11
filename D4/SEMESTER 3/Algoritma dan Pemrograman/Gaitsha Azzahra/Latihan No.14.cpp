#include <iostream>
using namespace std; // 14. pengantar class

class Lingkaran {
public:
    float jari_jari;

    Lingkaran(float j) {
        jari_jari = j;
    }

    float hitung_luas() {
        return 3.14 * jari_jari * jari_jari;
    }
};

int main() {
    float jari_jari;
    cout << "Masukkan jari-jari: ";
    cin >> jari_jari;
    Lingkaran lingkaran(jari_jari);
    float luas = lingkaran.hitung_luas();
    cout << "Luas lingkaran: " << luas << endl;
    return 0;
}