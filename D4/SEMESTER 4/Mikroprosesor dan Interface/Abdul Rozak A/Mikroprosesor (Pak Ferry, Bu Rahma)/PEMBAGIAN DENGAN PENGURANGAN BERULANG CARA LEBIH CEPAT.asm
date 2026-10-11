TITLE PEMBAGIAN DENGAN PENGURANGAN BERULANG CARA LEBIH CEPAT
.MODEL SMALL 
.STACK 100H   ; OPERAN: REG BX/CH
.DATA         ; DX = HASIL BAGI, AL = SISA BAGI
.CODE         ; DIPROGRAM: 23 APR 2024
MAIN    PROC  
        PUSH BX  ; PEMBAGI AX DIGESER KE KIRI
        MOV SI,1 ; INCREMENTER SI DIGANDAKAN        
        MOV DX,0 ; NILAI AWAL HASIL BAGI   
        MOV AL,CH ; AX = PEMBAGI
        MOV AH,0
        CMP BX,AX ; JIKA BX < AX PROSES SELESAI 
        JB HH
KK:     CMP AH,80H ; JIKA AX DIGESER LAGI, MSB NYA HILANG
        JAE YY 
        SHL SI,1 
        SHL AX,1
        CMP BX,AX
        JB TT    ; TERLALU KE KIRI [BX<AX]
        JMP KK  
TT:     SHR SI,1 ; geser balik 1 posisi bit
        SHR AX,1 ; KE KANAN
YY:     CMP BX,AX
        JB ZZ     ; [BX < AX]
        SUB BX,AX ; PROSES PENGURANGAN [SAAT BX >= AX]
        ADD DX,SI ; SET HASIL BAGI  
        JMP YY    ; ULANGI PROSES
ZZ:     SHR SI,1 ; SI terkecil=1
        CMP SI,0
        JZ HH
        SHR AX,1
        JMP YY
HH:     MOV AL,BL ; AL=SISA BAGI
        POP BX               
        MOV AH,4CH
        INT 21H
MAIN    ENDP