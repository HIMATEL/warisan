TITLE P9_PERKALIAN_8BIT_CR4 ;INPUT DH:DL DAN OUTPUT BX
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
     CMP DH,0
     JZ AKH
     CMP DL,0
     JZ AKH
        
     MOV CX,8
     MOV AL,DH
     MOV BX,0

L1:  SHL BX,1
     SHL DH,1
     JNC L0
     ADD BL,AL
     ADC BH,0

L0:  LOOP L1
              
AKH:
     MOV AH,4CH
     INT 21H
MAIN    ENDP
END MAIN