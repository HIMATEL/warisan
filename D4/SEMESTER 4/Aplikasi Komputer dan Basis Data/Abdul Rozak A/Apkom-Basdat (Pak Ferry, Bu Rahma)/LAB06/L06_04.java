import javax.swing.JFrame;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.*;
import java.awt.geom.*;

public class L06_04 extends JFrame
{
public L06_04()
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
        for(int i=0; i<2*360/1.44; i++ ){
            a=i; b=a+1;
            //default 1 perioda = 360px karena dilakukan 360 kali loop (i) ~ 14.4 grid
            //supaya default menjadi 1 perioda = 10 grid ==> 14.4/10 = 1.44
            //sampling (i) menjadi dibagi 1.44 dan 1.44 dikali radian
            radian = Math.toRadians(i);
            sinus = (Math.sin(1.44*radian*1));//radian dikali frekuensi
            if(sinus<0)sinus=-sinus;//kondisi untuk fullwave
            
            radian2 = Math.toRadians(i+1);
            sinus2 = (Math.sin(1.44*radian2*1));//radian dikali frekuensi
            if(sinus2<0)sinus2=-sinus2;//kondisi untuk fullwave
            
        for(int j=0; j<=1; j++){
            g2.setColor(Color.red);
            Line2D line=new Line2D.Double((150+a),250-(125*sinus),(150+b),250-(125*sinus2));
            //yg disebelah a sama b titik mulai, yang disebelah sinus ampl,250 titik tengah sb-y
            g2.draw(line);
        }
    }
}

public static void main(String[]args)
{
 L06_04 gambar = new L06_04();
}
}
