import java.util.Scanner;

public class NilaiTerbesarScanner4Data{
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
        
        // Input data keempat
        System.out.print("Masukkan nilai keempat: ");
        int nilai4 = scanner.nextInt();

        // Panggil fungsi untuk mencari nilai terkecil
        int NK = NK(nilai1, nilai2, nilai3, nilai4);

        // Tampilkan hasil
        System.out.println("Nilai terkecil: " + NK);

        // Tutup scanner
        scanner.close();
        
    }
    // Fungsi untuk mencari nilai terkecil dari tiga angka menggunakan prinsip if
    public static int NK(int a, int b, int c, int d) {
        int NK = a;
        
        if (b < NK) {
            NK = b;
        }

        if (c < NK) {
            NK = c;
        }
        
        if (d < NK) {
            NK = d;
        }

        return NK;
    }
}
