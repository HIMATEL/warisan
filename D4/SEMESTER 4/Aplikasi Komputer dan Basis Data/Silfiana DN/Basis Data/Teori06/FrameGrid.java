import javax.swing.*;
import java.awt.*;
public class FrameGrid extends JPanel{
    public static void main(String[] args) {
        JFrame frame = new JFrame("Drawing LineGrid");
        FrameGrid drawLineGrid = new FrameGrid();
        frame.add(drawLineGrid);
        frame.setSize(815, 538); //vertikal, horizontal
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
    
    protected void paintComponent(Graphics g){
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        setBackground(Color.white);
        
        for (int i = 25; i < 800; i+=25) {
            g2d.setColor(Color.red);
            g2d.drawLine(i, 0, i, 500);
        }
        
        for (int i = 25; i < 500; i+=25) {
            g2d.setColor(Color.red);
            g2d.drawLine(0, i, 800, i);
        }
        g2d.setStroke(new BasicStroke(2));
        g2d.setColor(Color.blue);
        g2d.drawLine(25, 250, 775, 250); //garis horizontal
        g2d.drawLine(400, 25, 400, 475); //garis vertikal
        
        g2d.drawLine(390, 40, 400, 25); //panah atas
        g2d.drawLine(400, 25, 410, 40);
        g2d.drawLine(25, 250, 40, 240); //panah samping kiri
        g2d.drawLine(40, 260, 25, 250);
        g2d.rotate(Math.toRadians(180), 400, 250);
        
        g2d.drawLine(390, 40, 400, 25); //panah bawah
        g2d.drawLine(400, 25, 410, 40);
        g2d.drawLine(25, 250, 40, 240); //panah samping kanan
        g2d.drawLine(40, 260, 25, 250);
        g2d.rotate(Math.toRadians(-180), 400, 250);
    }
}
