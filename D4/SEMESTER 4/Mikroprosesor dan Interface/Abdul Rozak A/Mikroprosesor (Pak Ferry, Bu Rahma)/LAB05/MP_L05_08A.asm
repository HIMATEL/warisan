TITLE KONVERSI
.MODEL SMALL
.STACK 100H
.DATA
  INP DB 0FFH ;bilangan yang akan dikonversi
  OTP DW 0

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
             
     MOV AX,0        
     MOV BX,0
     MOV CX,0
     MOV DX,0
     
     MOV CL,[INP]  
     ADD CL,0
     JZ  SKIP
LUP: ADD AL,01H    ;menghitung maju secara desimal
     DAA
     ADC DH,0
     DEC CL        ;menghitung mundur secara hexadesimal
     JNZ LUP
     
     MOV DL,AL
SKIP:MOV CX,[INP]
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN 