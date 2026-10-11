import javax.swing.*;
import java.awt.*;
import java.awt.geom.Line2D;

public class SinusCosinus extends JPanel {
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        int a=0, b=0;
        double radian=0, radian2=0, sin=0, cos=0;
        Font f1 = new Font("Arial", Font.BOLD, 21);
        Font f2 = new Font("Arial", Font.BOLD, 16);
        g2d.setFont(f1);
        g2d.setColor(Color.BLACK);
        g2d.drawString("Gelombang Sinus dan Cosinus dengan Frekuensi 1KHz", 30, 120);
        g2d.drawString("_________________________________________________", 30, 130);
        
        g2d.setColor(Color.BLACK);
        g2d.drawLine(150, 415, 540, 415);
        g2d.drawLine(150, 194, 540, 194);
        g2d.drawLine(540, 415, 535, 410);
        g2d.drawLine(540, 415, 535, 420);
        g2d.drawLine(540, 195, 535, 190);
        g2d.drawLine(540, 195, 535, 200);
        
        g2d.setColor(Color.BLACK);
        g2d.setFont(f2);
        g2d.drawString("TEG(V)", 140, 165);
        g2d.drawString("+10", 120, 200);
        g2d.drawString("-10", 125, 420);
        g2d.drawString("0", 130, 310);
        g2d.drawLine(150, 170, 150, 440);
        g2d.drawLine(145, 305, 540, 305);
        g2d.drawLine(150, 170, 145, 175);
        g2d.drawLine(150, 170, 155, 175);
        g2d.drawLine(150, 440, 145, 435);
        g2d.drawLine(150, 440, 155, 435);
        g2d.drawLine(540, 305, 535, 300);
        g2d.drawLine(540, 305, 535, 310);
        g2d.drawString("t (ms)", 550, 310);
        g.drawString("1", 325, 320);
        g.drawString("2", 507, 320);

        for(int i=0; i<=(360); i+=1 ){
            a=i+1; b=a+2;
            radian = Math.toRadians(i);
            sin = Math.sin(radian);
            cos = Math.cos(radian);
            g.setColor(Color.RED);
            
            for(int j=0; j<=10000; j++){
                g2d.setColor(Color.RED);
                Line2D lineSin = new Line2D.Double(150 + a, 
                305 - (110 * sin), 150 + b,305 -(110 * 
                Math.sin(Math.toRadians(i + 4))));
                Line2D lineCos = new Line2D.Double(150 + a, 
                305 - (110 * cos), 150 + b, 305 - (110 * 
                Math.cos(Math.toRadians(i + 4))));
                g2d.draw(lineSin);
                g2d.draw(lineCos);
            }
        }
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("Gelombang Sinus dan Cosinus dengan Frekuensi 10KHz");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        SinusCosinus panel = new SinusCosinus();
        frame.add(panel);
        frame.setSize(800, 600);
        frame.setVisible(true);
    }
}
