class Jarakk {
    public int bandung(int x, int y) {
        int hasil = x + y;
        return (hasil);
    }

    public static int cirebon(int x, int y) {
        int hasil = x + x + y;
        return (hasil);
    }

    public static void main(String[] args) {
        Jarakk kota = new Jarakk();
        int akhir = kota.bandung(3, 5);
        int city = cirebon(2, 2);
        System.out.println(akhir);
        System.out.println(city);
    }
}