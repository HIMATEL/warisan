import java.util.Scanner;

public class L04_03{
    private static String input(){
     Scanner sc = new Scanner(System.in);
     return sc.nextLine();
    }
    
    private static int counterKarakter(String kalimat){
        int counter = 0;
        for (int i = 0;i<kalimat.length();i++){
        if(kalimat.charAt(i) == 'a'){
            counter++;
        }
    }return counter;
    }
    
    public static void main(String[]args){
        System.out.print("masukkan kalimat: ");
        String kalimat = input();
        int jmlKarakter = counterKarakter(kalimat);
        System.out.print("Jumlah karakter 'a' dalam kalimat tersebut adalah sebanyak " +jmlKarakter+ " buah");
    }
}