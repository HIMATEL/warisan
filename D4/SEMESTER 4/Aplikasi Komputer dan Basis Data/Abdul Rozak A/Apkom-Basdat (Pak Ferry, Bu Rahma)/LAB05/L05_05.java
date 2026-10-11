import java.util.Scanner;

public class L05_05{
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
            l[i] = n[i] + " adalah ibukota dari " + m[i];
        }
    }
    
    public static void selectSort(String [] x){
        for (int i=0;i<x.length-1;i++){
            for (int j=i+1;j<x.length;j++){
                if (x[i].compareTo(x[j])<0){
                    String temp = x[i];
                    x[i] = x[j];
                    x[j] = temp;
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
        
        selectSort(disatuin);
        
        System.out.println("Berikut Merupakan Nama Setelah Di Sortir : ");
        cetakNamakota(disatuin);
        
    }
}