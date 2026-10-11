//ascending order
import java.util.Arrays;
import java.util.Collections;

public class arraySortAscending{
    public static void main (String[] args){
        int[] dat = {5, 12, -8, 21, 6, -67, 98, 0, 66};
        System.out.println ("Array sebelum diurutkan:");
            for (int u : dat){
                System.out.print(u + " ");
            }
        
        Arrays.sort(dat);
        System.out.println("\nArray setelah diurutkan:");
            for (int a : dat){
                 System.out.print(a + " ");
            }
    }
}
