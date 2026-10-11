TITLE PENGURANGAN
.MODEL SMALL
.STACK 100H
.DATA
  DAT1 DW 1234H,5678H,5432H,9999H,7869H,4567H
  DAT3 DW 0

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
        MOV BX,[DAT1]  ;simpan 1234
        MOV CX,[DAT1+2];+5678
        
        MOV AL,BL     ;TAMBAH
        ADD AL,CL
        DAA
        MOV BL,AL
        
        MOV AL,BH
        ADC AL,CH
        DAA
        MOV BH,AL
        ADC DX,0
        
        MOV CX,[DAT1+4];-5432
        
        MOV AL,BL     ;KURANG
        SUB AL,CL
        DAS
        MOV BL,AL
        
        MOV AL,BH
        SBB AL,CH
        DAS
        MOV BH,AL
        
        MOV CX,[DAT1+6];-9999
        
        MOV AL,BL     ;KURANG
        SUB AL,CL
        DAS
        MOV BL,AL
        
        MOV AL,BH
        SBB AL,CH
        DAS
        MOV BH,AL
        
        MOV CX,[DAT1+8H];+7869
        
        MOV AL,BL     ;TAMBAH
        ADD AL,CL
        DAA
        MOV BL,AL
        
        MOV AL,BH
        ADC AL,CH
        DAA
        MOV BH,AL
        
        MOV CX,[DAT1+0AH];+4567
        
        MOV AL,BL     ;TAMBAH
        ADD AL,CL
        DAA
        MOV BL,AL
        
        MOV AL,BH
        ADC AL,CH
        DAA
        MOV BH,AL
        
        MOV [DAT3],BX
     
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN 