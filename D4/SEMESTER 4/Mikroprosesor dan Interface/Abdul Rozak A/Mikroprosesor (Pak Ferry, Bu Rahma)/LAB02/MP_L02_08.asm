TITLE LAB02 NO8
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
     
LUP: ADD DX,0BCDEH
     ADC CX,0AH
     INC SI
     CMP SI,8H
     JNZ LUP         ;penjumlahan di-loop sebanyak 8 kali
     
     MOV AH,4CH
     INT 21H
    
MAIN ENDP
END MAIN