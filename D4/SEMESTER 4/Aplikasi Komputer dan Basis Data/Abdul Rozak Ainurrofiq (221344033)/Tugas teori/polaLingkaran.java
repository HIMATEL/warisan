import javax.swing.*;
import java.awt.*;

public class polaLingkaran extends JPanel {
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D)g;
        setBackground(Color.white);
        
        for(int i=0;i<60;i++){//loop untuk me-rotate dan mencetak sebanyak 60x
           g2d.setColor(Color.blue);
           g2d.rotate(Math.toRadians(6),300,300);
           g2d.drawOval(300,150,100,100);
    }
   
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("Menggambar");
        polaLingkaran draw = new polaLingkaran ();
        frame.add(draw);
        frame.setSize(600,600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}