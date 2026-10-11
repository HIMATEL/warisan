TITLE L08_05CR2
.MODEL SMALL
.STACK 100H
.DATA
BM1 DB 23H,56H,22H,8AH,F3H,66H,8,7CH
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
        
     MOV CL,[BM1]
     MOV SI,1
        
     MOV BL,[BM1+SI]
     CMP BL,CL
     JB  SK0
     MOV CL,BL
        
     MOV AH,4CH
     INT 21H
     MAIN ENDP
END MAIN