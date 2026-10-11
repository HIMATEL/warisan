import java.util.Scanner;

public class L02_03{
    public static void main(String[]args){
        Scanner data = new Scanner(System.in);
        
        System.out.print("Nama:");
        String NA = data.nextLine();
        
        System.out.print("Berat badan (dalam kg):");
        double BB = data.nextDouble();
        
        System.out.print("Tinggi badan (dalam cm):");
        double TB = data.nextDouble();
        
        System.out.print("Hallo "+NA+ ", berat badan anda "+BB+ " kg, ");
        System.out.print("dan tinggi badan anda "+TB+ " cm");
        
        data.close();
    }
}