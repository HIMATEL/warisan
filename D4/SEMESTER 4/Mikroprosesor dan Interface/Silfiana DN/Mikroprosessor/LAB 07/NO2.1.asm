TITLE LAB7 NO 2 (CARA 1)
.MODEL SMALL
.STACK 100H   

.DATA
DAT1 DW 16 DUP(0A123H)
DAT2 DW 16 DUP(0)

.CODE
MAIN PROC  
     MOV AX,@DATA
     MOV DS,AX
     MOV ES,AX   
     
     MOV CX,16          ; Memuat nilai 16 ke dalam register CX (jumlah elemen yang akan dipindahkan)

     STD                ; Mengatur arah gerakan string menjadi mundur
     MOV DI,OFFSET DAT1 ; Mengatur destinasi awal (DI) ke alamat offset variabel DAT1
     MOV DI,OFFSET DAT2 ; Mengatur destinasi awal (DI) lagi ke alamat offset variabel DAT2,
                        ; yang menggantikan alamat DI yang telah ditetapkan sebelumnya

     CLD                ; Mengatur arah gerakan string menjadi maju
     REP MOVSW          ; Mengulang instruksi MOVSW sebanyak CX kali, 
                        ; yang memindahkan word dari DS:SI ke ES:DI sebanyak 16 kali
     
     MOV AH,4CH
     INT 21H
     
MAIN ENDP
END MAIN
