TITLE P10_PERKALIAN_24BIT_CR5
;INPUT DATA AREA 'INPUT' DAN OUTPUT DATA AREA 'HASIL'
.MODEL SMALL
.STACK 100H
.DATA
INPUT DD 00FFFFFFH,00FFFFFFH
TEMP1 DD 0,0,0
TEMP2 DD 0,0,0
HASIL DD 0,0,0
.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX

        MOV AX,[INPUT]
        MOV BX,[INPUT+4]
        MUL BX
        MOV [TEMP1],AX
        MOV [TEMP1+2],DX

        MOV AX,[INPUT+2]
        MOV DX,0
        MUL BX
        
        ADD AX,[TEMP1+2]
        ADC DX,0
        MOV [TEMP1+2],AX
        MOV [TEMP1+4],DX

        MOV AX,[INPUT]
        MOV BX,[INPUT+6]
        MUL BX
        MOV [TEMP2],AX
        MOV [TEMP2+2],DX

        MOV AX,[INPUT+2]
        MOV DX,0
        MUL BL
        MOV DX,AX
       
        ADD DX,[TEMP2+2]
        MOV [TEMP2+2],DX

        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0

        MOV AX,[TEMP1+2]
        MOV BX,[TEMP1+4]
        ADD AX,[TEMP2]
        ADC BX,0
        ADD BX,[TEMP2+2]
        ADC CX,0
        
        ;HASIL
        MOV DX,[TEMP1]
        MOV [HASIL],DX
        MOV [HASIL+2],AX
        MOV [HASIL+4],BX
        MOV [HASIL+6],CX
        

        MOV AH,4CH
        INT 21H
MAIN    ENDP
END MAIN