import java.util.Scanner;

public class L04_05{
     private static double input(){
     Scanner sc = new Scanner(System.in);
     return sc.nextDouble();
    }
    
    public static double hitungLuas(double a, double t){
        double L = 0.5*a*t;
        return L;
    }
    
    public static void main(String[]args){
        System.out.print("masukkan panjang alas segitiga (meter): ");
        double alas = input();
        System.out.print("masukkan tinggi segitiga (meter): ");
        double tinggi = input();
        double luas = hitungLuas(alas,tinggi);
        System.out.print("Luas segitiga adalah: "+luas+" meter");
    }
}