import java.util.Scanner;

public class L4_1{
    public static void main (String[] args){
        Scanner inputString = new Scanner(System.in);
        
        System.out.print("Masukkan kalimat : ");
        String input = inputString.nextLine();
        
        int jumChar = hitungChar(input);
        
        System.out.println("jumlah karakter ada: " + jumChar);
        
        inputString.close();
    }
    
    public static int hitungChar(String input){
        int hitungChar = input.length();
        
        return hitungChar;
    }
}