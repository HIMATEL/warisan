TITLE L6_02
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN    PROC
        MOV CH,77H
        CMP CH,0H
        JZ  SINI4
        
SINI1:  DEC CH
        MOV BH,CH
        AND BH,0FH
        CMP BH,08H
        JB  SINI2
        SUB CH,8H
        
SINI2:  MOV BH,CH
        AND BH,0F0H
        CMP BH,80H
        JB  SINI3
        SUB CH,80H
        
SINI3:  ADD AL,1H
        DAA
        ADC AH,0
        
SINI4:  CMP CH,0H
        JNZ SINI1
        MOV CL,AL      
        
        MOV AH,4CH
        INT 21H
MAIN    ENDP
END     MAIN  
