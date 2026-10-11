import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class UTS_NO_2 {

    public static void main(String[] args)throws IOException {
    int[][]angka = new int[3][3];
    BufferedReader reader =new BufferedReader(new InputStreamReader(System.in));
    
    System.out.println("Masukkan 9 angka matriks:");
    
    for(int i=0;i<3;i++){
    	for(int j=0;j<3;j++){
    		System.out.print("Angka [" +i+ "]["+j+"]: ");
    		angka[i][j]=Integer.parseInt(reader.readLine());
    	}
    }
    reader.close();
    
    System.out.println("\n A :");
    for(int i=0; i<3;i++){
    	for(int j=0; j<3;j++){
    		System.out.print(angka[i][j]+"\t");
    	}
    	System.out.println();
    }
    System.out.println("\n B :");
    for(int i=0; i<3;i++){
    	for(int j=0; j<3;j++){
    		System.out.print(angka[i][j]* 10 + "\t");
    	}
    	System.out.println();
    }}}
    
    