TITLE L04_04       ;penjumlahan oktal
.MODEL SMALL
.STACK 100H
.DATA
DAT DW 0,0,0,0,0,0,0,0,0    ;100, 85, 75, 60, 50, 35, 25, 10, 0
                            ;  -15  -10 -15 -10
.CODE
MAIN PROC  
     MOV AX,@DATA
     MOV DS,AX 
     
     MOV DI,0
     MOV SI,0           
     MOV DX,100H
LUUP:
     MOV [DAT+SI],DX
     
     SUB DX,15H
     MOV AL,DL
     SUB AL,0
     DAS 
     MOV DL,AL  ; DX sudah dikurang 15
     
     INC SI
     INC SI
     MOV [DAT+SI],DX 
     
     SUB DX,10H
     MOV AL,DL
     SUB AL,0
     DAS
     MOV DL,AL ; DX sudah dikurang 10
     
     INC SI
     INC SI
     
     INC DI
     CMP DI,4
     JNE LUUP 
     
     MOV SI,0
     MOV CX,0
LUP:
     ADD CX,[DAT+SI]
     
     MOV AL,CL
     ADD AL,0
     DAA
     MOV CL,AL
     ADC CH,0
     
     MOV AL,CH
     ADD AL,0
     DAA
     MOV CH,AL
     
     INC SI
     INC SI
     CMP SI,12H
     JB  LUP
 
     MOV AH,4CH
     INT 21h     
MAIN ENDP                 
END MAIN                  