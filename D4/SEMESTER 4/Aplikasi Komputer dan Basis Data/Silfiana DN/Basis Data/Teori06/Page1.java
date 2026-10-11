 

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

class Page1 extends JPanel implements ActionListener{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JButton btn;
	
	public Page1() {
		btn = new JButton("Info Page #1");
		btn.addActionListener(this);
		btn.setMnemonic('1');
		add(btn);
	}
    
	public void actionPerformef(ActionEvent event) {
		if(event.getSource() == btn) {
			JOptionPane.showMessageDialog(null, "ini adalah page ke-1");
		}
	}

	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}
}

class Page2 extends JPanel{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JTextField tf;
	
	public Page2() {
		tf = new JTextField("ini adalah contoh page kedua",20);
		add(tf);
	}
}

class DemoTabbedPane{
	public JTabbedPane tp;
	
	public DemoTabbedPane() {
		ImageIcon icon = new ImageIcon("/image/icon.jpg");
		
		tp = new JTabbedPane();
		tp.addTab("Page #1", icon, new Page1(), "Page pertama");
		tp.addTab("Page #2", icon, new Page2(), "Page kedua");
		
		tp.setLocation(0,0);
		tp.setSize(new Dimension(290,190));
	}
	
	public void createAndSHowGUI() {
		JFrame.setDefaultLookAndFeelDecorated(true);
		JFrame frame = new JFrame("Demo JTabbedPane");
		frame.setLayout(null);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().add(tp);
		frame.setBounds(0,0,300,200);
		frame.setLocationRelativeTo(null);
		frame.setVisible(true);
	}
	
	public static void main (String[] args) {
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
			public void run() {
			}
		});
	}
}
