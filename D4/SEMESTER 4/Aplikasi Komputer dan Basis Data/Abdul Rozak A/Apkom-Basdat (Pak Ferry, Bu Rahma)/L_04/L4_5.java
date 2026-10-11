import java.util.Scanner;

public class L4_5{
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        
        System.out.print("Masukkan panjang alas: ");
        double alas = input.nextDouble();
        
        System.out.print("Masukkan panjang tinggi: ");
        double tinggi = input.nextDouble();
        
        double hasil = proses(alas,tinggi);
        
        System.out.println("Hasil luas segitiga = "+ hasil  );
        
        input.close();
    }
    
    public static double proses(double alas,double tinggi){
       double proses = alas*tinggi*0.5;
       
       return proses;
    }
}