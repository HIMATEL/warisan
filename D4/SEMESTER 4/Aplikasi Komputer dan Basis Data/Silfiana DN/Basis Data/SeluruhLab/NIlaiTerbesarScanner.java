import java.util.Scanner;

public class NIlaiTerbesarScanner {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Input data pertama
        System.out.print("Masukkan nilai pertama: ");
        int nilai1 = scanner.nextInt();

        // Input data kedua
        System.out.print("Masukkan nilai kedua: ");
        int nilai2 = scanner.nextInt();

        // Panggil fungsi untuk mencari nilai terkecil
        int nilaiTerbesar = nilaiTerbesar (nilai1, nilai2);

        // Tampilkan hasil
        System.out.println("Nilai terbesar: " + nilaiTerbesar);

        // Tutup scanner
        scanner.close();
    }

    // Fungsi untuk mencari nilai terkecil
    public static int nilaiTerbesar(int a, int b) {
        int nilaiTerbesar = a;

        if (b > nilaiTerbesar) {
            nilaiTerbesar = b;
        }

        return nilaiTerbesar;
    }
}
