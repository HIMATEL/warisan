TITLE KONVERSI
.MODEL SMALL
.STACK 100H
.DATA
  INP DW 0B62H  ;bilangan yang akan dikonversi
  OTP DW 0

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
             
     MOV AX,0
     MOV BX,0 
     MOV CX,0
     MOV DX,0
     
     MOV CX,[INP]
     ADD CX,0
     JZ  SKIP
LUP: ADD AL,01H   ;menghitung maju secara desimal
     DAA
     ADC DH,0
     MOV DL,AL
     
     MOV AL,DH
     ADD AL,0
     DAA
     ADC BL,0
     MOV DH,AL
     
     MOV AL,DL
     DEC CX      ;menghitung mundur secara hexadesimal
     JNZ LUP
     
SKIP:MOV CX,[INP]
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN 