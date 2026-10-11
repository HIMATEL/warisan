TITLE PEMBAGIAN METODE PENGURANGAN BERULANG
.MODEL SMALL   ;DH:DL -> HB=CL SB=CH
.STACK 100H
.CODE
MAIN PROC
        PUSH DX
        MOV CL,0
        MOV CH,DH
        CMP DH,DL
        JB  AKH
        ADD DL,0
        JZ  AKH
        
LUP:    SUB DH,DL
        INC CL
        CMP DH,DL
        JAE LUP
        
        MOV CH,DH
        
        POP DX
AKH:    MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN