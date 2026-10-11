TITLE LAB06_09
.MODEL SMALL
.STACK 100H 
.DATA
    TEMP DB 3 DUP(0)
    AMAN DB 3 DUP(0)
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV SI,0 
    
    MOV CX,3476H
    MOV AL,CH
    AND AL,0F0H
    SHR AL,4
    MOV AH,AL
    CALL TAMB
    CALL KALI
    MOV AL,CH
    AND AL,0FH

    MOV AH,AL
    CALL TAMB
    CALL KALI
    MOV AL,CL
    AND AL,0F0H
    SHR AL,4
    MOV AH,AL
    CALL TAMB
    CALL KALI
    MOV AL,CL
    AND AL,0FH
    MOV AH,AL
    CALL TAMB
    MOV AL,[TEMP+1]
    MOV DH,AL
    MOV AL,[TEMP]
    MOV DL,AL
    MOV AH,4CH
    INT 21H
    MAIN ENDP  

KALI PROC
    MOV AL,[TEMP]
    ADD AL,AL
    MOV [TEMP],AL
    MOV AL,[TEMP+1]
    ADC AL,AL
    MOV [TEMP+1],AL
    MOV AL,[TEMP]
    MOV [AMAN],AL
    MOV AL,[TEMP+1]
    MOV [AMAN+1],AL
;-----------------------------------PERKALIAN 8--------------
    MOV AH,2
    SANA: MOV AL,[TEMP]
    ADD AL,AL
    MOV [TEMP],AL
    MOV AL,[TEMP+1]
    ADC AL,AL
    MOV [TEMP+1],AL
    DEC AH
    JNZ SANA

    RET
    KALI ENDP
TAMB PROC
    MOV AL,[TEMP]
    ADD AL,AH
    MOV [TEMP],AL
    MOV AL,[TEMP+1]
    ADC AL,0
    MOV [TEMP+1],AL
    RET
TAMB ENDP
END MAIN  
