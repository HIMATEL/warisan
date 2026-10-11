#include <stdio.h>
 
int main()
{
  int bulan;
  printf("*Program Bahasa C Menentukan Nama Bulan* \n");
  printf("\n");
 
  printf("angka bulan (1-12): ");
  scanf("%d",&bulan);
 
  switch (bulan) {
   case 1:
     printf("Januari");
     break;
   case 2:
     printf("Februari");
     break;
   case 3:
     printf("Maret");
     break;
   case 4:
     printf("April");
     break;
   case 5:
     printf("Mei");
     break;
   case 6:
     printf("Juni");
     break;
   case 7:
     printf("Juli");
     break;
   case 8:
     printf("Agustus");
     break;
   case 9:
     printf("September");
     break;
   case 10:
     printf("Oktober");
     break;
   case 11:
     printf("November");
     break;
   case 12:
     printf("Desember");
     break;
   default :
     printf("Pilihan tidak tersedia");
  }
}