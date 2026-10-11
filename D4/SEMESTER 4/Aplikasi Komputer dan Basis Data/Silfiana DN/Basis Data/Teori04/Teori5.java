import javax.swing.*;
import java.awt.*;

public class Teori5 extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("segienam");
        Teori5 segienam = new Teori5();
        frame.add(segienam);
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
    
        for (int i = 0; i < 6; i++) {
            g2d.setColor(Color.red);
            g2d.drawLine(200, 403, 400, 403);
            g2d.rotate(Math.toRadians(60), 300, 229);
        }
       
    }
}
