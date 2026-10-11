TITLE UTS NO2
.MODEL SMALL
.STACK 100H
.DATA
BM1 DB 1AH,15H,1FH  
BM2 DB 21 DUP (0)

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV AX,0
     MOV BX,0
     MOV CX,0
     MOV DX,0
     MOV SI,0
     MOV DI,0
     
LUP: MOV CX,0
     MOV BX,0
     MOV CL,[BM1+SI+2]
     MOV BH,[BM1+SI+1]
     MOV BL,[BM1+SI]
     MOV DX,BX
     AND DX,0FFF8H
     ADD DX,BX
     RCL CX,1
     
     MOV BX,DX
     AND BX,0FF80H
     ADD DX,BX
     RCL CX,1
     MOV BX,DX
     AND DX,0F800H
     ADD DX,BX
     RCL CX,1
     MOV BX,DX
     AND BX,08000H
     ADD DX,BX
     RCL CX,1
     MOV BX,CX
     AND BX,0FFF8H
     ADD CX,BX
     MOV BX,CX
     AND BX,0FF80H
     ADD CX,BX
     MOV BX,CX
     AND BX,0F800H
     
     ADD CX,BX
     MOV BX,CX
     AND BX,8000H 
     ADD CX,BX
     
     MOV [BM2+DI],DL
     MOV BX,0
     MOV CX,0
     MOV DX,0
     ADD SI,3
     ADD DI,4
     CMP SI,18
     JNZ LUP
      
     
     MOV AH,4CH
     INT 21H

MAIN ENDP
END MAIN