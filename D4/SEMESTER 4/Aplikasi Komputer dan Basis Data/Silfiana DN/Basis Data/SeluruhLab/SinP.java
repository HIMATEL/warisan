import javax.swing.JFrame;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.*;
import java.awt.geom.*;

public class SinP extends JFrame{
    public void paint (Graphics g){
        super.paint(g); // Membersihkan gambar lama

        Graphics2D g2 = (Graphics2D)g;
        int a=0, b=0;
        double radian=0, radian2=0, sinus=0, sinus2=0, cosinus=0, cosinus2=0; // Mengubah variabel cos menjadi cosinus
        Font f0 = new Font("Arial", Font.BOLD, 21);    
        Font f1 = new Font("Arial", Font.BOLD, 16);
        g.setFont(f0);
        g.setColor(Color.BLUE);
        g.drawString("Sinusoidal dengan frekuensi 1 KHz:", 10,60);
        g.drawString("", 10,63);
        
        g.setFont(f1);
        g.drawString("TEG(V)", 10, 96);
        g.drawString(" t(ms)", 658, 230);
        g.drawString(" 2", 222, 240);
        g.drawString("4", 400, 240);
        g.drawString("6", 582, 240);
        g.drawString("   0", 10, 240);
        g.drawString(" +10", 10, 131);
        g.drawString(" -10", 10, 331);
        g.setColor(Color.MAGENTA);
        g.drawLine(40, 100, 40, 350);
        g.drawLine(36, 106, 40, 100);
        g.drawLine(44, 106, 40, 100);
        g.drawLine(36, 344, 40, 350);
        g.drawLine(44, 344, 40, 350);
        g.drawLine(20, 225, 650, 225);
        g.drawLine(645, 220, 650, 225);
        g.drawLine(645, 230, 650, 225);
        g.drawLine(40, 124, 650, 124);
        g.drawLine(40, 325, 650, 325);    
        for(int i=0; i<=360*2; i+=1 ){
            a=i; b=a+3;
            radian = Math.toRadians(i);
            sinus = (Math.sin(radian));
            if(sinus<0)sinus=0;
            // if(sinus>0.7)sinus=0.7;
            // if(sinus >= 0.75) sinus = 0.75;
            cosinus = -(Math.cos(radian));
            if(cosinus>0.5) cosinus=.5;
            radian2 = Math.toRadians(i+4);
            sinus2 = (Math.sin(radian2));
            if(sinus2<0)sinus2=0;
            // if(sinus2>0.7)sinus2=0.7;
            // if(sinus2 >= 0.75) sinus2 = 0.75;
            cosinus2 = -(Math.cos(radian2));
            if(cosinus2>0.5) cosinus2=.5;
            g.setColor(Color.RED);
            for(int j=0; j<=30; j++){
                g2.setColor(Color.red);
                Line2D line=new Line2D.Double(40+(i/1),(225-(100*sinus)),40+(i/1),225-((100*sinus2)));
                g2.draw(line);
                g2.setColor(Color.blue);
                Line2D line2=new Line2D.Double((40+a*1),225-(100*cosinus),(40+b*1),225-(100*cosinus2));
                g2.draw(line2);
            }
        }
    }
    
    public static void main(String[] args) {
        SinP frame = new SinP();
        frame.setSize(700, 400); // set the size of the frame
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // set default close operation
        frame.setVisible(true); // make the frame visible
    }
}
