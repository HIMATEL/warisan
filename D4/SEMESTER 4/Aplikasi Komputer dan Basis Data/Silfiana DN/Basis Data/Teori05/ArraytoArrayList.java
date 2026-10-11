import java.util.ArrayList;
import java.util.Collections;

public class ArraytoArrayList{
    public static void main (String[] args){
        ArrayList<Float> list = new ArrayList<>();
        list.add(5.5f);
        list.add(3.3f);
        list.add(8.8f);
        list.add(2.2f);
        list.add(10.10f);
        
        float min = Collections.min(list);
        System.out.println("Nilai maksimum:" + min);
        
        float max = Collections.max(list);
        System.out.println("Nilai maksimum:" + max);
    }
}
