import java.util.Scanner;

public class NamaNegaraIbukota6AscendingSelectionSort {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] negara = new String[6];
        String[] ibuKota = new String[6];
        System.out.println("Masukkan nama negara dan ibu kota:");

        for (int i = 0; i < 6; i++) {
            System.out.print("Negara ke-" + (i + 1) + ": ");
            negara[i] = scanner.nextLine();
            System.out.print("Ibu Kota ke-" + (i + 1) + ": ");
            ibuKota[i] = scanner.nextLine();
        }
        
        System.out.println("\nSebelum diurutkan:");
        printArrays(negara, ibuKota);
        
        selectionSort(negara, ibuKota);
        System.out.println("\nSetelah diurutkan (ascending order):");
        printArrays(negara, ibuKota);

        scanner.close();
    }
    
    private static void selectionSort(String[] negara, String[] ibuKota) {
        int n = negara.length;
        for (int i = 0; i < n - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (negara[j].compareTo(negara[minIndex]) < 0) {
                    minIndex = j;
                }
            }
            String tempNegara = negara[minIndex];
            negara[minIndex] = negara[i];
            negara[i] = tempNegara;

            String tempIbuKota = ibuKota[minIndex];
            ibuKota[minIndex] = ibuKota[i];
            ibuKota[i] = tempIbuKota;
        }
    }
    
    public static void printArrays(String[] negara, String[] ibuKota) {
        System.out.println("    Nama Negara      Ibukota      ");
        for (int i = 0; i < negara.length; i++) {
            System.out.printf("      %-15s  %-15s %n", negara[i], ibuKota[i]);
        }
    }
}
