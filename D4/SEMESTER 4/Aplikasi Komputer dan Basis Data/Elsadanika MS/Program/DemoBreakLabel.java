class DemoBreakLabel{
    public static void main(String[] args){
        int i=4;
        label1:{
            label2:{
                label3:{
                    System.out.println("Statemen di dalam "+"blok label ke-3");
                    if (i<5){
                        break label2;
                    }
                }
                System.out.println("Statemen di dalam blok label ke-2");
            }
            System.out.println("Statement di dalam blok label ke-1");
        }
    }
}