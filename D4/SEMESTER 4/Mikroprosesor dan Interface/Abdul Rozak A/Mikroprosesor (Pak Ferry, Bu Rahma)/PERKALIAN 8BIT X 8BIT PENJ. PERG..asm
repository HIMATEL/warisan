TITLE PERKALIAN 8 BIT DENGAN 8 BIT DH*DL=BX
TITLE METODE KOMBINASI PERGESERAN DAN PENJUMLAHAN
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN    PROC
        MOV BX, 0
        ADD DH, 0
        JZ ENDING
        ADD DL, 0
        JZ ENDING 
        
        MOV AH, DL
        AND AH, 0F0H
        MOV CL, 4
        SHR AH, CL
        JZ YYY 
        
PPP:    ADD BL, DH
        ADC BH, 0 
        DEC AH
        JNZ PPP
        MOV CL, 4
        SHL BX, CL 
        
YYY:    MOV AH, DL
        AND AH, 0FH
        JZ ENDING 
        
NNN:    ADD BL, DH
        ADC BH, 0 
        DEC AH
        JNZ NNN
        
ENDING: MOV AH, 4CH
        INT 21H
        
MAIN    ENDP
END     MAIN