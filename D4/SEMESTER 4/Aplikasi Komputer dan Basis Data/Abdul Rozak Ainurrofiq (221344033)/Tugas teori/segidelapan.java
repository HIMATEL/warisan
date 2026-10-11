import javax.swing.*;
import java.awt.*;

public class segidelapan extends JPanel {
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D)g;
        setBackground(Color.white);
        g2d.setFont(new Font("Bell MT", Font.BOLD, 24));
        g2d.setColor(Color.black);
        
        for(int i = 0 ; i < 8; i++){
            g2d.rotate (Math.toRadians(45),600,400);
        g2d.drawLine(500,642,700,642);
        }   
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("");
        segidelapan drawCircle = new segidelapan ();
        frame.add(drawCircle);
        frame.setSize(1500 , 1000);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}