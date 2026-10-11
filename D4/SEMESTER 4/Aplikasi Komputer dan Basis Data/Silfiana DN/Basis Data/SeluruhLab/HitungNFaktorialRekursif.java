import java.util.Scanner;
public class HitungNFaktorialRekursif {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("Masukkan nilai n (0-9): ");
        int n = in.nextInt();
        if ((n >= 0) && (n <= 9)) {
            int hasil = factorial(n);
            System.out.println("Faktorial dari " + n + " adalah: " + hasil);
        } else {
            System.out.println("Input tidak valid, n harus dalam rentang 0-9.");
        }
        in.close();
    }
    
    public static int factorial(int n) {
        if (n < 2) {
            return 1;
        } else {
            return n * factorial(n - 1);
        }
    }
}

