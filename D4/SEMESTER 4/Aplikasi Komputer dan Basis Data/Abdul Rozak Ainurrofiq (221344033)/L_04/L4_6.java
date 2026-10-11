import java.util.Scanner;

public class L4_6{
    public static void main(String[] args){
      double panjang = getInput("Masukkan panjang: ");
      double lebar = getInput("Masukkan lebar: ");
      
      double luas = luas(panjang, lebar);    
      System.out.print("luas persegi panjang = " + luas);
    }
    
    public static double getInput(String message){
        Scanner inputData = new Scanner(System.in);
        
        System.out.print(message);
        double input = inputData.nextDouble();
        inputData.close();
        return input;
    }
    public static double luas(double panjang, double lebar){
        return panjang * lebar;
    }
}