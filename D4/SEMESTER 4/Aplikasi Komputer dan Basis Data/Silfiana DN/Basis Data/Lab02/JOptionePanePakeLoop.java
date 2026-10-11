import javax.swing.JOptionPane;

public class JOptionePanePakeLoop{
    public static void main (String [] args){
        //Meminta pengguna memasukkan data string menggunakan JOptionPane
        String Data = JOptionPane.showInputDialog("Masukkan data string :");
        
        for (int x = 0; x<7; x++){
        System.out.println(Data);
        
        }
    }
}
