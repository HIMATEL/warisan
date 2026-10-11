import java.util.Scanner;

public class L04_07a{
    public static int inputAngka(){
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        return n;
    }
    
    public static int faktorial(int n){
        int hasil = 0;
        if(n==0||n==1)
            hasil = 1; 
        else if(n>1){
            hasil = 1;
            for (int i=1;i<=n;i++){
                hasil *= i;
            }
        }
        else 
            System.out.print("nilai yang anda masukan salah");
        return hasil;
        } 
    
    public static void main(String[]args){
        System.out.print("masukkan nilai n: ");
        int angka = inputAngka();
        int hasil = faktorial(angka);
        
        System.out.print(angka+"!= "+hasil);
    }
        }