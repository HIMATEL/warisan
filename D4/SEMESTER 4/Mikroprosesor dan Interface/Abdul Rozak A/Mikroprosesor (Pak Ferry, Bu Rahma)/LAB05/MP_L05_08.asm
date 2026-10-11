TITLE PENGURANGAN
.MODEL SMALL
.STACK 100H
.DATA
  INP DB FFH
  OTP DW 0

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV BX,0
     MOV CX,0
     MOV DX,0
     
     MOV CL,[INP]
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
     MOV AL,DL
     ADD AL,0
     DAA
     MOV DL,AL
     MOV DH,0
     
     MOV AH,4
LUP: MOV AL,DL
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
     
     MOV [OTP],DX
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN 