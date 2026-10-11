import java.util.Scanner;

public class L04_04{
     private static String input(){
     Scanner sc = new Scanner(System.in);
     return sc.nextLine();
    }
    
    public static String pembalik(String str) {
        String balik = "";
        for (int i = 0; i < str.length(); i++) {
            balik = str.charAt(i)+balik;
        }
        return balik;
    }
    
    public static void main(String[]args){
        System.out.print("masukkan kalimat: ");
        String kalimat = input();
        String dibalik = pembalik(kalimat);
        System.out.println("kalimat setelah dibalik:");
        System.out.print(dibalik);
    }
}