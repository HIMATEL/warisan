TITLE LAB09 NO2

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
     MOV AX,0
     MOV BX,0
     MOV CX,0
     MOV DX,0
     
     MOV BX,37ACH
     MOV AL,BH
     AND AL,0F0H
     SHR AL,4
     DAA
     
     CALL KONV
     MOV DX,AX
     MOV AL,BH
     AND AL,0FH
     DAA
     
     MOV AH,0
     ADD AX,DX
     DAA
     CALL KONV
     MOV DX,AX
     MOV AL,BL
     AND AL,0F0H 
     SHR AL,4
     DAA
     
     MOV AH,0
     ADD AX,DX
     DAA 
     CALL KONV
     MOV DX,AX
     MOV AL,BL
     AND AL,0FH
     DAA
     
     MOV AH,0
     ADD AX,DX
     DAA
     MOV DX,AX
     
     MOV AH,4CH
     INT 21H
MAIN ENDP

KONV PROC
     ADC AH,0
LUP: MOV DL,AL
     MOV AL,CL
     ADD AL,AL
     DAA
     
     MOV CL,AL
     MOV AL,AH
     ADD AL,AL
     DAA
     
     MOV AH,AL
     ADC CX,0
     MOV AL,DL
     ADD AL,AL
     DAA
     
     ADC AH,0
     INC DI
     CMP DI,4
     JNZ LUP
     MOV DI,0
     RET

KONV ENDP
END MAIN  
