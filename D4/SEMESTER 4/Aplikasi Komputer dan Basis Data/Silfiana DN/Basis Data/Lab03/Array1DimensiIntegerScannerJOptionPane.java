//ARRAY 1 DIMENSI INTEGER SCANNER

import java.util.Scanner;

public class Array1DimensiIntegerScannerJOptionPane{
    public static void main(String[] args) {
        System.out.println("Masukkan 8 elemen matriks:");
        int[] bilangan = inputMatriks(8);
        cetakMatriks(bilangan);
    }

    public static int[] inputMatriks(int k) {
        Scanner scanner = new Scanner(System.in);
        int[] r = new int[k];
        for (int i = 0; i < k; i++) {
            System.out.print("Masukkan elemen ke-" + (i + 1) + ": ");
            r[i] = scanner.nextInt();
        }
        return r;
    }

    public static void cetakMatriks(int[] r) {
        System.out.print("Matriks: ");
        for (int i = 0; i < r.length; i++) {
            System.out.print(r[i] + "   ");
        }
    }
}