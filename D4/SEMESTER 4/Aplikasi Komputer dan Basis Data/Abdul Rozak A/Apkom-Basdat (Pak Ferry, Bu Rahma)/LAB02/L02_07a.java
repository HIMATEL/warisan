import javax.swing.JOptionPane;

public class L02_07a{
     public static void main(String[]Args){
        String Astr = JOptionPane.showInputDialog("data 1: ");
        double A = Double.parseDouble(Astr);
        
        String Bstr = JOptionPane.showInputDialog("data 2: ");
        double B = Double.parseDouble(Bstr);
        
        String Cstr = JOptionPane.showInputDialog("data 3: ");
        double C = Double.parseDouble(Cstr);
        
        String Dstr = JOptionPane.showInputDialog("data 4: ");
        double D = Double.parseDouble(Dstr);
        
        double terkecil;
        if (A<=B && A<=C && A<=D) terkecil=A;
        else if (B<=A && B<=C && B<=D) terkecil=B;
        else if (C<=A && C<=B && C<=D) terkecil=C;
        else terkecil=D;
        
        JOptionPane.showMessageDialog(null, "data terkecil adalah: " +terkecil);
     }
}
