import java.util.Scanner;

public class NamaDepanNamaBelakang {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Meminta pengguna untuk memasukkan nama depan
        System.out.print("Masukkan nama depan Anda: ");
        String ND = scanner.nextLine();

        // Meminta pengguna untuk memasukkan nama belakang
        System.out.print("Masukkan nama belakang Anda: ");
        String NB = scanner.nextLine();

        // Menampilkan kalimat dengan format yang diinginkan
        System.out.println("Hallo " + ND + " " + NB + ", bagaimana kabar Anda hari ini?");

        // Menutup objek Scanner setelah selesai digunakan
        scanner.close();
    }
}
