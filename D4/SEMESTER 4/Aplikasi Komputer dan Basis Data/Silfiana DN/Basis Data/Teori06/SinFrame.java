import javax.swing.*;
import java.awt.*;

public class SinFrame extends JPanel {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Drawing SinGrid");
        SinFrame drawsinGrid = new SinFrame();
        frame.add(drawsinGrid);
        frame.setSize(815, 538); // vertikal, horizontal
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }

    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        setBackground(Color.white);

        // Gambar grid
        for (int i = 25; i < 800; i += 25) {
            g2d.setColor(Color.red);
            g2d.drawLine(i, 0, i, 500);
        }
        for (int i = 25; i < 500; i += 25) {
            g2d.setColor(Color.red);
            g2d.drawLine(0, i, 800, i);
        }

        g2d.setStroke(new BasicStroke(2));
        g2d.setColor(Color.blue);
        g2d.drawLine(25, 250, 775, 250); //garis horizontal
        g2d.drawLine(400, 25, 400, 475); //garis vertikal
        
        g2d.drawLine(390, 40, 400, 25); //panah atas
        g2d.drawLine(400, 25, 410, 40);
        g2d.drawLine(25, 250, 40, 240); //panah samping kiri
        g2d.drawLine(40, 260, 25, 250);
        g2d.rotate(Math.toRadians(-180), 400, 250);
        
        g2d.drawLine(390, 40, 400, 25); //panah bawah
        g2d.drawLine(400, 25, 410, 40);
        g2d.drawLine(25, 250, 40, 240); //panah samping kanan
        g2d.drawLine(40, 260, 25, 250);
        g2d.rotate(Math.toRadians(180), 400, 250);
        
        g2d.rotate(Math.toRadians(0), 400, 250);
        
        // Gambar gelombang sinus
        g2d.setColor(Color.magenta);
        g2d.setStroke(new BasicStroke(3)); // Ketebalan garis sinus
        double freq = 2 * Math.PI / 100; // Frekuensi gelombang sinus
        int amplitude = 200; // Amplitudo gelombang sinus dalam piksel
        int prevX = 0; // Menyimpan koordinat x sebelumnya
        int prevY = (int) (250 + amplitude * Math.sin(freq * 0));
        for (int x = 1; x <= 750; x++) {
            int y = (int) (250 + amplitude * Math.sin(freq * x));
            g2d.drawLine(prevX + 25, prevY, x + 25, y);
            prevX = x; // Perbarui koordinat x sebelumnya
            prevY = y;
        }
    }
}
