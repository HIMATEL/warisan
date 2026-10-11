;METODE SHIFT DAN ADD KE KIRI            

TITLE 
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN    PROC  
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AH,8
        MOV BX,0
        ADD DH,0
        JZ ZZ
        ADD DL,0
        JZ ZZ
        MOV AL,DL
BB:     SHL BX,1
        SHL AL,1
        JNC AA
        ADD BL,DH
        ADC BH,0
AA:     
        DEC AH
        JNZ BB                
        
ZZ:     MOV AH,4CH
        INT 21H
MAIN ENDP
END MAIN