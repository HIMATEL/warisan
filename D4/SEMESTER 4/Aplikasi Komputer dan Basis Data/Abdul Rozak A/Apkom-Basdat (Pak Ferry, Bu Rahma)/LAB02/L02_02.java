import java.util.Scanner;

public class L02_02{
    public static void main(String[]args){
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Nama Negara:");
        String NN = scanner.nextLine();
        
        System.out.print("Nama Ibu Kota:");
        String IK = scanner.nextLine();
        
        System.out.print(IK+" adalah ibu kota dari negara "+NN);
        
        scanner.close();
    }
}