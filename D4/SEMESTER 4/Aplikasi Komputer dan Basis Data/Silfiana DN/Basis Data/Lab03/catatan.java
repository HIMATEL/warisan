//ARRAY 1 DIMENSI
import javax.swing.JOptionPane;

public class catatan{
    public static void main(String[] args){
            int[] bilangan = inputMatriks(8); //nama metode untuk memasukkan data
            cetakMatriks(bilangan);
        }
        
    public static int[] inputMatriks (int k){ //int merupakan tipe data dari metode inputMatriks
        //k berfungsi untuk menentukan berapa jumlah input matriks yang akan digunakan
        //instansiasi adalah proses pembentukan unit memori dengan nama r tsb
        int[] r = new int[k]; //variabel array r denfan ukuran k
        for(int i=0;i<k;i++){   //k mengambil kontrol untuk menentukan berapa jumlah matriks
            r[i] = Integer.parseInt(
            JOptionPane.showInputDialog("Masukan elemen["+i+"]:"));
        //data dari JoptinePane dirubah menjadi int beru dimasukkan menjadi elemen elemen array r sebanyak k kali
    }
        return r; //mengirimkan data array ke main metode
    }
    public static void cetakMatriks(int[]r){ //fungsi void mencetak ke monitor, int[] merupakan argumen yang bersifat array
            for(int i=0; i<r.length; i++){
                System.out.print(r[i]+"  ");
            }
    }
    }