TITLE POLA SETENGAH PAPAN CATUR
.MODEL SMALL
.STACK 32
.CODE
MAIN PROC FAR
        MOV AX,0B800H
        MOV ES,AX
        MOV DI,0
        MOV DH,2
LUP:    MOV DL,24
LUP1:   MOV CX,10
        MOV AX,2F00H ;HIJAU
        REP STOSW
        MOV CX,10
        MOV AX,4F00H ;MERAH
        REP STOSW
        DEC DL
        JNZ LUP1
        MOV DL,24
LUP2:   MOV CX,10
        MOV AX,4F00H ;MERAH
        REP STOSW
        MOV CX,10
        MOV AX,2F00H ;HIJAU
        REP STOSW
        DEC DL
        JNZ LUP2
        DEC DH
        JNZ LUP
        MOV AH,4CH
        INT 21H
MAIN ENDP
END  MAIN
