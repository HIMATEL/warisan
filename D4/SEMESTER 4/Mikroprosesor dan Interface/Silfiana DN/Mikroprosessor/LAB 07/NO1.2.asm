TITLE LAB7 NO 1 (CARA 2)
.MODEL SMALL
.STACK 100H   

.DATA
DAT1 DB 16 DUP(30H)
DAT2 DB 16 DUP(0)

.CODE
MAIN PROC  
     MOV AX,@DATA
     MOV DS,AX
     MOV ES,AX   
     
     MOV CX,16
     MOV SI, OFFSET DAT1 ; mengatur sumber ke DAT1
     MOV DI, OFFSET DAT2 ; mengatur destinasi ke DAT2
     
     CLD ; Set Direction Flag (arah mundur)
     
     L1:
     LODSB ; Load byte dari [SI] ke AL
     STOSB ; Store byte dari AL ke [DI], dan update SI dan DI
     LOOP L1 ; Ulangi sampai CX = 0
     
     MOV AH,4CH
     INT 21H
     
MAIN ENDP
END MAIN     
