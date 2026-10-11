import javax.swing.*;
import java.awt.*;

public class Teori4b extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Drawing Circle");
        Teori4b drawCircle = new Teori4b();
        frame.add(drawCircle);
        frame.setSize(600, 600); // Mengatur ukuran frame menjadi 600 x 400 piksel
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        
        setBackground(Color.white);
        int x = 225;
        int y = 30;
        int width = 150;
        int height = 500;
        
        g.setColor(Color.blue);
        g.drawLine(0, 300, 600, 300);
        g.drawLine(300, 0, 300, 600);
        
        g2d.setColor(Color.RED);
        g2d.rotate(Math.toRadians(45), x + width / 2.0, y + height / 2.0);
        g2d.fillOval(x, y, width, height);
    }
}