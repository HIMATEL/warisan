import java.util.Scanner;

public class Array1DimensiStringScannerSelectionSort {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Input data ke dalam array
        String[] kota = new String[6];
        System.out.println("Masukkan 6 nama kota di Jawa Barat:");

        for (int i = 0; i < 6; i++) {
            System.out.print("Kota ke-" + (i + 1) + ": ");
            kota[i] = scanner.nextLine();
        }

        // Cetak isi array sebelum sorting
        System.out.println("Isi array sebelum sorting:");
        printArray(kota);

        // Melakukan sorting menggunakan metode selection sort
        selectionSort(kota);

        // Cetak isi array setelah sorting
        System.out.println("Isi array setelah sorting:");
        printArray(kota);
    }

    // Metode untuk melakukan selection sort
    private static void selectionSort(String[] arr) {
        int n = arr.length;

        for (int i = 0; i < n - 1; i++) {
            int minIndex = i;

            for (int j = i + 1; j < n; j++) {
                if (arr[j].compareTo(arr[minIndex]) < 0) {
                    minIndex = j;
                }
            }

            // Swap elemen terkecil dengan elemen pertama atau elemen ke-i
            String temp = arr[minIndex];
            arr[minIndex] = arr[i];
            arr[i] = temp;
        }
    }

    // Metode untuk mencetak isi array
    private static void printArray(String[] arr) {
        for (int i = 0; i < arr.length; i++) {
            System.out.println(arr[i]);
        }
        System.out.println();
    }
}
