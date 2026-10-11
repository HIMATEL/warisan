import javax.swing.JFrame;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.*;
import java.awt.geom.*;

public class L06_03 extends JFrame
{
public L06_03()
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
        //membuat grid
        for(int i=25;i<800;i+=25)//loop untuk membuat garis vertikal
        g.drawLine(i,0,i,500);//membuat garis vertikal
        for(int i=25;i<500;i+=25)//loop untuk membuat garis horizontal
        g.drawLine(0,i,800,i);//membuat garis horizontal
        g.setColor(Color.black);//set warna
        g2.setStroke(new BasicStroke(2));//mengubah ketebalan
        //membuat sumbu
        g.drawLine(400,50,400,450);//membuat sumbu-y atau garis vertikal
        g.drawLine(50,250,750,250);//membuat sumbu-x atau garis horizontal
        for(int i=0;i<2;i++){//membuat panah pada akhir sumbu
             g2.rotate(Math.toRadians(180),400,250);
             g.drawLine(400,50,390,60);
             g.drawLine(400,50,410,60);
             g.drawLine(50,250,60,240);
             g.drawLine(50,250,60,260);
        }       
        //membuat grafik sinus
        g2.setStroke(new BasicStroke(3));
        for(int i=0; i<2*360/1.44; i++ ){//loop untuk menggambar grafik
            a=i; b=a+1;
            //default 1 perioda = 360px karena dilakukan 360 kali loop (i) ~ 14.4 grid
            //supaya default menjadi 1 perioda = 10 grid ==> 14.4/10 = 1.44
            //sampling (i) menjadi dibagi 1.44 dan 1.44 dikali radian
            radian = Math.toRadians(i);
            sinus = (Math.sin(1.44*radian*1));//radian dikali frekuensi
            
            radian2 = Math.toRadians(i+1);
            sinus2 = (Math.sin(1.44*radian2*1));//radian dikali frekuensi
        
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
 L06_03 gambar = new L06_03();
}
}
