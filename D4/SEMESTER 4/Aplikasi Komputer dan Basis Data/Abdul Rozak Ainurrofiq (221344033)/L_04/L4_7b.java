import java.util.Scanner;

public class L4_7b{
    public static void main (String[] args){
        Scanner input = new Scanner(System.in);        
        System.out.print("Masukkan angka 0-9 : ");
        int faktor = input.nextInt();
        System.out.println(faktor+"! = " + faktorial(faktor));
        
        input.close();
    }
    
    public static int faktorial(int dat){
        int f = 1 ;
        if (dat<2)return 1;
        else 
        return dat*faktorial(dat-1);
    }
}
