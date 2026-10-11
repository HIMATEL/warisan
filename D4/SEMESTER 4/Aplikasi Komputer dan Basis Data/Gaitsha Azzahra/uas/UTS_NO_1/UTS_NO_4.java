import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class UTS_NO_4 {
    public static void main(String[] args) throws IOException {
        int[][] matriks = new int[4][3];
        BufferedReader input = new BufferedReader(new InputStreamReader(System.in));

        System.out.println("Masukkan 12 Angka:");
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 3; j++) {
                System.out.print("Angka [" + i + "][" + j + "]: ");
                matriks[i][j] = Integer.parseInt(input.readLine());
            }
        }

        System.out.println("A:");
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 3; j++) {
                System.out.print(matriks[i][j] + "\t");
            }
            System.out.println();
        }
        int max = matriks[0][0];
        int min = matriks[0][0];
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 3; j++) {
                if (matriks[i][j] > max) {
                    max = matriks[i][j];
                }
                if (matriks[i][j] < min) {
                    min = matriks[i][j];
                }
            }
        }
        System.out.println("Nilai terbesar = " + max);
        System.out.println("Nilai terkecil = " + min);
    }
}
