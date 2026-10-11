package basdat;

import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JFrame;
import java.awt.FlowLayout;

public class L08_01cara2 {
	public L08_01cara2() {
		label = new JLabel ("Nama Anda: ");
		textfield = new JTextField(20);
		
		frame = new JFrame();
		frame.setLayout(null);
		frame.setLayout(new FlowLayout(Flowlayout.LEFT,10,10));
		frame.setTitle("Data Mahasiswa Prodi Telkom");
		
		frame.getContentPane().add(label);
		frame.getContentPane().add(textfield);
		frame.setLocationRelativeTo(null);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(300,200);
		frame.setVisible(true);
	}
	
	public static void main (String[]args) {
		new L08_01cara2();
	}
}
