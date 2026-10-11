import java.util.Scanner;
public class Array1DimensiIntegerScannerSelectionSort{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int[] bilangan = new int[8];
        System.out.println("Masukkan 8 data integer:");
        for (int i = 0; i < 8; i++) {
            System.out.print("Data ke-" + (i + 1) + ": ");
            bilangan[i] = scanner.nextInt();
        }
        System.out.println("Isi array sebelum sorting:");
        printArray(bilangan);
        selectionSort(bilangan);
        System.out.println("Isi array setelah sorting:");
        printArray(bilangan);
    }

    private static void selectionSort(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIndex]) {
                    minIndex = j;
                }
            }
            int temp = arr[minIndex];
            arr[minIndex] = arr[i];
            arr[i] = temp;
        }
    }

    private static void printArray(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }
}
