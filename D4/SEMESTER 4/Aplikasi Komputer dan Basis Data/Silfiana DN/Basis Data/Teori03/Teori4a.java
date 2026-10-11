import javax.swing.*;
import java.awt.*;

public class Teori4a extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Drawing Circle");
        Teori4a drawCircle = new Teori4a();
        frame.add(drawCircle);
        frame.setSize(600, 600); // Mengatur ukuran frame menjadi 600 x 400 piksel
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        setBackground(Color.white);
        g.setFont(new Font("Arial", Font.BOLD, 54));
        
        g.setColor(Color.blue);
        g.drawLine(0, 300, 600, 300);
        g.drawLine(300, 0, 300, 600);
        
        g.setColor(Color.red);
        g.drawOval(225, 30, 150, 500);
    }
}