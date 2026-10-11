TITLE PERKALIAN HD DISIMPAN PADA DX = CH X CL 
.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
     MOV DX,0
     ADD CH,0
     JZ AKH
     SUB CL,0
     JZ AKH
     
     MOV DI,8
     MOV BH,0
     MOV BL,CH
     PUSH CX
     
L0:  SHR CL,1
     JNC L1
     ADD DL,BL  
     ADC DH,BH
     
L1:  SHL BX,1
     DEC DI
     JNZ L0
     POP CX

AKH: MOV AH,4CH
     INT 21H

MAIN ENDP
END MAIN