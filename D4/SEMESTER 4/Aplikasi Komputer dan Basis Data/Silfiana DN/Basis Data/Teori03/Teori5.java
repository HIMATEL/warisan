import javax.swing.*;
import java.awt.*;

public class Teori5 extends JPanel {
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        setBackground(Color.white);

        g.setFont(new Font("Arial", Font.BOLD, 50));
        g.setColor(Color.white);
        g.drawLine(0, 300, 600, 300);
        g.setColor(Color.white);
        g.drawLine(300, 0, 300, 600);
        
        for (int i = 0; i < 36; i++) {
            g2d.setColor(Color.magenta);
            g2d.drawOval(275, 50, 50, 500);
            g2d.rotate(Math.toRadians(5), 600 / 2.0, 600 / 2.0);
        }
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("BungaOval");
        Teori5 BungaOval = new Teori5();
        frame.add(BungaOval);
        frame.setSize(600, 600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
