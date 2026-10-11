TITLE PENJUMLAHAN 2 DATA BINER 8 BIT METODE 4 ;(REGISTER BX KE KIRI DAN DL KE KANAN  
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
     MOV BX,0 ;buat BX menjadi 0 agar memudahkan
     ADD DH,0 ;menguji DH
     JZ AKH
     ADD DL,0 ;menguji DL
     JZ AKH 
     
     ;kalau masuk ke program dibawah ini, maka DH dan DL tidak bernilai 0
     ;register input diusahakan untuk tidak digunakan, agar memudahkan pengecekan
     ;maka dari itu, harus memilih register lain selain DH dan DL
     ;disini untuk DL diganti oleh register AH     
     MOV AH,DL
     MOV CL,4 ;digunakan untuk mengcounter jumlah bit nya
     SHR AH,CL ;nilai AH digeser ke kanan sebanyak CL yaitu 4 kali
     JZ L1
     
     ;kalau masuk ke program dibawah ini, maka DH dan DL tidak bernilai 0
     ;maka harus melakukan penjumlahan
L2:  ADD BL,DH
     ADC BH,0
     DEC AH
     JNZ L2
     
     MOV CL,4  ;
     SHL BX,CL ;menggeser ke kiri nilai BX sebanyak CL sebagai enam belasan
     
L1:  MOV AH,DL ;
     AND AH,0FH
     JZ AKH
     
L4:  ADD BL,DH
     ADC BH,0
     DEC AH
     JNZ L4 
     
AKH: MOV AH,4CH
     INT 21H
     
MAIN ENDP
END MAIN 
