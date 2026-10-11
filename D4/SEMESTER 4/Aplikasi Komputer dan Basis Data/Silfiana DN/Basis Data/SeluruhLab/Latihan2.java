import javax.swing.JFrame;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.*;
import java.awt.geom.*;
public class Latihan2 extends JFrame{
    public Latihan2(){
     super("Draw Sinusoidal In JFrame"); //judul pada pemberitahuan jendela output
     setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //pemberhentian jika pengguna menutup layar
     setSize(800,500); //besar pixel dengan lebar800 dan tinggi500 
     setVisible(true); //menampilkan frame dilayar
  }
    public void paint(Graphics g){
     super.paint(g);
     Graphics2D g2d = (Graphics2D)g;
     int a=0, b=0;
      double radian=0, radian2=0, sinus=0, sinus2=0;
      double cosinus, cosinus2;
            Font f0 = new Font("Arial", Font.BOLD, 21); 
            Font f1 = new Font("Arial", Font.BOLD, 16);
            g.setFont(f0);
           
           g2d.translate(25,50); //tampilan didorong dengan x=horizontal=25pixel dan y=vertikal=50pixel
           g2d.setStroke(new BasicStroke(2)); //mengatur ketebalan garis 2
           g2d.setColor(Color.magenta); //penggunaan warna magenta untuk program dibawah
        for(int i=0;i<=800;i+=25) //pengaturan grid untuk arah horizontal  dari 0 hingga 800 dengan penambahan i 25
        g.drawLine(i,0,i,500); //dengan garis titik awal x1=i y1=0 dan titik akhir x2=i y2=500
        
        for(int i=0;i<=500;i+=25) //pengaturan grid untuk arah vertikal dari 0 hingga 500 dengan penambahan i 25
        g.drawLine(0,i,800,i); //dengan garis titik awal x1=0 y1=i dan titik akhir x2=800 y2=i
        //program diatas untuk membuat grid
        g.setColor(Color.BLUE); //penggunaan warna biru untuk program dibawah
        g.drawLine(25,250,775,250); //garis sumbu utama horizontal
        g.drawLine(400,25,400,475); //garis sumbu utama vertikal
        
        for (int i=0; i<2; i++){ //menggunakan for untuk mempermudah pengguna
        g.setColor(Color.BLUE); //penggunaan warna biru untuk program dibawah
        //dibuat lebar tanda panah 10pixel dan tinggi 7 pixel 
        g.drawLine(395,32,400,25);
        g.drawLine(405,32,400,25);
        //program untuk membuat tanda panah bagian atas
        g.drawLine(32,245,25,250);
        g.drawLine(32,255,25,250);
        //program untuk membuat tanda panah di bagian kiri
        g2d.rotate(Math.toRadians(180), 400, 250);
        //penggunaan rotate untuk membuat tanda panah di bagian kanan dan bawah
        }
     //program dibawah untuk membuat sinyal sinus//
        for(int i=0; i<=360*3; i+=1 ){ //dengan *3 maka akan muncul 3 periode
            a=i; b=a+1; //digununakan untuk menggambar garis
            
            radian = Math.toRadians(i); //mengkonversi dari i menjadi radian
            sinus = (Math.sin(radian)); //mengkonversi dari radian menjadi sin
            if(sinus>0.5)sinus=0.5; //jika sinus <0 maka sinyal tersebut akan bernilai 0
            cosinus = -(Math.cos(radian)); //mengkonversi dari radian menjadi cos

            radian2 = Math.toRadians(i+2);//mengkonversi dari i+2 menjadi radian 
            sinus2 = (Math.sin(radian2));//mengkonversi dari i+2 menjadi sin
            if(sinus2>0.5)sinus2=0.5; //jika sinus2 <0 maka sinyal tersebut akan bernilai 0
            cosinus2 = -(Math.cos(radian2));//mengkonversi dari i+2 menjadi cos 
        
            
            g.setColor(Color.RED); //penggunaan warna merah untuk program dibawah
            for(int j=0; j<=30; j++){
                g2d.setColor(Color.red);
                Line2D line=new Line2D.Double((50+a*1/2),250-(125*sinus),(50+b*1/2),250-(125*sinus2));
                //((p.gel),posisi_ver_gel,(Amplitude) atau (x1,y1,x2,y2)                    
                g2d.draw(line); //menggambar garis dengan metode draw
            }
        }
  }
    public static void main(String[]args)
    {
     Latihan2 gambar = new Latihan2();
    }
}
