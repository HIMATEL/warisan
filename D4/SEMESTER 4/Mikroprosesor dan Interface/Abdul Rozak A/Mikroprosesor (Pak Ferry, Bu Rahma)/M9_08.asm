TITLE M9_08
.MODEL SMALL
.STACK 100H    
.DATA
        SIMPAN DB 0,0
.CODE
MAIN        PROC 
            MOV AX,@DATA
            MOV DS,AX
            MOV AX,0 
            MOV AL,CH
            AND AL,0F0H
            SHR AL,1
            SHR AL,1
            SHR AL,1
            SHR AL,1
            CALL KALI
            MOV BH,CH 
            AND BH,0FH 
            ADD AL,BH
            ADC AH,0
            MOV DL,AL 
            
            MOV AH,4CH
            INT 21H
            MAIN ENDP     

KALI        PROC
            ADD AX,AX 
            MOV BX,AX
            ADD AX,AX
            ADD AX,AX
            ADD AX,BX 
            
            RET
            KALI ENDP
END MAIN