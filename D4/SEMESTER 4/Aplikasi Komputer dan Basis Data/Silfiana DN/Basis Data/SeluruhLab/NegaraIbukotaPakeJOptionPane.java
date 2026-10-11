import javax.swing.JOptionPane;

public class NegaraIbukotaPakeJOptionPane {
    public static void main (String [] args){
        //Meminta pengguna memasukkan nama negara dan ibu kota menggunakan JOptionPane
        String NN = JOptionPane.showInputDialog("Masukkan nama Negara :");
        String IK = JOptionPane.showInputDialog("Masukkan nama Ibu Kota :");
        
        //Mencetak pesan yang diformat menggunakan JOptionPane
        JOptionPane.showMessageDialog(null, IK + " adalah ibu kota dari negara " + NN + ".");
    }
}