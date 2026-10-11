import java.util.Scanner;

public class L03_03{
    public static void main(String[]args){
        Scanner input = new Scanner(System.in);
        String  negara[] = new String[5];
        int nomor = 0;
        
        for (int i=0;i<negara.length;i++){
            nomor = nomor + 1;
            System.out.print("Masukkan Nama Negara Ke-" +nomor+ " : ");
            negara[i] = input.nextLine();
        }
        
        System.out.println("Berikut Adalah Nama Negara Yang Di Inputkan : ");
        
        for (int i=0;i<negara.length;i++){
            System.out.println(negara[i]+ " ");
        }
        input.close();
    }
}