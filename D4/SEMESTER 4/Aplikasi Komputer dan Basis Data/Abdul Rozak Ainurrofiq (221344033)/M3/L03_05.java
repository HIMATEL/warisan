import java.util.Scanner;

public class L03_05{
    public static void main (String[]args){
        Scanner input = new Scanner (System.in);
        int data1[][] = new int [3][4];
        int nomor = 0;
        
        for(int i=0;i<3;i++){
            for (int j=0;j<4;j++){
                nomor = nomor + 1;
                System.out.print("Masukkan Data Ke-" +nomor+ ": ");
                data1[i][j] = input.nextInt();
            }
        }
        
        System.out.println("Berikut Hasil Data Yang Telah Di Inputkan : ");
        
        for(int i=0;i<3;i++){
            for (int j=0;j<4;j++){
                System.out.print(String.format("%5d",data1[i][j])+" ");
            }
            System.out.println();
        }
        input.close();
    }
}
