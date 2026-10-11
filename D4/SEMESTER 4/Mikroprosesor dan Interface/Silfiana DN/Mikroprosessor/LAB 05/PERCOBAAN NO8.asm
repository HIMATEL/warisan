TITLE M5_08

.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN     PROC 
         
         MOV CL,2BH
         MOV BL,CL
         AND BL,0FH
         MOV AL,BL
         
         ADD AL,0
         DAA
         MOV BL,AL
         MOV DL,CL
         AND DL,0F0H
         
         SHR DL,1
         SHR DL,1
         SHR DL,1
         SHR DL,1
         
         MOV DH,0
         MOV AH,4

LUP:     MOV AL,DL
         ADD AL,AL
         DAA
         MOV DL,AL
         MOV AL,DH
         ADC AL,AL
         DAA
         MOV DH,AL
         DEC AH
         JNZ LUP
         
         MOV AL,DL
         ADD AL,BL
         DAA
         MOV DL,AL
         MOV AL,DH
         ADC AL,0
         DAA
         MOV DH,AL
         
         MOV AH,4CH
         INT 21H
         MAIN ENDP
END MAIN