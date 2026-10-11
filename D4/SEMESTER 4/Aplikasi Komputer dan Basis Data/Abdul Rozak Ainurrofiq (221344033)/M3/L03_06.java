import java.util.Scanner;

public class L03_06{
    public static String[][] inputMatrix(int k,int l){
        Scanner input = new Scanner(System.in);
        String[][] data = new String [k][l];
        int counter = 0;
        
        for (int i=0;i<k;i++){
            for (int j=0;j<l;j++){
                counter = counter + 1;
                System.out.print("Masukkan Nama Siswa ke-" +counter+ ": ");
                data[i][j] = input.nextLine();
            }
        }
        input.close();
        return data;
    }
    
    public static void cetakMatrix(String[][] x){
        for (int i=0;i<3;i++){
            for (int j=0;j<4;j++){
                System.out.print("\t"+x[i][j]);
            }
            System.out.println();
        }
    }
    
    public static void main(String[]args){
        String [][] namaSiswa = inputMatrix(3,4);
        System.out.println("Berikut Nama Yang Telah Di Inputkan");
        cetakMatrix(namaSiswa);
    }
}