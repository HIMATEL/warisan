import javax.swing.*;
import java.awt.*;
import java.awt.geom.Line2D;

public class HalfWave extends JPanel {
        public void paint (Graphics g){
        Graphics2D g2d = (Graphics2D)g;
        
        int a=0, b=0, c=0, d=0, e=0, f=0, q=0, r=0;
        double radian=0, radian2=0, sinus=0, sinus2=0;
        
        Font f1 = new Font("Arial", Font.BOLD, 21);
        Font f2 = new Font("Arial", Font.BOLD, 16);
        g2d.setFont(f1);
        g2d.setColor(Color.BLACK);
        g2d.drawString("Gelombang Half Wave dengan Frekuensi 1KHz", 30,120);
        g2d.drawString("________________________________________", 30,120);
    
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
        g2d.drawString("+10",20,200);
        g2d.drawString("-10",23,420);
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
        
        for(int i=0; i<=(720); i+=1 ){
            a=i+1; b=a+2;
            radian = Math.toRadians(i);
            sinus = Math.sin(radian);
            radian2 = Math.toRadians(i+4);
            sinus2 = Math.sin(radian2);
            g.setColor(Color.RED);
            if(i>=179&&i<=360) sinus=sinus2=Math.sin(0);
            if(i>=179&&i<=360) g.drawLine(130,304,220,304);
            if(i>=539&&i<=720) sinus=sinus2=Math.sin(0);
            if(i>=539&&i<=720) g.drawLine(310,304,400,304);
                
            for(int j=0; j<=500; j++){
                g2d.setColor(Color.RED);
                Line2D line = new Line2D.Double (40+a/2,305-
                (110*sinus),40+b/2,305-(110*sinus2));
                g2d.draw(line);
            }
        }
    }
    
        public static void main(String[] args) {
        JFrame frame = new JFrame("Gelombang Half Wave dengan Frekuensi 1KHz");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        HalfWave panel = new HalfWave();
        frame.add(panel);
        frame.setSize(600, 600);
        frame.setVisible(true);
    }
}
