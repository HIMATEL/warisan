#include <iostream>
#include <string>
using namespace std; // 4. string manipulation

int main() {
	string kata;
	cout << "masukkan kata :";
	cin >> kata;
kata[0] = toupper (kata [0]);
cout << "kata dengan huruf kapital :" << kata << endl;
return 0;
}

	