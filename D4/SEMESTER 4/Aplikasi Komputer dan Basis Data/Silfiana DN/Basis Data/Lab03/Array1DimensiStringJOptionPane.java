//ARRAY 1 DIMENSI STRING JOPTIONPANE

import javax.swing.JOptionPane;

public class Array1DimensiStringJOptionPane{
    public static void main(String[] args) {
        String[] negara = inputNegara(5);
        cetakNegara(negara);
    }
        
    public static String[] inputNegara(int k) {
        String[] r = new String[k];
        for (int i=0; i<k; i++){
            r[i] = JOptionPane.showInputDialog("Masukkan nama negara Asia ke-" + (i + 1) + ":");
        }
        return r;
    }
    
    public static void cetakNegara(String[] r) {
        System.out.println("Nama-nama negara Asia:");
        for (int i = 0; i < r.length; i++) {
            System.out.println((i+1)+ "." + r[i]);
        }
    }
}
