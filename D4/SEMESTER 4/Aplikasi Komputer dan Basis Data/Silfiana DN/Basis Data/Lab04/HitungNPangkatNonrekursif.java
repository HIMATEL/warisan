import java.util.Scanner;

public class HitungNPangkatNonrekursif {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("Masukan nilai n (0-9): ");
        int n = in.nextInt();
        if ((n >= 0) && (n <= 9)) {
            int hasil = Pangkat (n);
            System.out.println("Nilai Pangkat dari " + n + " adalah: " + hasil);
        } else {
            System.out.println("SALAH!!!!!!!!!.");
        }
        in.close();
    }
    
    public static int Pangkat (int n) {
        int hasil = 1;
        for (int i = 1; i <= 10; i++) {
            hasil *= n;
        }
        return hasil;
    }
}
