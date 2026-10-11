import java.util.Scanner;

public class HitungLuasSegitiga {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Masukkan nilai alas segitiga: ");
        double alas = scanner.nextDouble();
        System.out.print("Masukkan nilai tinggi segitiga: ");
        double tinggi = scanner.nextDouble();
        double luasSegitiga = hitungLuasSegitiga(alas, tinggi);
        
        System.out.println("Luas segitiga: " + luasSegitiga);
        scanner.close();
    }

    // Fungsi untuk menghitung luas segitiga siku-siku
    public static double hitungLuasSegitiga(double alas, double tinggi) {
        return 0.5 * alas * tinggi;
    }
}
