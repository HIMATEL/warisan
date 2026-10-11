TITLE LAB09 NO3

.MODEL SMALL
.STACK 100H
.DATA
BM1 DB 11H,22H,33H,44H,55H,66H,77H,88H,99H
    DB 1AH,2AH,3AH,4AH,5AH,6AH,7AH
BM2 DW 16 DUP(0)  

.CODE
MAIN PROC 
     MOV AX,@DATA
     MOV DS,AX
     MOV SI,0

     MOV BX,0
     MOV CX,0
     MOV DX,0
     
LUP1:MOV AX,0
     MOV CH,[BM1+SI]
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
     MOV [BM2+DI],AX
     INC SI
     INC DI
     INC DI
     CMP SI,16
     JNZ LUP1
     
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
     JAE LUP2
     ADD AL,AL
     DAA
     
     ADC AH,0
     RET
     
LUP2:ADD AX,AX
     DAA
     ADC AH,0
     RET
     
KONV ENDP
END MAIN  

