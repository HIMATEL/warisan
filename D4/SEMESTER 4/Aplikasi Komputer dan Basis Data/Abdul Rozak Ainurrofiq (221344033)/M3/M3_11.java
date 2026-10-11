import java.util.Scanner;

public class M3_11{
    public static void inputNamakota(String [] m){
        Scanner input = new Scanner(System.in);
        int counter = 0;
        
        for (int i=0;i<m.length;i++){
            counter = counter +1;
            System.out.print("Masukkan Nama Ke-" +counter+ " : ");
            m[i] = input.nextLine();
        }
        input.close();
        System.out.println();
    }
    
    public static void selectSort(String [] n){
        for (int i=0;i<n.length-1;i++){
            for (int j=i+1;j<n.length;j++){
                if (n[i].compareTo(n[j])>0){
                    String temp = n[i];
                    n[i] = n[j];
                    n[j] = temp;
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
        String banyakNama[] = new String [8];
        
        inputNamakota(banyakNama);
        
        System.out.println("Berikut Merupakan Nama Sebelum Di Sortir");
        cetakNamakota(banyakNama);
        
        selectSort(banyakNama);
        
        System.out.println("Berikut Merupakan Nama Setelah Di Sortir : ");
        cetakNamakota(banyakNama);
        
    }
}