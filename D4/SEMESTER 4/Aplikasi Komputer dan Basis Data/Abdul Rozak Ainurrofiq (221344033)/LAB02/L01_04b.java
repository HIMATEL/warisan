import javax.swing.JOptionPane;

public class L01_04b{
    public static void main(String[]args){
        String NN = JOptionPane.showInputDialog("Nama Negara:");
        String IK = JOptionPane.showInputDialog("Ibu Kota:");
        JOptionPane.showMessageDialog(null, IK+ " adalah ibu kota dari negara "+NN);
    }
}