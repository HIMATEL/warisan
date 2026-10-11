import java.util.Scanner;

public class L02_02{
     private static String input(){
     Scanner sc = new Scanner(System.in);
     return sc.nextLine();
    }
    
    public static int hitungKata(String input){
        int jmlKata = input.split("\\s").length;;
        return jmlKata;
    }
    
    public static void main(String[]args){
        System.out.print("Masukkan kalimat: ");
        String kalimat = input();
        int jmlKata = hitungKata(kalimat);
        System.out.print("Jumlah kata pada kalimat tersebut ada " +jmlKata+ " buah");
    }
}