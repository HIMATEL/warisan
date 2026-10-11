TITLE LAB06_08
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN    PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV BX,0
        
        MOV DL,CL
        AND CX,1234H
        SHR CL,1
        SHR CL,1
        SHR CL,1
        SHR CL,1
        MOV AL,CL
        ADD AL,AL
        DAA
        
        SUB DL,AL
        MOV AL,DL
        SUB AL,0
        DAS
        MOV DL,AL
        
        MOV SI,DX
        
        SHR CX,1
        SHR CX,1
        SHR CX,1
        SHR CX,1
        SHR CX,1
        SHR CX,1
        SHR CX,1
        SHR CX,1
        
        MOV CH,CL
        AND CL,0FH
        AND CH,0F0H
        
        SHR CH,1
        SHR CH,1
        SHR CH,1
        SHR CH,1
        
        MOV AX,0
        
LUP1:   CMP CL,0
        JA  S1
        MOV CL,0
        JBE LUP2
S1:     ADD AL,64H
        DAA
        ADC AH,0
        MOV BL,AL
        MOV AL,AH
        ADD AL,0
        DAA
        MOV BH,AL
        MOV AL,BL
        MOV AH,BH
        DEC CL
        JNZ LUP1
        CMP CH,0
        MOV DX,0
        JBE EX
        
        MOV AX,0
        MOV DX,0
LUP2:   ADD AX,512H
        DAA
        MOV DL,AL
        MOV AL,AH
        ADD AL,0
        DAA
        MOV DH,AL
        MOV AX,DX
        DEC CH
        JNZ LUP2
        MOV DX,AX
        
EX:     ADD DX,SI
        MOV AX,0            
        MOV AL,DL
        ADD AL,0
        DAA
        ADC AH,0
        MOV DL,AL
        MOV AL,AH
        ADD AL,DH
        DAA
        MOV DH,AL
        
        ADD DX,BX
        MOV AX,0
        MOV AL,DL
        ADD AL,0
        DAA
        ADC AH,0
        MOV DL,AL
        MOV AL,AH
        ADD AL,DH
        DAA
        MOV DH,AL
        
EXIT:   MOV AH,4CH
        INT 21H

MAIN    ENDP
END     MAIN  
