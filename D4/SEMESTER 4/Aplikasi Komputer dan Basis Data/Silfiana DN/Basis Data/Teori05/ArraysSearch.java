import java.util.Arrays;

public class ArraysSearch{
    public static void main(String[] args){
        int[] dat = {10, 8, 91, 65, 79, 23, 22, 55, 99, 72};
        int key = 23;
        
        Arrays.sort(dat);
        for(int a : dat){
            System.out.print(a + ";");
        }
        
        int index = Arrays.binarySearch(dat,key);
        
        if(index>=0){
            System.out.println("\nElemen " + key + " ditemukan di indeks " + index);
        }
        else{
            System.out.println("\nElemen " + key + " tidak ditemukan dalam array ");
        }
    }
}
