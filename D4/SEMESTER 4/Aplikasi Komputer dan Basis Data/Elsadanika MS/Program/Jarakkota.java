class Jarakkota {
    public static int bandung(int x, int y) {
        int z = x + y;
        return (z);
    }

    public int cirebon(int x, int y) {
        int z = x + x + y;
        return (z);
    }

    public static void main(String[] args) {
        int hasil = bandung(3, 5);
        System.out.println(hasil);
    }
}

class Jarakkabupaten {
    public static void main(String[] args) {
        int baru = Jarakkota.bandung(5, 5);
        System.out.println(baru);
        Jarakkota jumlah = new Jarakkota();
        int hasilfinal = jumlah.cirebon(8, 5);
        System.out.println(hasilfinal);
    }
}