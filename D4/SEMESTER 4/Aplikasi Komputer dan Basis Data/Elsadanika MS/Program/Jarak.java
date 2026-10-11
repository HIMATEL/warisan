class Jarak {
    static int tambah(int var1, int var2) {
        return var1 + var2;
    }
    static int tambah(int var1, int var2, int var3) {
        return var1 + var2 + var3;
    }
    static String tambah(String var1, String var2) {
        return var1 + " tambah " + var2;
    }
    public static void main(String args[]){
        System.out.println( tambah(8,9) );
        System.out.println( tambah(5,1,3) );
        System.out.println( tambah("lima","lima") );
    }
}