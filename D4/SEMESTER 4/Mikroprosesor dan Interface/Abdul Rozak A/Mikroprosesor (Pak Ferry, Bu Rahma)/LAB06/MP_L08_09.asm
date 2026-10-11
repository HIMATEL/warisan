TITLE MENCARI DATA TERKECIL DARI 8 DATA BINER 24 BIT[UNSIGNED]
.MODEL SMALL    ;Simpan data terkecil di:Reg CL:DX
.STACK 100H
.DATA
DAT DB 65H,0FCH,36H  ; 36FC65H
    DB 0FFH,45H,77H ; 7745FFH
    DB 54H,76H,98H  ; 987654H
    DB 0D4H,6CH,0A5H; A56CD4H
    DB 88H,77H,66H  ; 667788H
    DB 66H,45H,77H  ; 774566H
    DB 6FH,8CH,36H  ; 368C6FH
    DB 21H,34H,85H  ; 853421H
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