import java.util.Scanner;

public class L04_08a{
    public static double inputAngka(){
        Scanner sc = new Scanner(System.in);
        double n = sc.nextDouble();
        return n;
    }
    
    public static double pangkat(double n){
        double hasil = 1;
        for(int i=0;i<10;i++){
            hasil *= n;
        }
        return hasil;
        } 
    
    public static void main(String[]args){
        System.out.print("masukkan nilai n: ");
        double angka = inputAngka();
        double hasil = pangkat(angka);
        
        System.out.print(angka+"^10= "+hasil);
    }
        }
