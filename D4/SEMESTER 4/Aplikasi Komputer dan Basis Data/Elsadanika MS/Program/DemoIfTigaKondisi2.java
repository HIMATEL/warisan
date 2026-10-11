class DemoIfTigaKondisi2{
    public static void main(String[] args) {
char nilaiIndeks;
double nilaiUTS, nilaiUAS;
double nilaiAkhir;
nilaiUTS = 75.0;
nilaiUAS = 60.0;
nilaiAkhir = (0.4 * nilaiUTS)+(0.6 * nilaiUAS);
if (nilaiAkhir >= 80){
    nilaiIndeks = 'A';
}
else if (nilaiAkhir >= 70){
    nilaiIndeks = 'B';
}
else if (nilaiAkhir >= 50){
    nilaiIndeks = 'C';
}
else if (nilaiAkhir >= 30){
    nilaiIndeks = 'D';
}
else {
    nilaiIndeks = 'E';
}

System.out.println("Nilai Akhir \t: "+nilaiAkhir);
System.out.println("Nilai Indeks\t: "+nilaiIndeks);
    }}