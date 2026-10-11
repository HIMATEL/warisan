import java.util.Scanner;

public class L05_04{
    public static void inputNamaKota(String[]m,String[]n){
        Scanner input = new Scanner(System.in);
        for (int i=0;i<m.length;i++){
            System.out.print("Masukkan Nama Negara: ");
            m[i] = input.nextLine();
            System.out.print("Ibukota: ");
            n[i] = input.nextLine();
        }
        input.close();
        System.out.println();
    }
    
    public static void satukan(String[]l,String[]m,String[]n){
        int i;
        for(i=0;i<m.length;i++){
            l[i] = m[i] + " ibukotanya " + n[i];
        }
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
    
    public static void cetakNamakota(String[]o){
        for (int i=0;i<o.length;i++){
            System.out.println(o[i]);
        }
        System.out.println();
        System.out.println();
    }
    
    public static void main(String[]args){
        String negara[] = new String[6];
        String ibuKota[] = new String[6];
        String disatuin[] = new String[6];
        
        inputNamaKota(negara,ibuKota);
        satukan(disatuin,negara,ibuKota);
        
        System.out.println("Berikut Merupakan Nama Sebelum Di Sortir");
        cetakNamakota(disatuin);
        
        bubbleSort(disatuin);
        
        System.out.println("Berikut Merupakan Nama Setelah Di Sortir : ");
        cetakNamakota(disatuin);
        
    }
}