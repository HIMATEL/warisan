TITLE UAS LAB-01
.MODEL SMALL
.STACK 100H
.DATA
KALI DW 0
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,0
    MOV BX,0 
    MOV DI,0
    MOV AX,0
    
    ADD DX,0  ;PENGUJIAN APAKAH FAKTOR KALI = 0
    JZ  AKH
    
        MOV SI,6  ;DIKALI DENGAN 6
LUP0:   ADD DI,DX ;PENJUMLAHAN BERULANG 6 KALI
        ADC AX,0
        CALL KOR1
        DEC SI
        ADD SI,0
        JNZ LUP0 
        ADD CX,DI
        ADD BX,AX
        CALL KOR2
        SHL BX,1  ;PERGESERAN
        SHL CX,1 
        ADC BX,0
        SHL BX,1
        SHL CX,1
        ADC BX,0
        SHL BX,1
        SHL CX,1
        ADC BX,0
        SHL BX,1
        SHL CX,1
        ADC BX,0 
        
    MOV DI,0
    MOV AX,0
        
        MOV SI,2
LUP1:   ADD DI,DX
        ADC AX,0
        CALL KOR1
        DEC SI
        ADD SI,0
        JNZ LUP1
        ADD CX,DI
        ADD BX,AX
        CALL KOR2
        SHL BX,1
        SHL CX,1 
        ADC BX,0
        SHL BX,1
        SHL CX,1
        ADC BX,0
        SHL BX,1
        SHL CX,1
        ADC BX,0
        SHL BX,1
        SHL CX,1
        ADC BX,0
        
    MOV DI,0
    MOV AX,0
    
        MOV SI,4
LUP2:   ADD DI,DX
        ADC AX,0
        CALL KOR1
        DEC SI
        ADD SI,0
        JNZ LUP2
        ADD CX,DI
        ADD BX,AX
        CALL KOR2 
AKH:      
    MOV [KALI],CX
    MOV [KALI+2],BX
  
        MOV AH,4CH
        INT 21H
        MAIN ENDP
  
KOR1 PROC
    PUSH SI
    MOV SI,DI
    AND SI,000FH
    CMP SI,8
    JB  AA
    ADD DI,0008H
AA: MOV SI,DI
    AND SI,00F0H
    CMP SI,80H
    JB  BB
    ADD DI,0080H
BB: MOV SI,DI
    AND SI,0F00H
    CMP SI,800H
    JB  CC
    ADD DI,0800H
    ADC AX,0
CC: MOV SI,DI
    AND SI,0F000H
    CMP SI,8000H
    JB  DD
    ADD DI,8000H
    ADC AX,0
DD: MOV SI,AX
    AND SI,000FH
    CMP SI,0008H
    JB  EE
    ADD AX,0008H
EE: POP SI
    
    RET
KOR1 ENDP

KOR2 PROC
    PUSH SI
    MOV SI,CX
    AND SI,000FH
    CMP SI,8
    JB  FF
    ADD CX,0008H
FF: MOV SI,CX
    AND SI,00F0H
    CMP SI,80H
    JB  GG
    ADD CX,0080H
GG: MOV SI,CX
    AND SI,0F00H
    CMP SI,800H
    JB  HH
    ADD CX,0800H
    ADC BX,0
HH: MOV SI,CX
    AND SI,0F000H
    CMP SI,8000H
    JB  II
    ADD CX,8000H
    ADC BX,0
II: MOV SI,BX
    AND SI,000FH
    CMP SI,8
    JB  JJ
    ADD BX,0008H
JJ: MOV SI,BX
    AND SI,00F0H
    CMP SI,80H
    JB  KK
    ADD BX,0080H
KK: MOV SI,BX
    AND SI,0F00H
    CMP SI,800H
    JB  LL
    ADD BX,0800H 
LL: POP SI
    
    RET
KOR2 ENDP 

END MAIN