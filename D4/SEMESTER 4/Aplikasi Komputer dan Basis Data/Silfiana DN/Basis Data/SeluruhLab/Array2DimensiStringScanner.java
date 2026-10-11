//ARRAY 2 DIMENSI SCANNER

import java.util.Scanner;

public class Array2DimensiStringScanner {
    public static void main(String[] args) {
        System.out.println("Masukkan 12 Nama Siswa :");
        String[][] namaSiswa = inputNamaSiswa(3, 4);
        cetakNamaSiswa(namaSiswa);
    }

    public static String[][] inputNamaSiswa(int b, int k) {
        Scanner scanner = new Scanner(System.in);
        String[][] namaSiswa = new String[b][k];
        for (int i = 0; i < b; i++) {
            for (int j = 0; j < k; j++) {
                System.out.print("Nama Siswa ke-" + (i + 1) + " " + (j + 1) + ": ");
                namaSiswa[i][j] = scanner.nextLine();
            }
        }
        return namaSiswa;
    }

    public static void cetakNamaSiswa(String[][] namaSiswa) {
        System.out.println("Nama-nama siswa:");
        for (int i = 0; i < namaSiswa.length; i++) {
            for (int j = 0; j < namaSiswa[i].length; j++) {
                System.out.printf("%-20s", namaSiswa[i][j]);
            }
            System.out.println();
        }
    }
}
