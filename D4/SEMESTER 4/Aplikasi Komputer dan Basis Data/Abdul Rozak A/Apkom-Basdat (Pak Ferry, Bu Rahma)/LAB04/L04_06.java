import java.util.Scanner;

public class L04_06{
     private static double input(){
     Scanner sc = new Scanner(System.in);
     return sc.nextDouble();
    }
    
    public static double hitungLuas(double p, double l){
        double L = p*l;
        return L;
    }
    
     public static void main(String[]args){
        System.out.print("masukkan panjang (meter): ");
        double alas = input();
        System.out.print("masukkan lebar (meter): ");
        double tinggi = input();
        double luas = hitungLuas(alas,tinggi);
        System.out.print("Luas persegi panjang adalah: "+luas+" meter");
    }
}