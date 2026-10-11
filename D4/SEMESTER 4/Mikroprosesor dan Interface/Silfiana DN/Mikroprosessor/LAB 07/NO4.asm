TITLE LAB07 NO4
.MODEL SMALL
.STACK 100H

.DATA 
DAT1 DW 32 DUP(0)    

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV ES,AX
     
     MOV CX,32    ; Memuat nilai 32 ke dalam register CX (jumlah iterasi yang akan dilakukan)
     CLD          ; Mengatur arah gerakan string menjadi maju (clear direction flag)
     LEA DI,DAT1  ; Mengatur DI ke alamat offset dari variabel DAT1
     MOV AX,0     ; Memuat nilai 0 ke dalam register AX (nilai awal untuk array DAT1)

L1:               ; Label untuk awal loop
     STOSW        ; Menyimpan nilai yang ada di dalam register AX ke alamat yang ditunjuk oleh 
                  ;DI (array DAT1) dan menambahkan 2 ke DI
     ADD AX,1111H ; Menambahkan 1111H ke dalam register AX untuk menghasilkan nilai selanjutnya
     LOOP L1      ; Mengulangi loop selama CX belum mencapai 0 (CX - 1 != 0)
     
     MOV AH,4CH
     INT 21H
    
MAIN ENDP
END MAIN
