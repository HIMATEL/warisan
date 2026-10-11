//ARRAY 2 DIMENSI STRING JOPTIONPANE

import javax.swing.JOptionPane;

public class Array2DimesniStringJOptionPane {
    public static void main(String[] args) {
        System.out.println("Masukkan 12 Nama Siswa :");
        String[][] namaSiswa = inputNamaSiswa(3, 4);
        cetakNamaSiswa(namaSiswa);
    }

    public static String[][] inputNamaSiswa(int b, int k) {
        String[][] r = new String[b][k];
        for (int i = 0; i < b; i++) {
            for (int j = 0; j < k; j++) {
                r[i][j] = JOptionPane.showInputDialog("Masukkan elemen [" + i + "][" + j + "]: ");
            }
        }
        return r;
    }

    public static void cetakNamaSiswa(String[][] r) {
        for (int i = 0; i < r.length; i++) {
            for (int j = 0; j < r[i].length; j++) {
                System.out.printf("%-20s", r[i][j]);
            }
            System.out.println();
        }
    }
}
