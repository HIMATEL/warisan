import java.util.Scanner;

public class L03{
    public static void main(String[]args){
        Scanner input = new Scanner(System.in);
        int bilangan[] = new int [8];
        int counter = 0;
        
        for (int i=0;i<bilangan.length;i++){
            counter = counter + 1;
            System.out.print("Masukkan Bilangan ke-" +counter+ " : ");
            bilangan[i] = input.nextInt();
        }
        
         for (int i=0;i<bilangan.length -1;i++){
            for (int j=i+1;j<bilangan.length;j++){
                if (bilangan[i]>bilangan[j]){
                    int temp = bilangan[i];
                    bilangan[i] = bilangan[j];
                    bilangan[j] = temp;
                }
            }
        }
        
        System.out.println("Berikut Hasil Dari Urutan Ascending Data Yang Telah Di Inputkan");
        
        for (int i=0;i<bilangan.length;i++){
            System.out.print(String.format("%3d",bilangan[i])+ " ");
        }
        input.close();
    }
}