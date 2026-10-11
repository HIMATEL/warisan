#include <stdio.h>
#include <conio.h>

main(){
	int nilai;
	int array [5][5];
		
		printf("masukan elemen array 20:\n");
		for (int i=0; i<5; i++){
			for (int j=0; j<5; j++){
				printf("masukan elemen array [%d][%d]:", i,j);
				scanf("%d", &array[i][j]);
			}
			printf("\n");
		}
		
		printf("Elemen yang dimasukkan :\n");
		for (int i=0; i<5; i++){
			for (int j=0; j<5; j++){
				printf("%d", array[i][j]);
			}
			printf("\n");
	}
}
