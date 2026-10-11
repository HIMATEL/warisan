import java.util.Scanner;

public class NamaNegaraIbukota6DiscendingSelectionSort {
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
        System.out.println("\nSetelah diurutkan (discending order):");
        printArrays(negara, ibuKota);
        scanner.close();
    }
    
    private static void selectionSort(String[] negara, String[] ibuKota) {
        int n = ibuKota.length;
        for (int i = 0; i < n - 1; i++) {
            int maxIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (ibuKota[j].compareTo(ibuKota[maxIndex]) > 0) {
                    maxIndex = j;
                }
            }
            String tempNegara = negara[maxIndex];
            negara[maxIndex] = negara[i];
            negara[i] = tempNegara;

            String tempIbuKota = ibuKota[maxIndex];
            ibuKota[maxIndex] = ibuKota[i];
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
