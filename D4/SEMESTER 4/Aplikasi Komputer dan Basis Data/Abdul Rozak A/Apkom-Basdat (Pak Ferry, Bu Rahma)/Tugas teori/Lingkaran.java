import javax.swing.*;
import java.awt.*;

public class Lingkaran extends JPanel {
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D)g;
        setBackground(Color.white);
        g2d.setColor(Color.blue); //set warna
        g2d.fillOval(100,100,200,200); //menggambar oval dengan fill
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("Belajar Menggambar");
        Lingkaran draw = new Lingkaran ();
        frame.add(draw);
        frame.setSize(400,400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
