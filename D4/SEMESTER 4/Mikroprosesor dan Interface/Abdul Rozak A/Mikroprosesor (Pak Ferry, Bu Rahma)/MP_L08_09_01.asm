TITLE MENCARI DATA TERKECIL DARI 8 DATA BINER 24 BIT[SIGNED]
.MODEL SMALL    ;Simpan data terkecil di:Reg CL:DX
.STACK 100H
.DATA
DAT DB 6FH,8CH,36H  ; 368C6FH
    DB 0FFH,45H,77H ; 7745FFH
    DB 44H,76H,0A4H ; A47644H
    DB 0F4H,9DH,0A5H; A59DF4H
    DB 88H,77H,66H  ; 667788H
    DB 66H,45H,77H  ; 774566H
    DB 68H,8CH,36H  ; 368C68H
    DB 21H,34H,95H  ; 953421H
.CODE
MAIN    PROC
        MOV AX, @DATA
        MOV DS,AX
        MOV SI,0
        MOV DL,[DAT+SI]
        MOV DH,[DAT+SI+1]
        MOV CL,[DAT+SI+2]
        ADD SI,3
LUP1:   CMP CL,[DAT+SI+2]
        JA BSR
        JB KCL
        CMP DH,[DAT+SI+1]
        JA BSR
        JB KCL
        CMP DL,[DAT+SI] 
        JA BSR
        JB KCL
        JMP KCL
BSR:    MOV DL,[DAT+SI]
        MOV DH,[DAT+SI+1]
        MOV CL,[DAT+SI+2]
KCL:    ADD SI,3
        CMP SI,24 
        JNE LUP1
        MOV AH,4CH
        INT 21H
MAIN    ENDP
END MAIN