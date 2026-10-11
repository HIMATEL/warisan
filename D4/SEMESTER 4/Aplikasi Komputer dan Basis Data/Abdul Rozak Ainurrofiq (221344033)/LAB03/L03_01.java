import java.util.Scanner;

public class L03_01{
    public static void main(String[]args){
        Scanner sc = new Scanner(System.in);
        int data[] = new int[10];
        for(int i=0;i<7;i++){
            System.out.print("data "+(i+1)+": ");
            data[i]=sc.nextInt();
        }
        System.out.println("data:");
        for(int i=0;i<7;i++){
            if(i<6)System.out.print(data[i]+", ");
            else System.out.print(data[i]+".");
        }
    }
}