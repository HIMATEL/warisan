import javax.swing.JOptionPane;

public class L02_06b{
     public static void main(String[]Args){
        String Astr = JOptionPane.showInputDialog("data 1: ");
        double A = Double.parseDouble(Astr);
        
        String Bstr = JOptionPane.showInputDialog("data 2: ");
        double B = Double.parseDouble(Bstr);
        
        String Cstr = JOptionPane.showInputDialog("data 3: ");
        double C = Double.parseDouble(Cstr);
        
        double terbesar = A;
        if(B>terbesar)terbesar=B;
        if(C>terbesar)terbesar=C;
        
        JOptionPane.showMessageDialog(null, "data terbesar adalah: " +terbesar);
     }
}