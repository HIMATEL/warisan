import java.util.Scanner;

public class NamaKota6AscendingBubbleSort {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String[] Kota = new String[6];
        System.out.println("Masukkan 6 nama kota di Jawa Barat:");
        for (int i = 0; i < Kota.length; i++) {
            System.out.print("Kota ke-" + (i + 1) + ": ");
            Kota[i] = scanner.nextLine();
        }

        System.out.println("\nNama kota sebelum diurutkan:");
        displayKota(Kota);
        bubbleSortManual(Kota);
        
        System.out.println("\nNama kota setelah diurutkan:");
        displayKota(Kota);

        scanner.close();
    }

    private static void displayKota(String[] cities) {
        for (String city : cities) {
            System.out.println(city);
        }
    }

    private static void bubbleSortManual(String[] arr) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j].compareTo(arr[j + 1]) > 0) {
                    String temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
}
