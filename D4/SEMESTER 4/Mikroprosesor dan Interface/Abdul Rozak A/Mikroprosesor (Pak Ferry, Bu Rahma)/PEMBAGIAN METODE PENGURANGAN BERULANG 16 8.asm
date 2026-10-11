TITLE PEMBAGIAN METODE PENGURANGAN BERULANG
.MODEL SMALL   ;BX:CH -> HB=DX SB=AL
.STACK 100H
.CODE
MAIN PROC
        PUSH BX
        PUSH CX
        MOV CL,CH
        MOV CH,0
        MOV DX,0
        MOV AL,BL
        ADD BH,0
        JNZ AA
        CMP BL,CL
        JB  AKH
AA:     ADD CL,0
        JZ  AKH
        
LUP:    SUB BL,CL
        SBB BH,0
        INC DX
        CMP BX,CX
        JAE LUP
        
        MOV AL,BL
                 
        POP CX        
        POP BX
AKH:    MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN