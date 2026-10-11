import java.util.Scanner;

public class NilaiTerbesarScanner3Data{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Input data pertama
        System.out.print("Masukkan nilai pertama: ");
        int nilai1 = scanner.nextInt();

        // Input data kedua
        System.out.print("Masukkan nilai kedua: ");
        int nilai2 = scanner.nextInt();
        
        // Input data ketiga
        System.out.print("Masukkan nilai ketiga: ");
        int nilai3 = scanner.nextInt();

        // Panggil fungsi untuk mencari nilai terbesar
        int NT = NT(nilai1, nilai2, nilai3);

        // Tampilkan hasil
        System.out.println("Nilai terbesar: " + NT);

        // Tutup scanner
        scanner.close();
        
    }
    // Fungsi untuk mencari nilai terbesar dari tiga angka menggunakan prinsip if
    public static int NT(int a, int b, int c) {
        int NT = a;

        if (b > NT) {
            NT = b;
        }

        if (c > NT) {
            NT = c;
        }

        return NT;
    }
}
