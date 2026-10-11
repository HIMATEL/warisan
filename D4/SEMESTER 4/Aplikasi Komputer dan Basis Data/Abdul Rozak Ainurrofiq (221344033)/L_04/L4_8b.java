import java.util.Scanner;

public class L4_8b {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Masukkan nilai n: ");
        int n = input.nextInt();
        System.out.println("Hasil " + n + "^10 = " + pangkat10(n,10));
    }

    public static long pangkat10(int x, int y) {
        if (y!=0)
        return (x * pangkat10 (x, y-1));
        else
        return 1;
    }
}
