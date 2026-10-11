import javax.swing.JFrame;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.*;
import java.awt.geom.*;

public class sinFrame1 extends JFrame
{
public sinFrame1()
{
 super("Draw Sinusoidal In JFrame"); //Set JFrame title
 setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
 setSize(800,500);
 setVisible(true);
}

public void paint(Graphics g)
{
 super.paint(g);
 Graphics2D g2 = (Graphics2D)g;
 int a=0, b=0;
  double radian=0, radian2=0, sinus=0, sinus2=0;
  double cosinus, cosinus2;
        Font f0 = new Font("Arial", Font.BOLD, 21); 
        Font f1 = new Font("Arial", Font.BOLD, 16);
        g.setFont(f0);
       // g.setColor(Color.BLUE);
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
        for(int i=0; i<360; i++ ){
            a=i; b=a+3;
            //default 1 perioda = 360px karena dilakukan 360 kali loop (i)
            radian = Math.toRadians(i);
            sinus = -(Math.sin(radian));//radian dikali frekuensi
            //if(sinus<0)sinus=0;
            //if(sinus>0.7)sinus=0.7;
            radian2 = Math.toRadians(i+3);
            sinus2 = -(Math.sin(radian2));//radian dikali frekuensi
            //if(sinus2<0)sinus2=0;
            //if(sinus2>0.7)sinus2=0.7;
            //if(sinus >= 0.75) sinus = 0.75;
            //cosinus = -(Math.cos(radian));
            //if(sinus2 >= 0.75) sinus2 = 0.75;
            //cosinus2 = -(Math.cos(radian2));
            //g.setColor(Color.RED);
        for(int j=0; j<=1; j++){
            g2.setColor(Color.red);
            Line2D line=new Line2D.Double((220+a),250-(200*sinus),(220+b),250-(200*sinus2));
            //yg disebelah a sama b titik mulai, yang disebelah sinus ampl
            g2.draw(line);
            g2.setColor(Color.blue);
           //Line2D line2=new Line2D.Double((260+a*1.5),500-(200*cosinus),(260+b*1.5),500-(200*cosinus2));
            //g2.draw(line2);
        
        }
    }
}

public static void main(String[]args)
{
 sinFrame1 gambar = new sinFrame1();

}
}