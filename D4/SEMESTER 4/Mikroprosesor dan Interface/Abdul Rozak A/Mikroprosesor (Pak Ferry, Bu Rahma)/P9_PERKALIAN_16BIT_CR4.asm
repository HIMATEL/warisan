TITLE P9_PERKALIAN_16BIT_CR4 
;INPUT BX:CX DAN OUTPUT DATA AREA 'HASIL'
.MODEL SMALL
.STACK 100H
.DATA
HASIL DD 0
.CODE
MAIN    PROC
              MOV AX,@DATA
              MOV DS,AX
              CMP BX,0
              JZ AKH
              CMP CX,0
              JZ AKH
        
              MOV AX,0
              MOV DX,0
              MOV SI,10H

L1:         SHL AX,1
              SHL DX,1
              ADC AX,0
              
              DEC SI

              SHL BX,1
              JNC L0
              ADD DX,CX
              ADC AX,0

L0:         
              CMP SI,0
              JNZ L1

AKH:     MOV [HASIL],DX
              MOV [HASIL+2],AX

              MOV AH,4CH
              INT 21H
MAIN    ENDP
END MAIN