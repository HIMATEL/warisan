import java.util.Scanner;

public class HitungHurufa {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Masukkan kalimat: ");
        String kalimat = scanner.nextLine();

        int jumlahKata = hitung_a(kalimat, 'a'); 
        System.out.println("Jumlah huruf 'a' dalam kalimat: " + jumlahKata);
        scanner.close();
    }

    public static int hitung_a(String str, char karakter) {
        int count = 0;
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == karakter) {
                count++;
            }
        }
        return count;
    }
}
