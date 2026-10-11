TITLE KONVERSI OKTAL
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV SI,0
     ADD DX,0
     CMP DX,8H
     JBE SK1
     
L0:  INC SI
     SUB DX,8H
     CMP DX,8H
     JAE L0
     
SK1: MOV BX,DX
     
     MOV DX,SI
     CMP DX,8H
     JBE SK2
     
     MOV SI,0
L1:  INC SI
     SUB DX,8H
     CMP DX,8H
     JAE L1
     
SK2: MOV CL,4
     SHL DX,CL
     ADD BX,DX
     
     MOV DX,SI
     SHL DX,CL
     SHL DX,CL
     ADD BX,DX
          
     MOV AH,4CH
     INT 21H
     MAIN ENDP
END MAIN