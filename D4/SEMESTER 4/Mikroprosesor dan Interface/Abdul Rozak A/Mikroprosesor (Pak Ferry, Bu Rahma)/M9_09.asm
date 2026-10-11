TITLE M9_09
.MODEL SMALL
.STACK 100H    
.DATA
        SIMPAN DW 0,0
.CODE
MAIN        PROC 
            MOV AX,@DATA
            MOV DS,AX
            MOV AX,0 
            ADD BX,0
            MOV AL,BH
            AND AL,0F0H
            SHR AL,1
            SHR AL,1
            SHR AL,1
            SHR AL,1
            ;MOV [SIMPAN],AX
            CALL KALI
            ;MOV AX,[SIMPAN]
            MOV CH,BH 
            AND CH,0FH 
            ADD AL,CH
            ADC AH,0
            ;MOV [SIMPAN],AX
            CALL KALI
            ;MOV AX,[SIMPAN]
            MOV CH,BL
            AND CH,0F0H
            SHR CH,1
            SHR CH,1
            SHR CH,1
            SHR CH,1
            ADD AL,CH
            ADC AH,0
            ;MOV [SIMPAN],AX
            CALL KALI 
            ;MOV AX,[SIMPAN]
            MOV CH,BL
            AND CH,0FH
            ADD AL,CH
            ADC AH,0
            
            MOV CX,AX 
            
            MOV AH,4CH
            INT 21H
            MAIN ENDP     

KALI        PROC 
            ;MOV AX,[SIMPAN]
            ADD AX,AX 
            MOV DX,AX
            ADD AX,AX
            ADD AX,AX
            ADD AX,DX
            ;MOV [SIMPAN],AX 
            
            RET
            KALI ENDP
END MAIN