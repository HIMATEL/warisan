import javax.swing.*;
import java.awt.*;

public class segitiga2 extends JPanel {
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D)g;
        setBackground(Color.white);
        g2d.setColor(Color.black);
        g2d.drawLine(150,330,450,330);//menggambar garis pertama
        
        g2d.rotate(Math.toRadians(-60),150,330);//melakukan rotate
        g2d.drawLine(150,330,450,330);//menggambar garis kedua
        
        g2d.rotate(Math.toRadians(-60),450,330);//melakukan rotate
        g2d.drawLine(150,330,450,330);//menggambar garis ketiga
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("Belajar Menggambar");
        segitiga2 draw = new segitiga2 ();
        frame.add(draw);
        frame.setSize(600 , 400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}