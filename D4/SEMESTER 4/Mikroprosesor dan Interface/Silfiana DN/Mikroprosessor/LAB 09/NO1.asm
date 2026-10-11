TITLE LAB09 NO1

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
     MOV SI,0
     MOV AX,0
     MOV CX,0
     MOV DX,0
     
     MOV CH,3AH
     MOV AL,CH
     AND AL,0F0H
     MOV CL,4
     SHR AL,CL
     DAA
     
     CALL KONV
     MOV DX,AX
     MOV AL,CH
     AND AL,0FH
     DAA
     
     ADD AL,DL
     DAA
     ADC AH,0
     MOV DX,AX
     MOV AH,4CH
     INT 21H
MAIN ENDP

KONV PROC
     ADD AL,AL
     DAA
     ADD AL,AL
     DAA
     ADD AL,AL
     DAA
     
     ADC AH,0
     CMP AX,100H
     JAE AKH 
     ADD AL,AL
     DAA
     ADC AH,0
     RET
     
AKH: ADD AX,AX
     DAA
     ADC AH,0
     RET

KONV ENDP
END MAIN  
