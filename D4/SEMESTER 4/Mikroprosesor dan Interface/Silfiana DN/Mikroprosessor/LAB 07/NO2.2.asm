TITLE LAB7 NO2 (CARA 2)
.MODEL SMALL
.STACK 100H   

.DATA
DAT1 DW 16 DUP(0B456H)
DAT2 DW 16 DUP(0)

.CODE
MAIN PROC  
     MOV AX,@DATA
     MOV DS,AX
     MOV ES,AX   
     
     MOV CX,16   ; Memuat nilai 16 ke dalam register CX (jumlah elemen yang akan dipindahkan)
     MOV DI, OFFSET DAT1 ; mengatur sumber ke DAT1
     MOV DI, OFFSET DAT2 ; mengatur destinasi ke DAT2
     
     CLD ; Set Direction Flag (arah mundur)
     
     L1:
     LODSW ; Load byte dari [SI] ke AL
     STOSW ; Store byte dari AL ke [DI], dan update SI dan DI
     LOOP L1 ; Ulangi sampai CX = 0
     
     MOV AH,4CH
     INT 21H
     
MAIN ENDP
END MAIN