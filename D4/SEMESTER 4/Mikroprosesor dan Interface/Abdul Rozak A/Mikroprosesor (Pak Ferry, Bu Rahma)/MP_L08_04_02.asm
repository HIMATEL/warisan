TITLE L08_04CR2
.MODEL SMALL
.STACK 100H
.DATA
BM1 DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.CODE
MAIN    PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV ES,AX
        MOV DI,0
        MOV AX,-1111H
        
        CLD
        MOV CX,10H
        LEA DI,[BM1]
L0:   ADD AX,1111H
        STOSW
        LOOP L0:
      
        MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN