#include <iostream>
using namespace std; // 10. loops with control statements (break dan continue)

int main() {
    for (int i = 1; i <= 10; i++) {
        if (i % 3 == 0) {
            continue;
        }
        cout << i << endl;
    }
    return 0;
}