import javax.swing.JOptionPane;

public class L03_01{
    public static void main(String[]args){
        int bilangan[] = new int [8];
        String show = "";
        int j = 0;
        
        for (int i=0;i<bilangan.length;i++){
            j = j+1;
            String input= JOptionPane.showInputDialog("Masukkan Bilangan ke-" +j);
            bilangan[i] = Integer.parseInt(input);
            show = show + bilangan[i] + "  ";
        }
        
        JOptionPane.showMessageDialog(null,"Berikut Data Yang Telah Di Inputkan \n" +show);
    }
}