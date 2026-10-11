import java.util.Scanner;

public class L04_08b{
    public static double inputAngka(){
        Scanner sc = new Scanner(System.in);
        double n = sc.nextDouble();
        return n;
    }
    
     public static double pangkat10(double x,int y){
        if (y!=0)
        return (x * pangkat10 (x, y-1));
        else
        return 1;
    }
    
    public static void main (String[]args){
        System.out.print("masukkan angka: ");
        double n = inputAngka();
        double hasil = pangkat10(n,10);
        System.out.print(n+"^10 = "+hasil);
    }
}