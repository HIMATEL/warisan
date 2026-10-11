import javax.swing.*;
import java.awt.*;

public class Teori8 extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("2Segitiga");
        Teori8 Segitiga = new Teori8();
        frame.add(Segitiga);
        frame.setSize(600,600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        setBackground(Color.white);
        g.setFont(new Font("Arial", Font.BOLD, 50));
        
        for (int i = 0; i < 3; i++) {
            g2d.setColor(Color.red);
            g2d.drawLine(150, 251, 450, 251);
            g2d.rotate(Math.toRadians(120), 300, 338);
        }
        
        for (int i = 0; i < 3; i++) {
            g2d.setColor(Color.red);
            g2d.drawLine(150, 450, 450, 450);
            g2d.rotate(Math.toRadians(120), 300, 363);
        }
    }
}
