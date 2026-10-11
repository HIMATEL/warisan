import javax.swing.JFrame;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.*;
import java.awt.geom.*;

public class L06_09 extends JFrame{
    public L06_09(){
     super("Draw Sinusoidal In JFrame"); //Set JFrame title
     setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
     setSize(800,500);
     setVisible(true);
    }

public void paint(Graphics g){
     super.paint(g);
     Graphics2D g2 = (Graphics2D)g;
     int a=0, b=0;
      double radian=0, radian2=0, sinus=0, sinus2=0;
      double cosinus, cosinus2;
        g.setColor(Color.blue);
        for(int i=25;i<800;i+=25)
        g.drawLine(i,0,i,500);
        for(int i=25;i<500;i+=25)
        g.drawLine(0,i,800,i);
        g.setColor(Color.black);
        g2.setStroke(new BasicStroke(2));
        g.drawLine(400,50,400,450);
        g.drawLine(50,250,750,250);
        for(int i=0;i<2;i++){
             g2.rotate(Math.toRadians(180),400,250);
             g.drawLine(400,50,390,60);
             g.drawLine(400,50,410,60);
             g.drawLine(50,250,60,240);
             g.drawLine(50,250,60,260);
        }       
        //=====================
        g2.setStroke(new BasicStroke(3));
        g.setColor(Color.red);
        int j = -125;
        for(int i=150;i<=650;i++){
            radian = Math.toRadians(30);
            double x = j*(Math.sin(radian));
            Line2D line=new Line2D.Double(i,250-x,(i+1),250-x);
            g2.draw(line);
             j = j+1;
            if(j==125){
             Line2D garis=new Line2D.Double(i,250-x,i,250+x);
                g2.draw(garis);
                j=-125;
            }
        }

    }
public static void main(String[]args)
{
 L06_09 gambar = new L06_09();
}
}
