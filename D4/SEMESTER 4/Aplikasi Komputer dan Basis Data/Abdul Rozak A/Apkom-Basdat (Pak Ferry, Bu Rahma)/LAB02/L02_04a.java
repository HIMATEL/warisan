import javax.swing.JOptionPane;

public class L02_04a{
    public static void main(String[]args){
        String ND = JOptionPane.showInputDialog("Nama Depan:");
        String NB = JOptionPane.showInputDialog("Nama Belakang:");
        JOptionPane.showMessageDialog(null, "Hallo, " +ND+ " " +NB+ ", bagaimana kabar anda?");
    }
}