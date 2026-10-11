import javax.swing.*;
import java.awt.*;

public class polaElips extends JPanel {
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D)g;
        setBackground(Color.white);
        
        for(int i=0;i<18;i++){//loop untuk me-rotate dan menggambar
                              //sebanyak 18 kali
            g2d.setColor(Color.red);
            g2d.rotate(-3.14/18,300,230);//melakukan rotate
            g2d.drawOval(270,30,60,400);//menggambar oval
        }
   
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("");
        polaElips draw = new polaElips ();
        frame.add(draw);
        frame.setSize(600, 600); 
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}