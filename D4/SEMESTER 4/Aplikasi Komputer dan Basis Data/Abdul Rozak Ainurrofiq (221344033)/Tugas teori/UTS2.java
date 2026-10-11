import javax.swing.*;
import java.awt.*;
import java.awt.geom.*;

public class UTS2 extends JFrame{
public UTS2(){
 super("UTS-Lab 2"); //Set JFrame title
 setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
 setSize(400,600);
 setVisible(true);
}

public void paint(Graphics g)
{
 super.paint(g);
 Graphics2D g2 = (Graphics2D)g;
 int a=0, b=0;
  double radian=0, radian2=0, sinus=0, sinus2=0;
  double cosinus, cosinus2;
        //bikin garis tengah
        g.setColor(Color.black);
        g.drawLine(0,300,400,300);
        //===============grafik atas===============
        //bikin grid
        g.setColor(Color.blue);
        for(int i=50;i<=350;i+=50)
        g.drawLine(i,50,i,250);
        for(int i=50;i<=250;i+=50)
        g.drawLine(50,i,350,i);
        g.setColor(Color.black);
        g2.setStroke(new BasicStroke(2));
            g.drawString("10",25,50);
            g.drawString("5",25,100);
            g.drawString("0",25,150);
            g.drawString("-5",25,200);
            g.drawString("-10",25,250);
            g.drawString("1",100,270);
            g.drawString("2",150,270);
            g.drawString("3",200,270);
            g.drawString("4",250,270);
            g.drawString("5",300,270);
            g.drawString("6",350,270);
        
        //bikin sumbu
        g.drawLine(50,40,50,250);
        g.drawLine(50,250,360,250);
        g.drawString("volt",45,40);
        //bikin panah
        g.drawLine(50,40,47,43);
        g.drawLine(50,40,53,43);
        g.drawLine(360,250,357,253);
        g.drawLine(360,250,357,247);
        //bikin grafik
        g2.setStroke(new BasicStroke(3));
        for(int i=0; i<360/1.2; i++ ){
            a=i; b=a+1;
            //default 1 perioda = 360px karena dilakukan 360 kali loop (i) ~ 7.2 grid
            //supaya default menjadi 1 perioda = 6 grid ==> 7.2/6 = 1.2
            //sampling (i) menjadi dibagi 0.72 dan 0.72 dikali radian
            radian = Math.toRadians(i);
            sinus = (Math.sin(1.2*radian));//radian dikali frekuensi
            radian2 = Math.toRadians(i+1);
            sinus2 = (Math.sin(1.2*radian2));//radian dikali frekuensi
                if(sinus<0||sinus2<0){
                    sinus=-sinus;
                    sinus2=-sinus2;
                    if(sinus>0.5||sinus2>0.5){
                    sinus=0.5;
                    sinus2=0.5;
                    }
                }
            g2.setColor(Color.red);
            Line2D line=new Line2D.Double((50+a),250-(200*sinus),(50+b),250-(200*sinus2));
            //yg disebelah a sama b titik mulai, yang disebelah sinus ampl,250 titik tengah sb-y
            g2.draw(line);
    }
        //==============grafik bawah===================
        g2.setStroke(new BasicStroke(1));
        g2.rotate(Math.toRadians(-30),200,450);
        //bikin grid
        g.setColor(Color.blue);
        for(int i=50;i<=350;i+=50)
        g.drawLine(i,350,i,550);
        for(int i=350;i<=550;i+=100)
        g.drawLine(50,i,350,i);
        g.setColor(Color.black);
        g2.setStroke(new BasicStroke(2));
        g.setColor(Color.black);
        g2.setStroke(new BasicStroke(2));
            g.drawString("10",25,350);
            g.drawString("5",25,400);
            g.drawString("0",25,450);
            g.drawString("-5",25,500);
            g.drawString("-10",25,550);
            g.drawString("1",100,570);
            g.drawString("2",150,570);
            g.drawString("3",200,570);
            g.drawString("4",250,570);
            g.drawString("5",300,570);
            g.drawString("6",350,570);
        //bikin sumbu
        g.drawLine(50,340,50,550);
        g.drawLine(50,550,360,550);
        g.drawString("volt",45,340);
        //bikin panah
        g.drawLine(50,340,47,343);
        g.drawLine(50,340,53,343);
        g.drawLine(360,550,357,553);
        g.drawLine(360,550,357,547);
        //bikin grafik
        //grafik -sinus
        for(int i=0; i<360/1.8; i++ ){
            a=i; b=a+1;
            //default 1 perioda = 360px karena dilakukan 360 kali loop (i) ~ 7.2 grid
            //supaya default menjadi 1 perioda = 4 grid ==> 7.2/4 = 1.8
            //sampling (i) menjadi dibagi 0.72 dan 0.72 dikali radian
            radian = Math.toRadians(i);
            sinus = -(Math.sin(1.8*radian));//radian dikali frekuensi
            radian2 = Math.toRadians(i+1);
            sinus2 = -(Math.sin(1.8*radian2));//radian dikali frekuensi
            g2.setColor(Color.red);
            Line2D line=new Line2D.Double((50+a),450-(100*sinus),(50+b),450-(100*sinus2));
            //yg disebelah a sama b titik mulai, yang disebelah sinus ampl,250 titik tengah sb-y
            g2.draw(line);
        }
        //grafik segitiga
        g.drawLine(250,450,300,350);
        g.drawLine(300,350,350,450);
        
}

public static void main(String[]args)
{
 UTS2 gambar = new UTS2();
}

}
