import javax.swing.*;
import java.awt.*;

public class Teori3 extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Drawing Circle");
        Teori3 drawCircle = new Teori3();
        frame.add(drawCircle);
        frame.setSize(600, 500); // Mengatur ukuran frame menjadi 600 x 400 piksel
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        setBackground(Color.white);
        g.setFont(new Font("Arial", Font.BOLD, 54));
        g.setColor(Color.RED);
        
        g.drawLine(0, 270, 600, 270);
        g.drawLine(300, 0, 300, 600);
        
        g.setColor(Color.yellow);
        g.fillRect(0, 0, 300, 250);
        g.setColor(Color.black);
        g.drawString("YELLOW",100,125);
        
        g.setColor(Color.cyan);
        g.fillRect(300, 0, 300, 250);
        g.setColor(Color.black);
        g.drawString("CYAN",410,125);
        
        g.setColor(Color.blue);
        g.fillRect(0, 250, 300, 250);
        g.setColor(Color.black);
        g.drawString("BLUE",120,375);
        
        g.setColor(Color.pink);
        g.fillRect(300, 250, 300, 250);
        g.setColor(Color.black);
        g.drawString("PINK",410,375);

        
    }
}