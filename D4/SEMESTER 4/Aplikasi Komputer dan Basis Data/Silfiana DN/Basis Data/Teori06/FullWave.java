import javax.swing.*;
import java.awt.*;
import java.awt.geom.Line2D;

public class FullWave extends JPanel {
        public void paint (Graphics g){
        Graphics2D g2d = (Graphics2D)g;
        
        int a=0, b=0, c=0, d=0, e=0, f=0, q=0, r=0;
        double radian=0, radian2=0, sinus=0, sinus2=0;
        
        Font f1 = new Font("Arial", Font.BOLD, 21);
        Font f2 = new Font("Arial", Font.BOLD, 16);
        g2d.setFont(f1);
        g2d.setColor(Color.BLACK);
        g2d.drawString("Gelombang Full Wave dengan Frekuensi 1KHz", 30,120);
        g2d.drawString("_______________________________________", 30,120);
    
        g2d.setColor(Color.BLACK);
        g2d.drawLine(40,415,430,415);
        g2d.drawLine(40,195,430,195);
        g2d.drawLine(430,415,425,410);
        g2d.drawLine(430,415,425,420);
        g2d.drawLine(430,195,425,190);
        g2d.drawLine(430,195,425,200);
        
        g2d.setColor(Color.BLACK);
        g2d.setFont(f2);
        g2d.drawString("Teg(V)", 30,165);
        g2d.drawString("+10",20,203);
        g2d.drawString("-10",23,430);
        g2d.drawString("0",25,310);
        g2d.drawLine(40,170,40,440);
        g2d.drawLine(35,305,430,305);
        g2d.drawLine(40,170,35,175);
        g2d.drawLine(40,170,45,175);
        g2d.drawLine(40,440,35,435);
        g2d.drawLine(40,440,45,435);
        g2d.drawLine(430,305,425,300);
        g2d.drawLine(430,305,425,310);
        g2d.drawString("t (ms)", 440,310);
        g.drawString("0,25",125,320);
        g.drawString("0,5",215,320);
        g.drawString("0,75",305,320);
        g.drawString("0,1",395,320);
        
        for(int i=0; i<=(179); i+=1 ){
            a=i+1; b=a+2;
            radian = Math.toRadians(i);
            sinus = Math.sin(radian);
            radian2 = Math.toRadians(i+4);
            sinus2 = Math.sin(radian2);
            g.setColor(Color.RED);
            
            for(int j=0; j<=10000; j++){
                g2d.setColor(Color.RED);
                Line2D line = new Line2D.Double (40+a/2,305-
                (110*sinus),40+b/2,305-(110*sinus2));
                g2d.draw(line);
            }
        }
        
        for(int k=0; k<=(180); k+=1 ){
            c=k+1; d=c+2;
            radian = Math.toRadians(k);
            sinus = Math.sin(radian);
            radian2 = Math.toRadians(k+4);
            sinus2 = Math.sin(radian2);
            g.setColor(Color.RED);

            for(int l=0; l<=10000; l++){
                g2d.setColor(Color.RED);
                Line2D line = new Line2D.Double (130+c/2,305-
                (110*sinus),130+d/2,305-(110*sinus2));
                g2d.draw(line);
            }
        }
        
        for(int m=0; m<=(180); m+=1 ){
            e=m+1; f=e+2;
            radian = Math.toRadians(m);
            sinus = Math.sin(radian);
            radian2 = Math.toRadians(m+4);
            sinus2 = Math.sin(radian2);
            g.setColor(Color.RED);
            
            for(int n=0; n<=10000; n++){
                g2d.setColor(Color.RED);
                Line2D line = new Line2D.Double (220+e/2,305-
                (110*sinus),220+f/2,305-(110*sinus2));
                g2d.draw(line);
            }
        }
        
        for(int o=0; o<=(180); o+=1 ){
            q=o+1; r=q+2;
            radian = Math.toRadians(o);
            sinus = Math.sin(radian);
            radian2 = Math.toRadians(o+4);
            sinus2 = Math.sin(radian2);
            g.setColor(Color.RED);
            
            for(int p=0; p<=10000; p++){
                g2d.setColor(Color.RED);
                Line2D line = new Line2D.Double (310+q/2,305-
                (110*sinus),310+r/2,305-(110*sinus2));
                g2d.draw(line);
            }
        }
    }
    
        public static void main(String[] args) {
        JFrame frame = new JFrame("Gelombang Sinus dengan Frekuensi 10KHz");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        FullWave panel = new FullWave();
        frame.add(panel);
        frame.setSize(1000, 600);
        frame.setVisible(true);
    }
}
