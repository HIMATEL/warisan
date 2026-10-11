public class Balok{
    //biasa disebut atribut
    //private digunakan untuk keamanan, agar yang dapat diakses hanya dari class itu saja
    private int panjang;
    private int lebar;
    private int tinggi;
    
    //bagian ini disebut constructor
    //constructor merupakan suatu metode yang namanya sama dengan nama kelasnya
    //this mengatur pada class nya, disini contohnya ngatur Kotak nya
    public Balok (int p, int l, int t){
        this.panjang = p;
        this.lebar = l;
        this.tinggi = t;
        System.out.println("panjang =" + panjang + "; lebar=" + lebar + "; tinggi=" + tinggi);
    }
    
    public int hitungVolume(){
        return panjang*lebar*tinggi;
    }
    
    public static void main(String[] args) {
    Balok balok_1 = new Balok (7,6,3);
    Balok balok_2 = new Balok (12,9,4);
    
    int Volume_balok_1 = balok_1.hitungVolume();
    System.out.println("Volume balok_1;" + Volume_balok_1);
    
    int Volume_balok_2 = balok_2.hitungVolume();
    System.out.println("Volume balok_2;" + Volume_balok_2);
    }
}