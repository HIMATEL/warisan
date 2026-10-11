import javax.swing.*;
import java.awt.*;

public class Teori4 extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("segilima");
        Teori4 segilima = new Teori4();
        frame.add(segilima);
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
        
        g2d.translate(0, 40);
        for (int i = 0; i < 5; i++) {
            g2d.setColor(Color.red);
            g2d.drawLine(150, 450, 450, 450);
            g2d.rotate(Math.toRadians(72), 300, 242);
        }
       
    }
}
