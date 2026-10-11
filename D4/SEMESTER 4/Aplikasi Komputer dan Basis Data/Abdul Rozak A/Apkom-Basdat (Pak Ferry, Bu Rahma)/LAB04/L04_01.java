import java.util.Scanner;

public class L04_01{
    private static String input(){
     Scanner sc = new Scanner(System.in);
     return sc.nextLine();
    }
    
    public static int hitungChar(String input){
        int hitungChar = input.length();
        
        return hitungChar;
    }
    
    public static void main (String[]args){
        System.out.print("masukkan kalimat: ");
        String kalimat = input();
        int jumChar = hitungChar(kalimat);
        System.out.println("jumlah karakter ada: " + jumChar);
    }
}