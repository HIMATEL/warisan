TITLE UTS LAB-2-COUNTER ;konversi oktal 4 digit ke desimal
.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV DX,0
     MOV BX,0      ;hasil akan disimpan di BX
     ADD CX,0
     JZ  SKIP
     MOV DX,CX 
     
LUP: 
     ;====perhitungan maju desimal (tujuan)=====
     ADD BX,1H
     
     MOV AL,BL
     ADD AL,0
     DAA
     ADC BH,0    
     MOV BL,AL
     
     MOV AL,BH
     ADD AL,0
     DAA 
     MOV BH,AL
     
     ;====perhitungan mundur (bilangan asal)====
     SBB DX,1  
     
     ;===koreksi oktal===
        MOV AL,DL    ;digit 1
        AND AL,0FH
        CMP AL,08H
        JB  SKIP0
        SUB DL,08H
     
SKIP0:  MOV AL,DL    ;digit 2
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP1
        SUB DL,80H
        
SKIP1:  MOV AL,DH    ;digit 3
        AND AL,0FH
        CMP AL,08H
        JB  SKIP2
        SUB DH,08H
     
SKIP2:  MOV AL,DH    ;digit 4
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP3
        SUB DH,80H    
SKIP3:     
     CMP DX,0
     JNZ LUP
     
SKIP:MOV CX,DX
     
     MOV AH,4CH
     INT 21H
     MAIN ENDP
END MAIN