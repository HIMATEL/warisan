import java.util.Scanner;

public class L05_02{
    public static void inputNamakota(String [] m){
        Scanner input = new Scanner(System.in);
        int counter = 0;
        for (int i=0;i<m.length;i++){
            counter = counter +1;
            System.out.print("Masukkan Nama Kota Ke-" +counter+ " : ");
            m[i] = input.nextLine();
        }
        input.close();
        System.out.println();
    }
    
     public static void bubbleSort(String [] n){
        for (int i=0;i<n.length;i++){
            for (int j=0;j<n.length-1;j++){
                if (n[j].compareTo(n[j+1])>0){
                    String temp = n[j];
                    n[j] = n[j+1];
                    n[j+1] = temp;
                }
            }
        }
    }
    
    public static void cetakNamakota(String [] o){
        for (int i=0;i<o.length;i++){
            System.out.println(o[i] + "  ");
        }
        System.out.println();
        System.out.println();
    }
    
    public static void main(String[]args){
        String banyakNama[] = new String [6];
        
        inputNamakota(banyakNama);
        
        System.out.println("Berikut Merupakan Nama Sebelum Di Sortir");
        cetakNamakota(banyakNama);
        
        bubbleSort(banyakNama);
        
        System.out.println("Berikut Merupakan Nama Setelah Di Sortir : ");
        cetakNamakota(banyakNama);
        
    }
}