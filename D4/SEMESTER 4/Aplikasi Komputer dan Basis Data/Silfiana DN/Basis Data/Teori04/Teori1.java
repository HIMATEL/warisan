import javax.swing.*;
import java.awt.*;

public class Teori1 extends JPanel {
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        setBackground(Color.white);
        g2d.setColor(Color.red);
        g2d.setStroke(new BasicStroke(2));
        
        for (int i = 0; i < 36; i++) {
            g2d.rotate(-3.14/36,300,230);
            g2d.drawOval(270,30,60,400);
         }
         
        g2d.rotate(0,0,0);
        g2d.translate(-397,0);
        g2d.setColor(Color.blue);
        
        for (int i = 0; i < 36; i++) {
            g2d.rotate(-3.14/36,300,230);
            g2d.drawOval(270,30,60,400);
         }
         
        g2d.rotate(0,0,0);
        g2d.translate(-200,0);
        g2d.setColor(Color.green);
        
        for (int i = 0; i < 36; i++) {
            g2d.rotate(-3.14/36,300,230);
            g2d.drawOval(270,30,60,400);
         }
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("BungaOval");
        Teori1 BungaOval = new Teori1();
        frame.add(BungaOval);
        frame.setSize(1200, 1200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
