public class Arraylength {
	public static void main(String args[]){
		int Array1[][] = {{1, 3, 5, 7, 9}, {11, 17, 19}, {21, 23, 27, 29}};
		System.out.println("Kelompok Array: ");

		for(int baris=0; baris<Array1.length; baris++){
			for(int kolom=0; kolom<Array1[baris].length; kolom++){
				System.out.print(Array1[baris][kolom] + "\t");
			}
			System.out.println();
		}
	}
}
