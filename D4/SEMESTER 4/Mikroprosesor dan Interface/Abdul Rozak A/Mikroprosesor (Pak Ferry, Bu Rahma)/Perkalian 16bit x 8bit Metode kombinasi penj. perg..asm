TITLE P9_PERKALIAN_16BIT_CR2 ;INPUT BX:CX DAN OUTPUT DATA AREA 'HASIL'
.MODEL SMALL
.STACK 100H
.DATA
HASIL DD 0
TEMP DD 0,0,0,0,0,0,0
.CODE
MAIN    PROC
              MOV AX,@DATA
              MOV DS,AX
              CMP BX,0
              JZ AKH
              CMP CX,0
              JZ AKH
        
              MOV AX,CX
              MOV AH,AL
              MOV SI,CX
              MOV CX,0
              MOV DX,0

              AND AL,0FH
              ;CMP AL,0
              JZ SKIP1

L0:         DEC AL
              ADD DX,BX
              ADC CX,0
              CMP AL,0
              JNZ L0

SKIP1:  MOV [TEMP],DX
              MOV [TEMP+2],CX

              AND AH,0F0H
              ;CMP AH,0
              JZ SKIP2

              MOV DX,0
              MOV CX,0

L1:         DEC AH
              ADD DX,BX
              ADC CX,0
              CMP AH,0
              JNZ L1
  
              MOV DX,AX
              SHL DX,1
              SHL DX,1
              SHL DX,1
              SHL DX,1
              AND AH,0F0H
              SHR AH,1
              SHR AH,1
              SHR AH,1
              SHR AH,1
              SHL CX,1
              SHL CX,1
              SHL CX,1
              SHL CX,1
              ADD CL,AH
              ADC CH,1

SKIP2:  MOV [TEMP+4],DX
              MOV [TEMP+6],CX

              MOV AX,SI
              MOV AL,AH
              MOV CX,0
              MOV DX,0
              
              AND AL,0FH
              ;CMP AL,0
              JZ SKIP3

L2:         DEC AL
              ADD DX,BX
              ADC CX,0
              CMP AL,0
              JNZ L2

SKIP3:  MOV [TEMP+9],DX
              MOV [TEMP+11],CX

              AND AH,0F0H
              ;CMP AH,0
              JZ SKIP4

              MOV DX,0
              MOV CX,0

L3:         DEC AH
              ADD DX,BX
              ADC CX,0
              CMP AH,0
              JNZ L3
  
              MOV DX,AX
              SHL DX,1
              SHL DX,1
              SHL DX,1
              SHL DX,1
              AND AH,0F0H
              SHR AH,1
              SHR AH,1
              SHR AH,1
              SHR AH,1
              SHL CX,1
              SHL CX,1
              SHL CX,1
              SHL CX,1
              ADD CL,AH
              ADC CH,1

SKIP4:  MOV [TEMP+13],DX
              MOV [TEMP+15],CX

              MOV AX,0
              MOV CX,SI
              MOV DX,0

              MOV DX,[TEMP]
              MOV AX,[TEMP+2]
              ADD DX,[TEMP+4]
              ADC AX,0
              ADD AX,[TEMP+6]
              ADD DX,[TEMP+8]
              ADC AX,0
              ADD AX,[TEMP+10]
              ADD DX,[TEMP+12]
              ADC AX,0
              ADD AX,[TEMP+14]

              MOV [HASIL],DX
              MOV [HASIL+2],AX 
 AKH:
              MOV AH,4CH
              INT 21H
MAIN    ENDP
END MAIN