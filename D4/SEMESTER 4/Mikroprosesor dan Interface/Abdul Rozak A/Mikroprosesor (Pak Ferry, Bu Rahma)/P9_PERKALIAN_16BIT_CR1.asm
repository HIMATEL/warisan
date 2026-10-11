TITLE P9_PERKALIAN_16BIT_CR1 
;INPUT BX:CX DAN OUTPUT DATA AREA 'HASIL'
.MODEL SMALL
.STACK 100H
.DATA
HASIL DD 0
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     CMP BX,0
     JZ AKH1
     CMP CX,0
     JZ AKH2         
              
     MOV AX,0
     MOV DX,0
         
L0:  ADD DX,BX
     ADC AX,0
     LOOP L0
     
AKH1:
AKH2:
     MOV [HASIL],DX
     MOV [HASIL+2],AX

     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN