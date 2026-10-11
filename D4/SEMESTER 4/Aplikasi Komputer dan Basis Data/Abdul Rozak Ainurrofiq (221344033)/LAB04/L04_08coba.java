import java.util.Scanner;

public class L04_08coba{
    public static int input(){
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        return n;
    }
    
    public static int pangkat(int n,int m){
        int hasil = 1;
        for(int i=0;i<m;i++){
            hasil *= n;
        }
        return hasil;
        } 
    
    public static void main(String[]args){
        System.out.print("masukkan angka (integer): ");
        int angka = input();
        
        System.out.print("masukkan pangkat (integer): ");
        int pangkat = input();
        
        int hasil = pangkat(angka,pangkat);
        
        System.out.print(angka+"^"+pangkat+"= "+hasil);
    }
        }
