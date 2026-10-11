import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Bandul03 extends JPanel implements ActionListener {
    private double angle = 0; // Sudut awal bandul
    private double angle1 = 0;
    private double angle2 = 0;
    private double angularVelocity = 0.05; // Kecepatan sudut
    private double velo = 0.02;
    private int length = 300; // Panjang tali bandul

    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        int x = getWidth() / 2;
        int y = getHeight() / 2;
        // Mengatur transformasi rotasi
        Graphics2D g2d = (Graphics2D) g;
        g2d.translate(x, y); // Memindahkan pusat rotasi ke titik tengah layar        
        g2d.setColor(Color.blue);        
        g2d.setStroke(new BasicStroke(3));       
        g2d.rotate(-angle1/2);
        g2d.drawLine(-278,0,278,0);
          for(int u=0; u<5 ; u++)
        {   g2d.rotate(Math.toRadians(30),0,0);
            g2d.drawLine(-278,0,278,0);
        }
        //g2d.drawLine(0,-278,0,278);
        g2d.rotate(Math.toRadians(-45*3),0,0);
        g2d.rotate(angle1/2);
        g2d.setColor(Color.blue);
        g2d.fillOval(-20,-20, 40, 40);
        g2d.drawOval(-322,-322,644,644);
        g2d.drawOval(-278,-278,556,556);
        g2d.rotate(angle); // Rotasi sudut
        // Menggambar bandul
        g2d.setColor(Color.green);        
        //g2d.fillOval(-10,-10, 20, 20);
        g2d.setStroke(new BasicStroke(5));
        g2d.drawLine(0, 0, 0, length); // Gambar tali bandul
        g2d.drawOval(-22, length -22, 44, 44);
        g2d.setColor(Color.red);
        g2d.fillOval(-20, length - 20, 40, 40); // Gambar bola di ujung bandul
        g2d.rotate(Math.toRadians(180),0,0);
        g2d.setColor(Color.green);
        g2d.drawLine(0, 0, 0, length); // Gambar tali bandul
        g2d.drawOval(-22, length -22, 44, 44);
        g2d.setColor(Color.red);
        g2d.fillOval(-20, length - 20, 40, 40); // Gambar bola di ujung bandul
        g2d.drawLine(0, 0, 0, length); // Gambar tali bandul
        g2d.drawOval(-22, length -22, 44, 44);
        g2d.setColor(Color.red);
        g2d.fillOval(-20, length - 20, 40, 40); // Gambar bola di ujung bandul
        g2d.rotate(Math.toRadians(180),0,0);
        g2d.setColor(Color.green);
        g2d.drawLine(0, 0, 0, length); // Gambar tali bandul
        g2d.drawOval(-22, length -22, 44, 44);
        g2d.setColor(Color.red);
        g2d.fillOval(-20, length - 20, 40, 40); // Gambar bola di ujung bandul
        g2d.rotate(Math.toRadians(-180),0,0);
        g2d.setColor(Color.green);
        g2d.drawLine(0, 0, 0, length); // Gambar tali bandul
        g2d.drawOval(-22, length -22, 44, 44);
        g2d.setColor(Color.red);
        g2d.fillOval(-20, length - 20, 40, 40); // Gambar bola di ujung bandul
        g2d.rotate(Math.toRadians(90),0,0);
        g2d.setColor(Color.green);
        g2d.drawLine(0, 0, 0, length); // Gambar tali bandul
        //g2d.setColor(Color.blue);
        g2d.drawOval(-22, length -22, 44, 44);
        g2d.setColor(Color.red);
        g2d.fillOval(-20, length - 20, 40, 40); // Gambar bola di ujung bandul
        g2d.rotate(Math.toRadians(-180),0,0);
        g2d.setColor(Color.green);
        g2d.drawLine(0, 0, 0, length); // Gambar tali bandul
        g2d.drawOval(-22, length -22, 44, 44);
        g2d.setColor(Color.red);
        g2d.fillOval(-20, length - 20, 40, 40); // Gambar bola di ujung bandul
        g2d.rotate(Math.toRadians(180),0,0);
        g2d.setColor(Color.green);
        g2d.drawLine(0, 0, 0, length); // Gambar tali bandul
        g2d.drawOval(-22, length -22, 44, 44);
        g2d.setColor(Color.red);
        g2d.fillOval(-20, length - 20, 40, 40); // Gambar bola di ujung bandul
        g2d.rotate(Math.toRadians(-90),0,0);
        g2d.rotate(Math.toRadians(-180),0,0);
        // Mengembalikan transformasi ke kondisi semula
        g2d.rotate(-angle);
        g2d.rotate(angle2);
        g2d.setStroke(new BasicStroke(3));
        g2d.setColor(Color.yellow);
        g2d.fillOval(-19,-361,38,38);
        g2d.setColor(Color.blue);
        g2d.drawOval(-20,-362,40,40);       
        g2d.setColor(Color.cyan);
        g2d.fillOval(-19,325,39,39);
        g2d.setColor(Color.blue);
        g2d.drawOval(-20,324,40,40);     
        g2d.rotate(Math.toRadians(90),0,0);
        g2d.setStroke(new BasicStroke(3));
        g2d.setColor(Color.green);
        g2d.fillOval(-19,-361,38,38);
        g2d.setColor(Color.blue);
        g2d.drawOval(-20,-362,40,40);       
        g2d.setColor(Color.pink);
        g2d.fillOval(-19,325,39,39);
        g2d.setColor(Color.blue);
        g2d.drawOval(-20,324,40,40);  
        g2d.rotate(Math.toRadians(-90),0,0);
        g2d.rotate(-angle2);
        g2d.translate(-x, -y);
    }

    public void actionPerformed(ActionEvent e) {
        // Mengupdate sudut bandul untuk animasi
        if(angle>=0.8 || angle<=-1.6) angularVelocity *=-1;
        angle += angularVelocity;
        angle1 += velo;
        angle2 += velo/3.6;
        repaint();
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("Animasi Bandul");
        Bandul03 bandul = new Bandul03();
        frame.add(bandul);
        frame.setSize(800, 800);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);

        Timer timer = new Timer(10, bandul); // Timer untuk mengupdate animasi setiap 20 milidetik
        timer.start();
    }
}