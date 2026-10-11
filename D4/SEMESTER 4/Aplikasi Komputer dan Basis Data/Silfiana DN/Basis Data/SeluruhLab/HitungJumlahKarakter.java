import java.util.Scanner;
public class HitungJumlahKarakter{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Minta pengguna memasukkan kalimat
        System.out.print("Masukkan kalimat: ");
        String kalimat = scanner.nextLine();

        // Hitung jumlah karakter
        int jumlahKarakter = hitungJumlahKarakter(kalimat);

        // Tampilkan hasil
        System.out.println("Jumlah karakter dalam kalimat adalah: " + jumlahKarakter);

        scanner.close();
    }
    
    public static int hitungJumlahKarakter(String kalimat)
    {
        return kalimat.length();
    }
}
