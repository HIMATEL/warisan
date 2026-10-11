import javax.swing.*;
import java.awt.*;

public class Teori2 extends JPanel {
    
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
        g.setColor(Color.red);
        g.fillOval(40, 30, 500, 500);
        g.setColor(Color.pink);
        g.fillOval(90, 60, 400, 400);
        g.setColor(Color.green);
        g.fillOval(140, 110, 300, 300);
        g.setColor(Color.blue);
        g.fillOval(190, 160, 200, 200);
        g.setColor(Color.yellow);
        g.fillOval(240, 210, 100, 100);
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("Drawing Circle");
        Teori2 drawCircle = new Teori2();
        frame.add(drawCircle);
        frame.setSize(600, 600); // Mengatur ukuran frame menjadi 600 x 400 piksel
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}