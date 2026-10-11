import java.util.Scanner;

public class L4_8a {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Masukkan nilai n: ");
        int n = input.nextInt();

        int hasil = pangkat10(n);
        System.out.println("Hasil " + n + "^10 = " + hasil);
    }

    public static int pangkat10(int n) {
        if (n == 0) {
            return 1;
        } else {
            int hasil = 1;
            for(int i=0;i<10;i++){
                hasil = hasil*n;
            }
            return hasil;
        }
    }
}
