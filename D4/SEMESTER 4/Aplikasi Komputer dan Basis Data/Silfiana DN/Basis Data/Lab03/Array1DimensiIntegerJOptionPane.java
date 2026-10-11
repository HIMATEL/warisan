//ARRAY 1 DIMENSI INTEGER JOPTIONPANE

import javax.swing.JOptionPane;

public class Array1DimensiIntegerJOptionPane{
    public static void main(String[] args) {
        int[] bilangan = inputMatriks(8);
        cetakMatriks(bilangan);
    }
    
    public static int[] inputMatriks(int k) {
    int[] r = new int[k];
    for(int i=0; i<k; i++) { 
            r[i] = Integer.parseInt(
            JOptionPane.showInputDialog("Masukan elemen ["+i+"]:"));
    }
    return r;
    }
    
    public static void cetakMatriks(int[] r) {
    for(int i=0; i<r.length; i++) {
    System.out.print(r[i] + "   ");
    }
    }
}
