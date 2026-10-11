import javax.swing.*;
import java.awt.*;

public class gambarElips extends JPanel {
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;

        // Mengatur warna latar belakang menjadi putih
        setBackground(Color.WHITE);
        
        // Mengatur koordinat untuk menggambar elips
        int x = 100;
        int y = 150;
        int width = 400;
        int height = 100;

        // Menggambar elips
        g2d.setColor(Color.RED);
        //g2d.fillOval(x, y, width, height);

        // Mengatur rotasi sebesar 60 derajat
        g2d.rotate(Math.toRadians(-60), x + width / 2.0, y + height / 2.0);

        // Menggambar elips yang sudah diputar
        g2d.fillOval(x, y, width, height);
    }
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("Drawing Ellipse with Rotation");
        gambarElips drawEllipse = new gambarElips();
        frame.add(drawEllipse);
        frame.setSize(600, 600); // Mengatur ukuran frame menjadi 600 x 400 piksel
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
