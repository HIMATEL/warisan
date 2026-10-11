import javax.swing.*;
import java.awt.*;

public class Teori6 extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("segitujuh");
        Teori6 segitujuh = new Teori6();
        frame.add(segitujuh);
        frame.setSize(600, 600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        setBackground(Color.white);
        
        g.setFont(new Font("Arial", Font.BOLD, 50));
        g2d.setStroke(new BasicStroke(3));
        
        g2d.translate (0,50);
        for (int i = 0; i < 7; i++) {
            g2d.setColor(Color.red);
            g2d.drawLine(227, 345, 375, 345);
            g2d.rotate(Math.toRadians(51.43), 300, 190);
        }
       
    }
}
