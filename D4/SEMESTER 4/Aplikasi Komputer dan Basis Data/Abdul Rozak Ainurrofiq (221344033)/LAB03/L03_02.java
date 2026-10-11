import javax.swing.JOptionPane;

public class L03_02{
    public static int[][] inputMatriks(int b, int k){
        int[][] r = new int[b][k];
        for (int i=0;i<b;i++){
            for (int j=0;j<k;j++){
                r[i][j]= Integer.parseInt(JOptionPane.showInputDialog("Masukan elemen ["+i+"]["+j+"]:"));
            }
        }
        return r;
    }
    public static void cetakMatriks(int[][]r){
        for(int i=0;i<r.length;i++){
            for(int j=0;j<r[i].length;j++){
                System.out.printf("%-8d ",r[i][j]);
            }
            System.out.println();
        }
    }
    public static void main(String[]args){
        int[][] data1 = inputMatriks(3,4);
        cetakMatriks(data1);
    }
}