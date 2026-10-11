import java.util.Scanner;
public class NamaBBTB {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        // Meminta pengguna untuk memasukkan nama lengkap
        System.out.print("Masukkan nama lengkap Anda: ");
        String NA = scanner.nextLine();

        // Meminta pengguna untuk memasukkan berat badan
        System.out.print("Masukkan berat badan Anda: ");
        int BB = scanner.nextInt();
        
        // Meminta pengguna untuk memasukkan tinggi badan
        System.out.print("Masukkan tinggi badan Anda: ");
        int TB = scanner.nextInt();

        // Menampilkan kalimat dengan format yang diinginkan
        System.out.println("Hallo " + NA + ", berat badan Anda " + BB + " kg dan tinggi badan Anda " + TB + " cm.");

        // Menutup objek Scanner setelah selesai digunakan
        scanner.close();
    }
}
