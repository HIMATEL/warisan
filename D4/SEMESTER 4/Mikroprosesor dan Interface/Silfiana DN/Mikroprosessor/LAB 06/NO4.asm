TITLE LAB06_04
.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN    PROC
        MOV CH,77H
        MOV BH,CH
        AND BH,0F0H
        SHR BH,4
        ADD BH,BH ;PULUHAN 8 KALI
        ADD BH,BH
        ADD BH,BH
        MOV BL,CH
        AND BL,00FH
        ADD BH,BL
        MOV CL,BH
        MOV BH,0
        MOV BL,0
        
        MOV AH,4CH
        INT 21H
        
MAIN    ENDP
END     MAIN