TITLE LAB05 NO07

.MODEL SMALL
.STACK 100H

.DATA
HASIL DW 0

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV CX,0
   
     MOV DX,1234H
     ADD DX,5678H
         
     MOV AL,DL
     DAA 
     ADC DH,0
     MOV DL,AL
         
     MOV AL,DH
     DAA
     MOV DH,AL
     
     SUB DX,5432H
     MOV AL,DL         
     DAS 
     MOV DL,AL
     MOV AL,0
         
     ADD AL,DH
     DAS
     MOV DH,AL
         
     SUB DX,9999H
     SBB CX,0
     MOV AL,DL         
     DAS 
     MOV DL,AL
         
     MOV AL,DH
     DAS
     MOV DH,AL
         
     ADD DX,7869H
     MOV AL,DL
     DAA
     ADC DH,0
     MOV DL,AL
         
     MOV AL,DH
     DAA
     MOV DH,AL
         

     ADD DX,4567H
     MOV AL,DL
     DAA
     ADC DH,0
     MOV DL,AL
         
     MOV AL,DH
     DAA
     MOV DH,AL
     MOV [HASIL],DX
                           
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN
