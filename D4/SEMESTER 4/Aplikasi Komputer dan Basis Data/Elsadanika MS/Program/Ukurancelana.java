public class Ukurancelana{
    private String panjang;
    private String pendek;

    public static String Ukurancelana(String panjang, String pendek){
        panjang = panjang;
        return(panjang);
    }
    public static void main(String[] args){
        String celana = Ukurancelana("laki-laki","perempuan");
        System.out.println("Celana panjang: " + celana);
    }
}