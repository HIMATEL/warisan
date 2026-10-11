import javax.swing.JOptionPane;

public class NammaPakeJOptionPane {
    public static void main (String [] args){
        //Meminta pengguna memasukkan nama menggunakan JOptionPane
        String ND = JOptionPane.showInputDialog("Masukkan nama depan Anda :");
        String NB = JOptionPane.showInputDialog("Masukkan nama belakang Anda :");
        
        //Mencetak pesan yang diformat menggunakan JOptionPane
        JOptionPane.showMessageDialog(null, "Hallo " + ND + " " + NB + " bagaimana kabar Anda hari ini?.");
    }
}
