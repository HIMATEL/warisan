import javax.swing.JOptionPane;

public class NamaBBTBJOptinePane {
    public static void main (String [] args){
        //Meminta pengguna memasukkan nama menggunakan JOptionPane
        String NA = JOptionPane.showInputDialog("Masukkan nama Anda :");
        
        //Meminta pengguna memasukkan berat badan menggunakan JOptionPane
        String BB = JOptionPane.showInputDialog("Masukkan Berat Badan Anda :");
        int berat = Integer.parseInt(BB);
        
        //Meminta pengguna memasukkan tinggi badan menggunakan JOptionPane
        String TB = JOptionPane.showInputDialog("Masukkan Tinggi Badan Anda :");
        double tinggi = Double.parseDouble(TB);
        
        //Mencetak pesan yang diformat menggunakan JOptionPane
        JOptionPane.showMessageDialog(null, "Hallo " + NA + ", berat badan Anda " + BB + " kg dan tinggi badan Anda " + TB + " cm.");
    }
}
