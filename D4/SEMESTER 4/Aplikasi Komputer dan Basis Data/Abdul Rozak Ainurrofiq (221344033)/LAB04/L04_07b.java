import java.util.Scanner;

public class L04_07b{
    public static int inputAngka(){
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        return n;
    }
    
    public static int faktorial(int n){
        int hasil = 0;
        if(n==0||n==1)
            hasil = 1; 
        else if(n<0)
            System.out.print("nilai yang anda masukkan salah");
        else
        hasil = n*faktorial(n-1);
        return hasil;
        } 
    
    public static void main(String[]args){
        System.out.print("masukkan nilai n: ");
        int angka = inputAngka();
        int hasil = faktorial(angka);
        
        System.out.print(angka+"!= "+hasil);
    }
        }
