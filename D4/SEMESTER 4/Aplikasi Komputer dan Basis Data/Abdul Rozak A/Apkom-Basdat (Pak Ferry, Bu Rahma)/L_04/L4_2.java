import java.util.Scanner;

public class L4_2{
    public static void main (String[] args){
        Scanner inputString = new Scanner(System.in);
        
        System.out.print("Masukkan kalimat : ");
        String input = inputString.nextLine();
        
        int countWords = hitungKata(input);
        
        System.out.println("jumlah kata ada: " + countWords);
        
        inputString.close();
    }
    
    public static int hitungKata(String input){
        int jmlKata = input.split("\\s").length;;
        
        return jmlKata;
    }
}
