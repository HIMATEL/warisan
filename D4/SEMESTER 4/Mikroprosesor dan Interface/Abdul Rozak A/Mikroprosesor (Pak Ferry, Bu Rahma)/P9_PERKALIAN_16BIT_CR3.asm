TITLE P9_PERKALIAN_16BIT_CR3 ;INPUT BX:CX DAN OUTPUT DATA AREA 'HASIL'
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
        
              MOV DX,0
              MOV AX,0
              MOV SI,0 
              MOV DI,0

L1:         SHR CX,1
              JNC L0
              MOV DI,AX
              MOV AX,SI
              ADD DX,BX
              ADC AX,DI
              MOV SI,AX
              MOV AX,0
              MOV AX,DI

L0:         SHL AX,1
              SHL BX,1
              ADC AX,0

              CMP CX,0
              JNZ L1

AKH:     MOV [HASIL],DX
              MOV [HASIL+2],SI
     
              MOV AH,4CH
              INT 21H
MAIN ENDP
END MAIN