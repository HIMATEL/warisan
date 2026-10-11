TITLE P6_10 ;KONVERSI 6 DIGIT OKTAL KE DESIMAL
.MODEL SMALL
.STACK 100H
.DATA
    INPUT DD 123456H,657354H,777777H,232323H,556556H,437654H,234000H
    OUTPUT DD 0,0,0,0,0,0,0
.CODE         
MAIN    PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV SI,0
        MOV DI,0
        
ULANG:  MOV DX,[INPUT+DI]
        MOV AX,0
        MOV BX,0
        MOV CX,0
        
        
        ;KONVERSI SATUAN OKTAL (MAKS 1 DIGIT DES)
        MOV AL,DL
        AND AL,0FH
        CMP AL,8
        JB KONV0
        ADD AL,8
KONV0:  MOV BL,AL
        
        
        ;KONVERSI DELAPANAN OKTAL (MAKS 2 DIGIT DES)
        MOV AX,0
        ;MOV CX,0
        MOV CL,DL
        AND CL,0F0H
        SHR CL,4
        
        CMP CL,0
        JZ SINI1
        
KONV1:  ADD AL,8H
        DAA
        ADC AH,0
        
        SUB CL,1
        CMP CL,0
        JNZ KONV1
        
        ADD AL,BL
        DAA
        ADC AH,0
        MOV BX,AX
SINI1:  
        
        
        ;KONVERSI ENAMPULUHEMPATAN OKTAL (MAKS 3 DIGIT DES)
        MOV AX,0
        MOV CL,DH
        AND CL,0FH
        
        CMP CL,0
        JBE SINI2
        
KONV2:  ADD AL,64H
        DAA
        ADC AH,0

        SUB CL,1
        CMP CL,0
        JNZ KONV2 
        
        ADD AL,BL
        DAA 
        ADC AH,0
        MOV BL,AL
        MOV AL,AH
        ADD AL,BH
        DAA 
        MOV BH,AL
SINI2:  
        
        
        ;KONVERSI LIMARTUSDUABELASAN OKTAL (MAKS 4 DIGIT DES)
        MOV AX,0
        
        MOV CL,DH
        AND CL,0F0H
        SHR CL,4
        
        CMP CL,0
        JBE SINI3
        
KONV3:  ADD AL,12H
        DAA
        ADC AH,0
        MOV CH,AL
        MOV AL,AH
        ADD AL,5H
        DAA 
        ADC DL,0
        MOV AH,AL
        MOV AL,CH
        
        SUB CL,1
        CMP CL,0
        JNZ KONV3
        
        ;KOREKSI ERROR DAA
        ;ADD AL,60H
        ;DAA 
        ;ADC AH,1 
        
        ADD AL,BL
        DAA  
        ADC AH,0
        MOV BL,AL
        MOV AL,AH
        ADD AL,BH
        DAA 
        MOV BH,AL
SINI3:  
        
        
        ;KONVERSI EMPATRIBUSEMBILANPULUHENAMAN OKTAL (MAKS 5 DIGIT DES)
        INC DI
        INC DI
        MOV DX,[INPUT+DI]
        MOV DH,DL 
        MOV DL,0
        MOV AX,0        
        MOV CL,DH
        AND CL,0FH
        
        CMP CL,0
        JBE SINI4
        
KONV4:  ADD AL,96H
        DAA
        ADC AH,0
        MOV CH,AL
        MOV AL,AH
        ADD AL,40H
        DAA 
        ADC DL,0
        MOV AH,AL
        MOV AL,CH
        
        SUB CL,1
        CMP CL,0
        JNZ KONV4
        
        ;KOREKSI ERROR DAA
        ;ADD AL,60H
        ;DAA 
        ;ADC AH,1 
        
        ADD AL,BL
        DAA  
        ADC AH,0
        MOV BL,AL
        MOV AL,AH
        ADD AL,BH
        DAA 
        ADC DL,0
        MOV BH,AL
SINI4:
        
        
        ;KONVERSI TIGAPULUHDUARIBUTUJUHRATUSENAMPULUHDELAPANAN OKTAL (MAKS 6 DIGIT DES)
        MOV AX,0        
        MOV CL,DH
        AND CL,0F0H
        SHR CL,4
        
        CMP CL,0
        JBE SINI5
        
KONV5:  ADD AL,68H
        DAA
        ADC AH,0
        MOV CH,AL
        MOV AL,AH
        ADD AL,27H
        DAA 
        ADC DL,0
        MOV AH,AL
        MOV AL,DL
        ADD AL,3
        DAA 
        MOV DL,AL
        MOV AL,CH 
        
        SUB CL,1
        CMP CL,0
        JNZ KONV5
        
        ;KOREKSI ERROR DAA
        ;ADD AL,60H
        ;DAA 
        ;ADC AH,1 
        
        ADD AL,BL
        DAA  
        ADC AH,0
        MOV BL,AL
        MOV AL,AH
        ADD AL,BH
        DAA 
        ADC DL,0
        MOV BH,AL
SINI5:  

        MOV DH,0
        MOV [OUTPUT+SI],BX
        INC SI
        INC SI
        MOV [OUTPUT+SI],DX
        
        INC SI
        INC SI
        INC DI
        INC DI
        
        CMP SI,1CH
        JNZ ULANG
        
        
        MOV AH,4CH
        INT 21H      
        MAIN ENDP

END MAIN