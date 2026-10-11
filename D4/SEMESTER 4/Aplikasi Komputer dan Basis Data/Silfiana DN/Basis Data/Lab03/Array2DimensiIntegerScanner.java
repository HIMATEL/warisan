//ARRAY 2 DIMENSI SCANNER

import java.util.Scanner;

public class Array2DimensiIntegerScanner{
    public static void main(String[] args) {
        System.out.println("Masukkan 12 elemen matriks:");
        int[][] data1 = inputMatriks(3, 4);
        cetakMatriks(data1);
    }

    public static int[][] inputMatriks(int b, int k) {
        Scanner scanner = new Scanner(System.in);
        int[][] r = new int[b][k];
        for (int i = 0; i < b; i++) {
            for (int j = 0; j < k; j++) {
                System.out.print("Angka ke-" + (i + 1) + " " + (j + 1) + ": ");
                r[i][j] = scanner.nextInt();
            }
        }
        return r;
    }

    public static void cetakMatriks(int[][] r) {
        for (int i = 0; i < r.length; i++) {
            for (int j = 0; j < r[i].length; j++) {
                System.out.printf("%-8d", r[i][j]);
            }
            System.out.println();
        }
    }
}
