import java.util.Scanner;

public class L03_08{
    public static void inputMatrix(int [] k){
        Scanner input = new Scanner(System.in);
        int counter = 0;
        
        for (int i=0;i<k.length;i++){
            counter = counter + 1;
            System.out.print("Masukkan Data Ke-" +counter+ ": ");
            k[i] = input.nextInt();
        }
        input.close();
    }
    
    public static void selecSort(int[] l){
        int i,j,temp;
        for (i=0;i<l.length -1;i++){
            for (j=i+1;j<l.length;j++){
                if (l[i]>l[j]){
                    temp = l[i];
                    l[i] = l[j];
                    l[j] = temp;
                }
            }
        }
    }
    
    public static void cetakMatrix(int [] m){
        for (int i=0;i<m.length;i++){
            System.out.print(m[i] + " ");
        }
        System.out.println();
    }
    
    public static void main(String[]args){
        int[] data = new int[8];
        
        inputMatrix(data);
        
        System.out.println ("Berikut Adalah Data Sebelum Di Sortir");
        cetakMatrix(data);
        
        selecSort(data);
        
        System.out.println ("Berikut Adalah Data Setelah Di Sortir (Terkecil ke-Terbesar)");
        cetakMatrix(data);
    }
}