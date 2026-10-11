import javax.swing.JOptionPane;

public class L01_04c{
    public static void main(String[]args){
        String NA = JOptionPane.showInputDialog("Nama Anda: ");
        
        String BBStr = JOptionPane.showInputDialog("Berat Badan(kg): ");
        double BB = Double.parseDouble(BBStr);
        
        String TBStr = JOptionPane.showInputDialog("Tinggi Badan(cm): ");
        double TB = Double.parseDouble(TBStr);
        JOptionPane.showMessageDialog(null, "Hallo, "+NA+" berat badan anda "+BB+ " kg, dan tinggi badan anda "+TB+" cm");
    }
}