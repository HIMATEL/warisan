 

import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JFrame;
import java.awt.FlowLayout;

public class satu extends JFrame {
	public satu () {
		setLayout (new FlowLayout(FlowLayout.LEFT,10,10));
		add (new JLabel("Nama Anda:"));
		add (new JTextField(20));
    }
	
    public static void main(String[] args) {
	satu frame = new satu();
	frame.setTitle("Data Mahasiswa Prodi Telkom");
	frame.setLocationRelativeTo(null);
	frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	frame.setSize(300,200);
	frame.setVisible(true);
      }
}
