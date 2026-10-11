class Utama {
	public void gasPol(){
		System.out.println("mobil melaju secepat-cepatnya");
	}
	public void kecepatan(int kecepatanMax){
		System.out.println("kecepatan maksimalnya adalah: " + kecepatanMax);
	}
	public static void main(String[] args){
		Utama cepat = new Utama();
		cepat.gasPol();
		cepat.kecepatan(200);
	}	
}