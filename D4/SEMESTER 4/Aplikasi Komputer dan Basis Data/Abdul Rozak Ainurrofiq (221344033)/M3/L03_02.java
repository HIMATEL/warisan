import javax.swing.JOptionPane;

public class L03_02{
    public static void main(String[]args){
        int data1[][] = new int [3][4];
        String show = "";
        String enter = "\n";
        int k = 0;
        
        for (int i=0;i<3;i++){
            for (int j=0;j<4;j++){
                k = k+1;
                String input = JOptionPane.showInputDialog("Masukkan Bilangan ke -" +k+ ": ");
                data1[i][j] = Integer.parseInt(input);
                show = show + data1[i][j] + "   ";
            }
            show = show + enter;
        }
        
        JOptionPane.showMessageDialog(null,"Berikut Data Yang Telah Di Inputkan \n" +show);
    }
}