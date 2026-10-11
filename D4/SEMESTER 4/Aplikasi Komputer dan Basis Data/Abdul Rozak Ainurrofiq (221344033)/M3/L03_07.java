import javax.swing.JOptionPane;

public class L03_07{
    public static void main(String[]args){
        String namaSiswa[][] = new String [3][4];
        String show = "";
        String enter = "\n";
        int k = 0;
        
        for (int i=0;i<3;i++){
            for (int j=0;j<4;j++){
                k = k+1;
                namaSiswa[i][j] = JOptionPane.showInputDialog("Masukkan Nama Siswa ke-" +k+ ": ");
                show = show + namaSiswa[i][j] + "  ";
            }
            show = show + enter;
        }
        JOptionPane.showMessageDialog(null,"Berikut Nama Siswa Yang Telah Di Inputkan : \n" + show);
    }
}