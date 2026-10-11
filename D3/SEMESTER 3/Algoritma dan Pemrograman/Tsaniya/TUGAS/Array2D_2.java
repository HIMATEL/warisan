public class Array2D_2 {
	public static void main(String args[]){
		int Array1[][] = {{10, 20, 30}, {40, 50, 60}};
		System.out.println("Kelompok Array: ");

		for(int baris=0; baris<Array1.length; baris++){
			for(int kolom=0; kolom<Array1[baris].length; kolom++){
				System.out.print(Array1[baris][kolom] + "\t");
			}
			System.out.println();
		}
	}
}









