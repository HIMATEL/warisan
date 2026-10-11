//nama Kotak ini disebut class dan bersifat tipe data
public class Kotak{
    //biasa disebut atribut
    //private digunakan untuk keamanan, agar yang dapat diakses hanya dari class itu saja
    private int panjang;
    private int lebar;
    
    //bagian ini disebut constructor
    //constructor merupakan suatu metode yang namanya sama dengan nama kelasnya
    //this mengatur pada class nya, disini contohnya ngatur Kotak nya
    //ketika melakukan instansiasi, maka constructor ini akan ter eksekusi
    public Kotak (int p, int l){
        this.panjang = p;
        this.lebar = l;
        System.out.println("panjang = "+panjang+"; lebar="+lebar);
    }
    
    public int hitungLuas(){
        return panjang*lebar;
    }
    
    public static void main(String[] args) {
    Kotak kotak_1 = new Kotak (7,6);
    Kotak kotak_2 = new Kotak (12,9);
    
    int luas_kotak_1 = kotak_1.hitungLuas();
    System.out.println("Luas kotak_1;" + luas_kotak_1);
    
    int luas_kotak_2 = kotak_2.hitungLuas();
    System.out.println("Luas kotak_2;" + luas_kotak_2);
    }
}