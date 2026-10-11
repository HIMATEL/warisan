import java.util.Scanner;
public class NilaiTerbesarScanner3DataBedaFlowchart {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Masukkan nilai pertama: ");
        int nilai1 = scanner.nextInt();
        System.out.print("Masukkan nilai kedua: ");
        int nilai2 = scanner.nextInt();
        System.out.print("Masukkan nilai ketiga: ");
        int nilai3 = scanner.nextInt();

        int NT = NT(nilai1, nilai2, nilai3);
        System.out.println("Nilai terbesar: " + NT);
        scanner.close();}
    public static int NT(int a, int b, int c) {
         if (a >= b && a >= c) {
            return a;
        } else if (b >= a && b >= c) {
            return b;
        } else {
            return c;
        }
    }
}
