import javax.swing.JFrame;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.*;
import java.awt.geom.*;

public class UTS2 extends JFrame{
    public void paint (Graphics g){
        super.paint(g);
        Graphics2D g2d = (Graphics2D)g;
        setBackground(Color.white);
        int a=0, b=0;
        double radian=0, radian2=0, sinus=0, sinus2=0,cos=0,cos2=0,tan=0,tan2=0;
        Font f0 = new Font("Arial", Font.BOLD, 21);    
        Font f1 = new Font("Arial", Font.BOLD, 16);
        
        g.setFont(f0);
        g.setColor(Color.BLUE);
        g.setFont(f1);
        g.drawString("TEG(V)", 10, 96);
        g.drawString(" t(ms)", 450, 230);
        g.drawString("   0", 10, 240);
        g.drawString(" +5", 10, 170);
        g.drawString(" -5", 10, 280);
        g.drawString(" +10", 10, 131);
        g.drawString(" -10", 10, 331);
        g.setColor(Color.MAGENTA);
        g.drawLine(40, 100, 40, 350);
        g.drawLine(36, 106, 40, 90);
        g.drawLine(44, 106, 40, 100);
        g.drawLine(36, 344, 40, 350);
        g.drawLine(44, 344, 40, 350);
        g.drawLine(20, 225, 450, 225);
        g.drawLine(450, 220, 450, 225);
        g.drawLine(450, 230, 450, 225);
        g.drawLine(40, 124, 450, 124);
        g.drawLine(40, 325, 450, 325);   
        
        for(int i=0; i<=360; i+=1 ){
            a=i+1; b=40+a;
            radian = Math.toRadians(i);
            sinus = Math.sin(radian);
            radian2 = Math.toRadians(i+2);
            sinus2 = Math.sin(radian2);
            for(int j=0; j<=100; j++){
                g.setColor(Color.RED);
                g2d.setStroke(new BasicStroke(5));
                Line2D line=new Line2D.Double(40+(i/1),(225-(100*sinus)),40+(i/1),225-((100*sinus2)));
                g2d.draw(line);
            }                        
        }     
    }
    
    public static void main(String[] args) {
        UTS2 frame = new UTS2();
        frame.setSize(700, 400); 
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); 
        frame.setVisible(true);
    }
}
