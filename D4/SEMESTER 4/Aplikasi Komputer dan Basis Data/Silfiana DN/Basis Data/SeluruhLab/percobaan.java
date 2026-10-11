import javax.swing.JFrame;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.*;
import java.awt.geom.*;
public class percobaan extends JFrame{
    public percobaan(){
     super("Draw Sinusoidal In JFrame"); //judul pada pemberitahuan jendela output
     setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //pemberhentian jika pengguna menutup layar
     setSize(800,500); //besar pixel dengan lebar800 dan tinggi500 
     setVisible(true); //menampilkan frame dilayar
  }
    public void paint(Graphics g){
     super.paint(g);
     Graphics2D g2d = (Graphics2D)g;
           g2d.translate(25,50); //tampilan didorong dengan x=horizontal=25pixel dan y=vertikal=50pixel
           g2d.setStroke(new BasicStroke(2)); //mengatur ketebalan garis 2
           g.setColor(Color.magenta); //penggunaan warna magenta untuk program dibawah
        for(int i=0;i<=800;i+=25) //pengaturan grid untuk arah horizontal  dari 0 hingga 800 dengan penambahan i 25
        g.drawLine(i,0,i,500); //dengan garis titik awal x1=i y1=0 dan titik akhir x2=i y2=500
        
        for(int i=0;i<=500;i+=25) //pengaturan grid untuk arah vertikal dari 0 hingga 500 dengan penambahan i 25
        g.drawLine(0,i,800,i); //dengan garis titik awal x1=0 y1=i dan titik akhir x2=800 y2=i
        //program diatas untuk membuat grid
    }
     public static void main(String[]args)
    {
     percobaan gambar = new percobaan();
    }
}