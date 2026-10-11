TITLE LAB06_07
.MODEL SMALL
.STACK 100H
.DATA
DAT DD 123456,987654,999999,232323,5556556,987654,500000
HASIL DD 0,0,0,0,0,0,0,0,0

MAIN    PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV SI,0
        MOV DI,0
        MOV CX,0
        
LUP1:   MOV AX,[DAT+SI]
        INC SI
        INC SI  
        MOV BX,[DAT+SI]
        
        MOV [HASIL+DI],AX
        INC DI
        INC DI
        MOV [HASIL+DI],BX
        
        INC SI
        INC SI
        
        INC DI
        INC DI
        
        INC CX
        CMP CX,7H
        JNZ LUP1
        
        MOV AH,4CH
        INT 21H
        
MAIN    ENDP
END MAIN
