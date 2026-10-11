public class UTS_NO_1 {
    public static void main(String[] args) {
        long angka = 1;

        for (int i = 0; i < 7; i++) {
            System.out.print(angka);

            if (i != 6) {
                System.out.print(", ");
            } else {
                System.out.print(".");
            }
      
            if (i == 3) {
                angka = angka * angka; 
            } else if (i == 5) {
                angka = angka * angka; 
            } else {
                angka = angka * 6; 
            }
        }
    }
}
