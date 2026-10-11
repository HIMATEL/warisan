import java.util.Scanner;

public class Mahasiswa6Matkul3Diurutkan {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] namaMahasiswa = new String[6];
        double[] nilaiMatematika = new double[6];
        double[] nilaiFisika = new double[6];
        double[] nilaiKimia = new double[6];

        System.out.println("Masukkan data mahasiswa:");

        for (int i = 0; i < 6; i++) {
            System.out.print("Nama Mahasiswa ke-" + (i + 1) + ": ");
            namaMahasiswa[i] = scanner.nextLine();

            System.out.print("Nilai Matematika: ");
            nilaiMatematika[i] = scanner.nextDouble();

            System.out.print("Nilai Fisika: ");
            nilaiFisika[i] = scanner.nextDouble();

            System.out.print("Nilai Kimia: ");
            nilaiKimia[i] = scanner.nextDouble();
            
            scanner.nextLine();
        }

        selectionSortByFisika(namaMahasiswa, nilaiMatematika, nilaiFisika, nilaiKimia);

        System.out.println("\nHasil pengurutan berdasarkan Mata Kuliah Fisika (ascending order):");
        displayData(namaMahasiswa, nilaiMatematika, nilaiFisika, nilaiKimia);

        scanner.close();
    }

    private static void selectionSortByFisika(String[] namaMahasiswa, double[] nilaiMatematika,
                                              double[] nilaiFisika, double[] nilaiKimia) {
        int n = nilaiFisika.length;
        for (int i = 0; i < n - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (nilaiFisika[j] < nilaiFisika[minIndex]) {
                    String tempNama = namaMahasiswa[minIndex];
                    namaMahasiswa[minIndex] = namaMahasiswa[j];
                    namaMahasiswa[j] = tempNama;

                    double tempMatematika = nilaiMatematika[minIndex];
                    nilaiMatematika[minIndex] = nilaiMatematika[j];
                    nilaiMatematika[j] = tempMatematika;

                    double tempFisika = nilaiFisika[minIndex];
                    nilaiFisika[minIndex] = nilaiFisika[j];
                    nilaiFisika[j] = tempFisika;

                    double tempKimia = nilaiKimia[minIndex];
                    nilaiKimia[minIndex] = nilaiKimia[j];
                    nilaiKimia[j] = tempKimia;
                }
            }
        }
    }

    private static void displayData(String[] namaMahasiswa, double[] nilaiMatematika,
                                     double[] nilaiFisika, double[] nilaiKimia) {
        System.out.printf("%-5s%-20s%-15s%-15s%-15s%n", "No", "Nama Mahasiswa", "Matematika", "Fisika", "Kimia");

        for (int i = 0; i < namaMahasiswa.length; i++) {
            System.out.printf("%-5s%-20s%-15.2f%-15.2f%-15.2f%n",
                    (i + 1), namaMahasiswa[i], nilaiMatematika[i], nilaiFisika[i], nilaiKimia[i]);
        }
    }
}
