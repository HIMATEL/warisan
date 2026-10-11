public class faktorial{
    public static void main(String[] args){
    int x, faktorial = 1;
    for (x = 0; x<10; x++){
        if (x>1) 
        faktorial = faktorial *x;
        System.out.println(x+"!= "+faktorial);
    }
    }
}
