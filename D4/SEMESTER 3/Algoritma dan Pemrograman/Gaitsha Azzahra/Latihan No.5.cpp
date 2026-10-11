#include <iostream>
#include <string>
using namespace std; // looping defined (for loop)

int main () {
    int n;
    cout << "Masukkan Angka : ";
    cin >> n;
    for (int b = 1; b <= n; b++) {
        cout << b <<  endl;
    }
    return 0;
}