import javax.swing.*;
import java.awt.*;
import java.awt.geom.Line2D;

public class UTSNo2 extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("UTS NO2");
        UTSNo2 drawCircle = new UTSNo2();
        frame.add(drawCircle);
        frame.setSize(900, 800);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        setBackground(Color.white);
        Graphics2D g2d = (Graphics2D) g;
        int a=0, b=0, c=0, d=0, e=0, f=0, q=0, r=0, t=0, u=0;
        double radian=0, radian2=0, sinus=0, sinus2=0, cos=0, cos2=0;
        g.setFont(new Font("Arial", Font.BOLD, 54));
        g.setColor(Color.BLACK);
        
        Font f1 = new Font("Arial", Font.BOLD, 21);
        Font f2 = new Font("Arial", Font.BOLD, 16);
        g2d.setFont(f1);

        g.drawLine(450, 0, 450, 900);
        
        g2d.rotate(Math.toRadians(90),200,280);
        g2d.setColor(Color.BLACK);
        g2d.drawLine(40,415,430,415);
        g2d.drawLine(40,195,430,195);
        g2d.drawLine(430,415,425,410);
        g2d.drawLine(430,415,425,420);
        g2d.drawLine(430,195,425,190);
        g2d.drawLine(430,195,425,200);
        
        g2d.setColor(Color.BLACK);
        g2d.setFont(f2);
        g2d.drawString("Volt", 30,165);
        g2d.drawString("+10",10,200);
        g2d.drawString("-10",10,420);
        g2d.drawString("0",25,310);
        g2d.drawLine(40,170,40,440);
        g2d.drawLine(35,305,430,305);
        g2d.drawLine(40,170,35,175);
        g2d.drawLine(40,170,45,175);
        g2d.drawLine(40,440,35,435);
        g2d.drawLine(40,440,45,435);
        g2d.drawLine(430,305,425,300);
        g2d.drawLine(430,305,425,310);
        g2d.drawString("t", 440,310);
        
        for(int i=0; i<=(180); i+=1 ){
            a=i+1; b=a+2;
            radian = Math.toRadians(i);
            sinus = Math.sin(radian);
            radian2 = Math.toRadians(i+5);
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
            radian2 = Math.toRadians(k+5);
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
            radian2 = Math.toRadians(m+5);
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
            radian2 = Math.toRadians(o+5);
            sinus2 = Math.sin(radian2);
            g.setColor(Color.RED);
            
            for(int p=0; p<=10000; p++){
                g2d.setColor(Color.RED);
                Line2D line = new Line2D.Double (310+q/2,305-
                (110*sinus),310+r/2,305-(110*sinus2));
                g2d.draw(line);
            }
        
            for(int x=0; x<=(180); x+=1 ){
            q=o+1; u=t+2;
            radian = Math.toRadians(x);
            sinus = Math.sin(radian);
            radian2 = Math.toRadians(x+5);
            sinus2 = Math.sin(radian2);
            g.setColor(Color.RED);
            }
            
            for(int y=0; y<=10000; y++){
                g2d.setColor(Color.RED);
                Line2D line = new Line2D.Double (220+t/2,305-
                (110*sinus),220+u/2,305-(110*sinus2));
                g2d.draw(line);
            }
        }
        
        
        for (int i = 475; i < 665; i+=30) {
            g2d.setColor(Color.red);
            g2d.drawLine(i, 130, i, 370);
        }
        
        for (int i = 130; i < 250; i+=30) {
            g2d.setColor(Color.red);
            g2d.drawLine(500, i, 800, i);
        }
        
        g2d.rotate(Math.toRadians(-90),300,300);
        for(int i=0; i<=(360); i+=1 ){
            a=i+1; b=a+2;
            radian = Math.toRadians(i);
            cos = Math.cos(radian);
            radian2 = Math.toRadians(i+4);
            cos2 = Math.cos(radian2);
            g.setColor(Color.RED);
            
            for(int j=0; j<=10000; j++){
            g2d.setColor(Color.RED);
            Line2D line = new Line2D.Double (150+a,305-(110*cos),150+b,305-
            (110*cos2));
            g2d.draw(line);
            }
        }
        
        }   
    }