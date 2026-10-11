import java.util.Scanner;

public class MembalikkanKalimat {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Masukkan kalimat: ");
        String kalimat = scanner.nextLine();

        String kalimatterbalik = balikkalimat(kalimat);
        System.out.println("Kalimat terbalik: " + kalimatterbalik);

        scanner.close();
    }
    
    public static String balikkalimat(String kalimat) {
        StringBuilder kalimatterbalik = new StringBuilder();
        for (int i = kalimat.length() - 1; i >= 0; i--) {
            kalimatterbalik.append(kalimat.charAt(i));
        }
        return kalimatterbalik.toString();
    }
}
