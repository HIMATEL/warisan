import java.util.Arrays;

public class isiArray{
    public static void main (String[] args){
        int[] dat = new int[9];
        
        Arrays.fill(dat,8);
        
        System.out.println("Array setelah diisi:");
        for (int var : dat){
        System.out.print(var + " ");
        }
    }
}
