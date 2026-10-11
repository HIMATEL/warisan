import java.util.Scanner;

public class HitungNFaktorialNonrekursif {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("Masukan nilai n (0-9): ");
        int n = in.nextInt();
        if ((n >= 0) && (n <= 9)) {
            int hasil = Factorial(n);
            System.out.println("factorial dari " + n + " adalah: " + hasil);
        } else {
            System.out.println("SALAH!!!!!!!!!.");
        }
        in.close();
    }

    public static int Factorial(int n) {
        int hasil = 1;
        for (int i = 2; i <= n; i++) {
            hasil *= i;
        }
        return hasil;
    }
}
