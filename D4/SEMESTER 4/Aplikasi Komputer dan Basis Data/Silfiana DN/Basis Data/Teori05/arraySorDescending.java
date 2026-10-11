//descending order
import java.util.Arrays;
import java.util.Collections;

public class arraySorDescending{
    public static void main (String[] args){
        Integer[] bil = {5, 12, -8, 21, 6, -67, 98, 0, 66};
        System.out.println ("Array sebelum diurutkan:");
            for (int y : bil){
                System.out.print(y + " ");
            }
        
        Arrays.sort(bil,Collections.reverseOrder());
        System.out.println("\nArray setelah diurutkan:");
            for (int z : bil){
                 System.out.print(z + " ");
            }
    }
}
