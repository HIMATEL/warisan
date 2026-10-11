import java.util.Scanner;
public class HitungNPangkatRekursif {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("Masukkan nilai n (0-9): ");
        int n = in.nextInt();
        if ((n >= 0) && (n <= 9)) {
            int hasil = pangkat(n,10);
            System.out.println("Nilai Pangkat dari " + n + " adalah: " + hasil);
        } else {
            System.out.println("Input tidak valid, n harus dalam rentang 0-9.");
        }
        in.close();
    }
    
    public static int pangkat(int n, int power) {
        if (power == 0) {
            return 1;
        } else {
            return n * pangkat(n, power - 1);
        }
    }
}

