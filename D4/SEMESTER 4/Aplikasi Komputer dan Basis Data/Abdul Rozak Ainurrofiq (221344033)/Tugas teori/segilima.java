import javax.swing.*;
import java.awt.*;

public class segilima extends JPanel {
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D)g;
        setBackground(Color.white);
        g2d.setColor(Color.black);
        
        for(int i = 0 ; i < 5; i++){//loop untuk menggambar 5x garis
            g2d.rotate(Math.toRadians(72),600,400);//rotate
        g2d.drawLine(450,607,750,607);//menggambar garis
        } 
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("");
        segilima draw = new segilima ();
        frame.add(draw);
        frame.setSize(1200 , 600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}