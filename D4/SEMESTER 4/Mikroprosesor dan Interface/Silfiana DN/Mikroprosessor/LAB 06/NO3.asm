TITLE L6_03
.MODEL SMALL
.STACK 100H
.DATA
 BM1 DB 56H,34H,12H
 
.CODE
MAIN    PROC
        MOV AX,@DATA
        MOV DS, AX
        MOV SS,AX

LUP:    MOV AX,0
        MOV BX,0
        MOV BH,[BM1+SI+2]
        MOV BL,[BM1+SI+1]
        
        MOV AL,BH
        AND AL,0F0H
        SHR AL,4
        CALL KALI
        
        MOV CH,0A1H
        MOV BL,CH
        AND BL,7
        
        MOV DL,CH
        AND DL,0F8H
        MOV DH,0
        SHL DX,1
        OR DL,BL
        
        MOV BL,DL
        AND BL,7FH
        AND DL,80H
        SHL DX,1
        OR DL,BL
        
        MOV AH,4CH
        INT 21H
MAIN    ENDP
END     MAIN