import java.util.Scanner;

public class NegaraIbukota {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Meminta pengguna untuk memasukkan nama Negara
        System.out.print("Masukkan nama Negara: ");
        String NN = scanner.nextLine();

        // Meminta pengguna untuk memasukkan nama ibu kotanya
        System.out.print("Masukkan nama Ibu Kotanya: ");
        String IK = scanner.nextLine();

        // Menampilkan kalimat dengan format yang diinginkan
        System.out.println(IK + " " + "adalah ibu kota dari negara" + " " + NN);

        // Menutup objek Scanner setelah selesai digunakan
        scanner.close();
    }
}
