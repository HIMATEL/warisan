TITLE L08_03_02
.MODEL SMALL
.STACK 100H
.DATA
BM1 DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV ES,AX
     MOV DI,0
     MOV AL,-1H
        
     CLD
     MOV CX,10H
     LEA DI,[BM1]
     ADD AL,1
L0:  STOSB
     LOOP L0:
        
     MOV AH,4CH
     INT 21H
     MAIN ENDP
END MAIN