//ARRAY 2 DIMENSI INTEGER JOPTIONPANE

import javax.swing.JOptionPane;
public class Array2DimensiIntegerJOptionPane{
     public static void main(String[]args){
        int [][] data1 = inputMatriks(3,4);
        cetakMatriks(data1);
    }
    
    public static int[][] inputMatriks(int b, int k){
        int[][] r = new int[b][k];
        for (int  i = 0; i<3; i++){
            for (int j = 0; j<4; j++){
            r [i][j] = Integer.parseInt(JOptionPane.showInputDialog("masukkan elemen ["+i+"]["+j+"]: "));}
        }
        return r;
    }
    
    public static void cetakMatriks(int[][] r){
        for (int i = 0; i<3; i++){
            for (int j=0 ; j<4; j++){
            System.out.printf("%-8d", r[i][j]);
            }
        System.out.println();
    }
    
    }
}
