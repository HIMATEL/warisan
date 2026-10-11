import javax.swing.JOptionPane;

public class Cancel {
    public static void main(String[] args) {
        // Input String
        String inputString;
        do {
            inputString = JOptionPane.showInputDialog("Masukkan string:");
            if (inputString == null) {
                JOptionPane.showMessageDialog(null, "Anda membatalkan input. Silakan masukkan kembali.");
            }
        } while (inputString == null);
        JOptionPane.showMessageDialog(null, "String yang dimasukkan: " + inputString);
        
        // Input Integer
        String inputIntStr;
        int inputInt;
        do {
            inputIntStr = JOptionPane.showInputDialog("Masukkan integer:");
            if (inputIntStr == null) {
                JOptionPane.showMessageDialog(null, "Anda membatalkan input. Silakan masukkan kembali.");
            } else {
                inputInt = Integer.parseInt(inputIntStr);
            }
        } while (inputIntStr == null);
        JOptionPane.showMessageDialog(null, "Integer yang dimasukkan: " + inputIntStr);
        
        // Sisanya diimplementasikan serupa
    }
}

