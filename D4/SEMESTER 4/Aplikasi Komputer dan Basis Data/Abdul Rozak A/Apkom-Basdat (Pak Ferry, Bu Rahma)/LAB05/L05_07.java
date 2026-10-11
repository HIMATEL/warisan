import java.util.Scanner;

public class L05_07{
    public static void inputArray(String[]l,double[]m,double[]n,double[]o){
        for (int i=0;i<l.length;i++){
            Scanner input = new Scanner(System.in);
            System.out.print("Nama: ");
            l[i] = input.nextLine();
            System.out.print("Mat: ");
            m[i] = input.nextDouble();
            System.out.print("Fisika: ");
            n[i] = input.nextDouble();
            System.out.print("Kimia: ");
            o[i] = input.nextDouble();   
        }
        System.out.println();
    }
    
    public static void satukan(String[]x,String[]l,double[]m,double[]n,double[]o){
        int i;
        for(i=0;i<l.length;i++){
            x[i] = l[i]+":  "+m[i]+";  "+n[i]+";  "+o[i];
        }
    }
    
     public static void selectSort(double[] m,String[]x){
        int i,j;
        for (i=0;i<m.length-1;i++){
            for (j=i+1;j<m.length;j++){
                if (m[i]>m[j]){
                    String temp = x[i];
                    x[i] = x[j];
                    x[j] = temp;
                    
                    double tem = m[i];
                    m[i] = m[j];
                    m[j] = tem;
                }
            }
        }
    }
    
    public static void cetak(String[]o){
        for (int i=0;i<o.length;i++){
            System.out.println(o[i]);
        }
        System.out.println();
        System.out.println();
    }
    
    public static void main(String[]args){
        String nama[] = new String[6];
        double mat[] = new double[6];
        double fisika[] = new double[6];
        double kimia[] = new double[6];
        String hasil[] = new String[6];
        
        inputArray(nama,mat,fisika,kimia);
        
        satukan(hasil,nama,mat,fisika,kimia);
        
        selectSort(fisika,hasil);
        
        cetak(hasil);
    }
}