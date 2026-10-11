import java.util.Scanner;

public class HitungJumlahKata {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Masukkan kalimat: ");
        String kalimat = scanner.nextLine();

        int jumlahKata = hitungJumlahKata(kalimat);
        System.out.println("Jumlah kata dalam kalimat: " + jumlahKata);
        scanner.close();
    }

    private static int hitungJumlahKata(String kalimat) {
        if (kalimat == null || kalimat.isEmpty()) {
            return 0;
        }
        
        String[] kata = kalimat.split("\\s+");
        return kata.length;
    }
}
