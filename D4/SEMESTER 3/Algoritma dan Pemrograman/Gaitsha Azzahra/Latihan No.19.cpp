#include <iostream>
using namespace std; //19.pengantar rekursi

int fibonacci(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main() {
    int n;
    cout << "Masukkan n: ";
    cin >> n;
    cout << "Bilangan Fibonacci ke-" << n << ": " << fibonacci(n) << endl;
    return 0;
}
