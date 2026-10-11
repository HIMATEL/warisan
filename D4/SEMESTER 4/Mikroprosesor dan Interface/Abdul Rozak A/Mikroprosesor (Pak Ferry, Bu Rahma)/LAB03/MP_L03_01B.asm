TITLE L03_01B
.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX 
     
     MOV SI,0
     MOV BX,0  
LUP: MOV AL,BL
     ADD AL,99H
     DAA 
     ADC BH,0
     MOV BL,AL
     MOV AL,BH
     DAA
     MOV BH,AL
     INC SI
     CMP SI,14H
     JNZ LUP
       
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN