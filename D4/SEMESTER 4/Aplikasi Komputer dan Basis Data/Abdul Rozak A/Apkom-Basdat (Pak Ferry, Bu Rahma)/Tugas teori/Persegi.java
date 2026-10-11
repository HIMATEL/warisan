import javax.swing.*;
import java.awt.*;

public class Persegi extends JPanel {
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D)g;
        setBackground(Color.white);
        g2d.setColor(Color.blue); //set warna
        g2d.fillRect(100,100,200,200); //menggambar persegi dengan fill
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("Belajar Menggambar");
        Persegi draw = new Persegi ();
        frame.add(draw);
        frame.setSize(400,400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
