import java.util.Scanner;

public class HitungLuasKubus {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Masukkan nilai Panjang sisi kubus: ");
        double sisi = scanner.nextDouble();
        double luasKubus = hitungLuasKubus(sisi);

        System.out.println("Luas kubus adalah: " + luasKubus + "cm");
        scanner.close();
    }
    
    public static double hitungLuasKubus(double sisi) {
        return sisi * sisi;
    }
}

