import java.util.Scanner;

public class UTSNo1{
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Masukkan dua digit bilangan oktal: ");
        int oktal = input.nextInt();
        System.out.print("Masukkan dua digit bilangan desimal: ");
        int desimal = input.nextInt();
        int Heksadesimal = hitungHeksadesimal(oktal, desimal);

        System.out.println("Nilai Z dalam heksadesimal: " + Heksadesimal());
    }
    
    public static int hitungHeksadesimal(int oktal, int desimal) {
        return oktal + desimal/16;
    }
}
