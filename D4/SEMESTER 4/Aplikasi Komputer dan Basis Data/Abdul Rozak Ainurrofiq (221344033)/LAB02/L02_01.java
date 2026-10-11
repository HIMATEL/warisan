import java.util.Scanner;

public class L02_01{
    public static void main (String[]args){
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nama Depan:");
        String ND = scanner.nextLine();
        
        System.out.print("Nama Belakang:");
        String NB = scanner.nextLine();
        
        System.out.print("Hallo "+ND+ " " +NB +", bagaimana kabar anda hari ini?");
        
        scanner.close();
    }
}