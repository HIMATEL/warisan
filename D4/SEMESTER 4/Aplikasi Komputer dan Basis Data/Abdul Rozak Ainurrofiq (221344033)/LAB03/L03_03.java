import javax.swing.JOptionPane;

public class L03_03{
    public static void main(String[]args){
        String negara[] = new String[10];
        for(int i=0;i<5;i++){
            negara[i] = JOptionPane.showInputDialog("Negara "+i+": ");
        }
        for(int i=0;i<5;i++){
            System.out.println(negara[i]);
        }
    }
}