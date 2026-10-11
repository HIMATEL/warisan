import javax.swing.*;
import java.awt.*;

public class Teori7 extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("segidelapan");
        Teori7 segidelapan = new Teori7();
        frame.add(segidelapan);
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
        
        g2d.translate (125,230);
        for (int i = 0; i < 8; i++) {
            g2d.setColor(Color.red);
            g2d.drawLine(75, 225, 225, 225);
            g2d.rotate(Math.toRadians(45), 150, 45);
        }
       
    }
}
