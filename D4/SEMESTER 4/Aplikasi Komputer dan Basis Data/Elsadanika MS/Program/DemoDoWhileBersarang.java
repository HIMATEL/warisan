class DemoDoWhileBersarang{
    public static void main(String[] args){
        int i=1, j;
        do{
            j=1;
            do{
                System.out.print(i*j + " ");
                j++;
            }while(j<=i);
            System.out.println();
            i++;
        }while(i<=5);
    }
}