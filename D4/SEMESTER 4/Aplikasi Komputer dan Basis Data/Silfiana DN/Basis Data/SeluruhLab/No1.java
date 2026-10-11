import javax.swing.*;
import java.awt.*;

public class No1 extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Drawing Circle");
        No1 drawCircle = new No1();
        frame.add(drawCircle);
        frame.setSize(900, 900); // Mengatur ukuran frame menjadi 600 x 400 piksel
        frame.setVisible(true);
    }
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        g2d.setStroke(new BasicStroke(2));
        setBackground(Color.white);
        //tipe primitive: byte, short,int,long, float, double, boolean, dan char
        //tipe non-primitive : String, array, class
        g.setColor(Color.BLUE);
        g.drawLine(450,0,450,900); //garis vertikal
        g.drawLine(0,450,900,450); //garis horizontal
        
        g.setColor(Color.RED);
        g.drawOval(100, 100, 250, 250); //program embuat lingkaran di kuadran kiri atas 
        //(x1,y1,x2,y2) (titik awal lingkaran,jari-jari)
        g.setColor(Color.BLUE);
        Graphics2D g2d1 = (Graphics2D) g.create(); //membuat g2d yang baru
        for (int i=0; i<=3; i++){
        g2d1.rotate(Math.toRadians(120),225,656);
        g2d1.drawLine(115,720,335,720);
        }
        g2d1.dispose(); //mengahpus g2d yang telah digunakan
        
        g.setColor(Color.YELLOW);
        Graphics2D g2d2 = (Graphics2D) g.create(); //membuat g2d yang baru
        g2d2.rotate(Math.toRadians(40),725,670);
        g2d2.drawOval(625,575,100,200);
        //pada titik awal x625 dan y575 lebar 100 panjang 200
        g2d2.dispose();
        
        g.setColor(Color.GREEN);
        g2d.rotate(Math.toRadians(30),625,225);
        g.drawRect(525,125,300,200); //program untuk membuat persegi panjang 200 lebar 300
        //(x1,y1,panjang,lebar)
        
    }
}
