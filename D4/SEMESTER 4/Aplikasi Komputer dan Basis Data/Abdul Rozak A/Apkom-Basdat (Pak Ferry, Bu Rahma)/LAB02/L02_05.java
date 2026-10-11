import java.util.Scanner;

public class L02_05{
    public static void main(String[]args){
       Scanner data = new Scanner(System.in);
       
       System.out.print("Data 1:");
       int D1 = data.nextInt();
       
       System.out.print("Data 2:");
       int D2 = data.nextInt();
       
       if(D1==D2)
       System.out.print("nilai kedua data sama");
       if(D1<D2)
       System.out.print("Data terkecil: "+D1);
       if(D1>D2)
       System.out.print("Data terkecil: "+D2);
       
    }
}