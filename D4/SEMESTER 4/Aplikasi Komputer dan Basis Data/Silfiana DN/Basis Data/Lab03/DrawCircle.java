import javax.swing.*;
import java.awt.*;

public class DrawCircle extends JPanel {
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        setBackground(Color.yellow);
        g.setFont(new Font("Arial", Font.BOLD, 24));
        // Mengatur ketebalan garis menjadi 3 piksel
        //g.setStroke(new BasicStroke(5));
        // Mengatur warna lingkaran menjadi merah
        g.setColor(Color.RED);
        
        // Menggambar lingkaran dengan pusat (300, 200) dan jari-jari 100
        g.fillOval(350, 150, 100, 100);
        g.setColor(Color.blue);
        g.fillOval(100, 150, 180, 100);
        g.drawString("ELIPS",150,140);
        g.setColor(Color.RED);
        g.fillRect(100,20,160,75);
        g.drawString("Circle",370,140);
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("Drawing Circle");
        DrawCircle drawCircle = new DrawCircle();
        frame.add(drawCircle);
        frame.setSize(600, 400); // Mengatur ukuran frame menjadi 600 x 400 piksel
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
