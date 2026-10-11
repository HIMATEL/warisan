TITLE PEMBAGIAN, SHIFT AND SUBTRACT
.MODEL SMALL     ; DH/DL; HB==>CL; SB==>CH
.STACK 100H 
.DATA
.CODE
UTAMA    PROC 
        MOV CL,0  
        MOV CH,DH
L1:     CMP CH,DL
        JB AKH
        MOV CH,0
        MOV CL,DH
        MOV AH,8
LUP:    SHL CX,1
        CMP CH,DL
        JB SANA
        SUB CH,DL
        INC CL
SANA:   DEC AH
        JNZ LUP
AKH:    MOV AH,4CH
        INT 21H
UTAMA ENDP
END  UTAMA