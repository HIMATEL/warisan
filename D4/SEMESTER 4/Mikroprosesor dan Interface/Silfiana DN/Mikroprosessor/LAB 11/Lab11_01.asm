TITLE LAB12_01
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
     
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
MAIN ENDP
END MAIN