import java.util.Scanner;

public class L03_04{
    public static void main(String[]args){
        Scanner input = new Scanner(System.in);
        int bilangan[] = new int [8];
        int counter = 0;
        
        for (int i=0;i<bilangan.length;i++){
            counter = counter + 1;
            System.out.print("Masukkan Bilangan ke-" +counter+ " : ");
            bilangan[i] = input.nextInt();
        }
        
        System.out.println("Berikut Hasil Dari Data Yang Telah Di Inputkan");
        
        for (int i=0;i<bilangan.length;i++){
            System.out.print(String.format("%3d",bilangan[i])+ " ");
        }
        input.close();
    }
}