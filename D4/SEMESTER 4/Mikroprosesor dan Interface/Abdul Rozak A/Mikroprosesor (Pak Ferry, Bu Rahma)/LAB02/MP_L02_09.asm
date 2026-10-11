TITLE LAB02 NO9
.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
   
     MOV DX,0
     MOV CX,0
     MOV SI,0
     
LUP: ADD DX,567EH
     ADC CX,0CCH
     INC SI
     CMP SI,40H
     JNZ LUP     ;penjumlahan diulang sebanyak 40H kali
     
     MOV AH,4CH
     INT 21H
    
MAIN ENDP
END MAIN