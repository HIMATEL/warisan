import javax.swing.JOptionPane;

public class L02_08{
    public static void main(String[]args){
        String kalimat = JOptionPane.showInputDialog("masukkan kalimat");
        
        for(int i=0;i<7;i++){
            System.out.println(kalimat);
        }
    }
}