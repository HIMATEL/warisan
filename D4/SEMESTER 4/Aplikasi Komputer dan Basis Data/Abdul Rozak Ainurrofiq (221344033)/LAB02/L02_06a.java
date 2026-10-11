import javax.swing.JOptionPane;

public class L02_06a{
     public static void main(String[]Args){
        String Astr = JOptionPane.showInputDialog("data 1: ");
        double A = Double.parseDouble(Astr);
        
        String Bstr = JOptionPane.showInputDialog("data 2: ");
        double B = Double.parseDouble(Bstr);
        
        String Cstr = JOptionPane.showInputDialog("data 3: ");
        double C = Double.parseDouble(Cstr);
        
        double terbesar;
        if (A>=B && A>=C) terbesar=A;
        else if (B>=A && B>=C) terbesar=B;
        else terbesar=C;
        
        JOptionPane.showMessageDialog(null, "data terbesar adalah: " +terbesar);
     }
}
