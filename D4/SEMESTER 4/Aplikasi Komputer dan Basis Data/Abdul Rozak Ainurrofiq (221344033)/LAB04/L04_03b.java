import java.util.Scanner;

public class L04_03b{
    private static String inputKalimat(){
     Scanner sc = new Scanner(System.in);
     return sc.nextLine();
    }
    
    private static char inputKarakter(){
        Scanner sc = new Scanner(System.in);
        char karakter = sc.next().charAt(0);
        return karakter;
    }
    
    private static int counterKarakter(String kalimat, char karakter){
        int counter = 0;
        for (int i = 0;i<kalimat.length();i++){
        if(kalimat.charAt(i) == karakter){
            counter++;
        }
    }return counter;
    }
    
    public static void main(String[]args){
        System.out.print("masukkan kalimat: ");
        String kalimat = inputKalimat();
        
        System.out.print("masukkan karakter yang ingin dicari jumlahnya: ");
        char karakter = inputKarakter();
        
        int jmlKarakter = counterKarakter(kalimat,karakter);
        System.out.print("Jumlah karakter '"+karakter+ "' dalam kalimat tersebut adalah sebanyak " +jmlKarakter+ " buah");
    }
}