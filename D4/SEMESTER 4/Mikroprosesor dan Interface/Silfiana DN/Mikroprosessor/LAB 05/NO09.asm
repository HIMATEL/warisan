TITLE LAB05 NO09
.MODEL SMALL
.STACK 100H 

.DATA
  DATA1 DW 0B62H ;bilangan yang akan dikonversi
  HASIL DW 0

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV AX,0
     MOV BX,0
     MOV CX,0
     MOV DX,0
      
     MOV CX,[DATA1]
     ADD CX,0
     JZ LUP2  
     
LUP: ADD AL,01H
     DAA
     ADC DH,0
     MOV DL,AL
     MOV AL,DH
     ADD AL,0
     DAA
     
     ADC BL,0
     MOV DH,AL
     MOV AL,DL
     DEC CX
     JNZ LUP
     
LUP2:MOV CX,[DATA1]
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN  
