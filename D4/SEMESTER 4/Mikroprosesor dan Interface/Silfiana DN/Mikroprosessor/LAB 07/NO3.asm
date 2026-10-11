TITLE LAB07 NO3
.MODEL SMALL
.STACK 100H

.DATA 
DAT1 DB 16 DUP(0)    

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV ES,AX
     
     MOV CX,16
     CLD
     LEA DI,DAT1    ; Mengatur DI ke alamat offset dari variabel DAT1
     MOV AL,0  

L1:  MOV [DI], AL   ; Menyimpan nilai AL di alamat yang ditunjuk oleh DI
     INC AL         ; Menaikkan nilai AL untuk iterasi berikutnya
     INC DI         ; Menaikkan DI untuk menunjuk ke lokasi memori berikutnya
     LOOP L1        ; Mengulangi sampai CX = 0
     
     MOV AH,4CH
     INT 21H
    
MAIN ENDP
END MAIN
