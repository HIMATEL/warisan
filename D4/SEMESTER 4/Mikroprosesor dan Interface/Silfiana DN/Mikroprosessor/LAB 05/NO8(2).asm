TITLE LAB05 NO08
.MODEL SMALL
.STACK 100H 

.DATA
  DATA1 DB 0FFH ;bilangan yang akan dikonversi
  HASIL DW 0

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV AX,0
     MOV BX,0
     MOV CX,0
     MOV DX,0
      
     MOV CL,[DATA1]
     ADD CL,0
     JZ LUP2  
     
LUP: ADD AL,01H
     DAA
     ADC DH,0
     DEC CL
     JNZ LUP
     MOV DL,AL

LUP2:MOV CL,[DATA1]
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN  
