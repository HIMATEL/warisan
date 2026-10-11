TITLE L04_06
.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
            
        MOV SI,0 
        MOV AX,0
LOOP0:  ADD AL,37H
        ADC AH,0
        MOV CL,AL
        AND CL,0FH
        CMP CL,08H
        JB  SKIP0
        ADD AL,08H
        ADC AH,0
SKIP0:  MOV CL,AL
        AND CL,0F0H
        CMP CL,80H
        JB  SKIP1
        ADD AL,80H
        ADC AH,0
SKIP1:  MOV CL,AH
        AND CL,0FH
        CMP CL,08H
        JB  SKIP2
        ADD AH,08H
SKIP2:  MOV DX,AX
        INC SI
        CMP SI,0AH
        JB  LOOP0       
            
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN