import java.util.Scanner;

public class L4_3{
    public static void main (String[] args){
        Scanner inputString = new Scanner(System.in);
        
        System.out.print("Masukkan kalimat : ");
        String input = inputString.nextLine();
        int countWords = hitungA(input, 'a');
        System.out.println("jumlah karakter (a) ada: " + countWords);
        
        inputString.close();
    }
    
    public static int hitungA(String str,char karakter){
        int count = 0;
        for (int i=0;i<str.length();i++){
            if (str.charAt(i) == karakter){
                count++;
            }
        }
        return count;
    }
}
