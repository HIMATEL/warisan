import javax.swing.*;
import java.awt.*;

public class Teori3 extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Persegi");
        Teori3 persegi = new Teori3();
        frame.add(persegi);
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

        for (int i = 0; i < 4; i++) {
            g2d.setColor(Color.red);
            g2d.drawRect(150, 150, 300, 300);
            g2d.rotate(Math.toRadians(90), 300, 300);
        }
    }
}
