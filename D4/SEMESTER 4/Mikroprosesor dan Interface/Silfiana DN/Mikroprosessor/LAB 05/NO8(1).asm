TITLE LAB04 NO 08
.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
     MOV BL,CL
     AND AL,0FH
     AND AL,0
     DAA
     MOV BL,AL ; BL = SATUAN 
     MOV AL,CL
     AND AL,0F0H 
     
     SHR AL,1
     SHR AL,1
     SHR AL,1
     SHR AL,1
     
     
     AND AL,0
     DAA
     MOV DL,AL
     MOV DH,0
     MOV AH,4 
     
LUP1:MOV AL,DL
     ADD AL,AL  
     DAA
     MOV DL,AL
     ADC DH,0
     
     DEC AH
     JNZ LUP1 
     
     MOV AL,DL
     ADD AL,BL
     DAA
     MOV DL,AL
     ADC DH,0
     
     
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END  MAIN