import javax.swing.*;
import java.awt.*;

public class Teori2 extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Segitiga");
        Teori2 ovalmuter = new Teori2();
        frame.add(ovalmuter);
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
            g2d.drawLine(150, 450, 450, 450);
            g2d.rotate(Math.toRadians(120), 300, 363);
        }
    }
}