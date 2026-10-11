TITLE 03_PEMBAGIAN 16 BIT DENGAN 8 BIT
.MODEL SMALL  ;BL/CL=DX
.STACK 100H
.DATA
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV DX,0
     ADD BX,0
     JZ  SKIP
     ADD CL,0
     JZ  SKIP
     
LUP: SUB BL,CL
     SBB BH,0
     ADD DX,1
     CMP BH,0
     JA  LUP
     CMP BL,CL
     JAE LUP
     MOV AL,BL
SKIP: 
     MOV AH,4CH
     INT 21H
     MAIN ENDP
END MAIN