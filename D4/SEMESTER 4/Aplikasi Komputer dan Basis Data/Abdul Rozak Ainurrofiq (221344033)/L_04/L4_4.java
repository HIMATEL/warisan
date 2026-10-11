import java.util.Scanner;

public class L4_4 {
    public static void main(String[] args) {
        Scanner inputData = new Scanner(System.in);

        System.out.print("Masukkan alas : ");
        int A = inputData.nextInt();
        
        System.out.print("Masukkan tinggi : ");
        int T = inputData.nextInt();
        
        String balik = balikk(input);
        System.out.println("Setelah dibalik: " + balik);

        inputData.close();
    }

    public static String balikk(String str) {
        String balik = "";
        for (int i = 0; i < str.length(); i++) {
            balik = str.charAt(i)+balik;
        }
        return balik;
    }
}
