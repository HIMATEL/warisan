import javax.swing.*;
import java.awt.*;

public class Teori1 extends JPanel {
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        setBackground(Color.white);
        g.setFont(new Font("Times New Roman", Font.BOLD, 24));
        // Mengatur ketebalan garis menjadi 3 piksel
        //g.setStroke(new BasicStroke(5));
        // Mengatur warna lingkaran menjadi merah
        g.setColor(Color.RED);
        
        // Menggambar lingkaran dengan pusat (300, 200) dan jari-jari 100
        g.fillOval(100, 20, 600, 600);
        g.setColor(Color.RED);
        g.drawString("Oval",400,80);
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("Drawing Circle");
        Teori1 drawCircle = new Teori1();
        frame.add(drawCircle);
        frame.setSize(800, 800); // Mengatur ukuran frame menjadi 600 x 400 piksel
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}