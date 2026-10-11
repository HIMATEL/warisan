import java.util.ArrayList;
import java.util.List;

public class NamaBuah{
    public static void main(String[] args){
        List<String>daftarBuah = new ArrayList<>();
        
        daftarBuah.add("Apel");
        daftarBuah.add("Semangka");
        daftarBuah.add("Anggur");
        daftarBuah.add("Mangga");
        daftarBuah.add("Melon");
        daftarBuah.add("Lemon");
        daftarBuah.add("Leci");
        daftarBuah.add("Rambutan");
        daftarBuah.add("Sirsak");
        daftarBuah.add("Pepaya");
        daftarBuah.add("Alpukat");
        daftarBuah.add("Strawberry");
        daftarBuah.add("Nanas");
        daftarBuah.add("Jeruk");
        daftarBuah.add("Lengkeng");
        
        System.out.println("Daftar Buah");
        int i = 1;
        for (String buah : daftarBuah) {
            System.out.println(i + ". " + buah);
            i++;
        }
    }
}
