TITLE L08_03CR1
.MODEL SMALL
.STACK 100H
.DATA
BM1 DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV SI,1
       
L0:  ADD BL,1
     MOV [BM1+SI],BL

     INC SI
     CMP BL,0FH
     JNZ L0

        
     MOV AH,4CH
     INT 21H
     MAIN ENDP
END MAIN