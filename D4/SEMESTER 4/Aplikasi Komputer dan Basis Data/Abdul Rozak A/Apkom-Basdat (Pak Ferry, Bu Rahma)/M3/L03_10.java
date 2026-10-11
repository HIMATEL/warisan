import java.util.Scanner;

public class L03_10{
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
    
    public static void bubbleSort(int[] l){
        int i,j,temp;
        for (i=0;i<l.length -1;i++){
            int stat = 0;
            for (j=0;j<l.length-1;j++){
                if (l[j]>l[j+1]){
                    temp = l[j];
                    l[j] = l[j+1];
                    l[j+1] = temp;
                    stat = stat + 1;
                }
            }
            if(stat==0) break;
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
        
        bubbleSort(data);
        
        System.out.println ("Berikut Adalah Data Setelah Di Sortir (Terkecil ke-Terbesar)");
        cetakMatrix(data);
    }
}
