TITLE LAB07 NO10
.MODEL SMALL    ;Simpan data terkecil di:Reg CL:DX
.STACK 100H
.DATA 
DAT DB 65H,8CH,36H  ; 368C65H
    DB 0FFH,45H,77H ; 7745FFH
    DB 54H,76H,98H  ; 987654H
    DB 0D4H,6CH,0A5H; A56CD4H
    DB 88H,77H,66H  ; 667788H
    DB 66H,45H,77H  ; 774566H
    DB 6FH,8CH,36H  ; 368C6FH
    DB 21H,34H,05H  ; 053421H
.CODE
MAIN    PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV SI, 0
        MOV DL, [DAT+SI]   ; Memuat byte pertama dari data ke dalam register DL
        MOV DH, [DAT+SI+1] ; Memuat byte kedua dari data ke dalam register DH
        MOV CL, [DAT+SI+2] ; Memuat byte ketiga dari data ke dalam register CL
        ADD SI, 3      ; Menambahkan 3 ke SI untuk menggeser ke data berikutnya dalam array DAT

LUP1:                  ; Label untuk awal loop
        CMP CL, [DAT+SI+2] ; Membandingkan byte ketiga dari data saat ini dengan byte ketiga dari data selanjutnya
        JG BSR             ; Melompat ke BSR jika byte ketiga dari data saat ini lebih besar dari byte ketiga dari data selanjutnya
        JL KCL             ; Melompat ke KCL jika byte ketiga dari data saat ini lebih kecil dari byte ketiga dari data selanjutnya
        CMP DH, [DAT+SI+1] ; Membandingkan byte kedua dari data saat ini dengan byte kedua dari data selanjutnya
        JG BSR             ; Melompat ke BSR jika byte kedua dari data saat ini lebih besar dari byte kedua dari data selanjutnya
        JL KCL             ; Melompat ke KCL jika byte kedua dari data saat ini lebih kecil dari byte kedua dari data selanjutnya
        CMP DL, [DAT+SI]   ; Membandingkan byte pertama dari data saat ini dengan byte pertama dari data selanjutnya
        JG BSR             ; Melompat ke BSR jika byte pertama dari data saat ini lebih besar dari byte pertama dari data selanjutnya
        JL KCL             ; Melompat ke KCL jika byte pertama dari data saat ini lebih kecil dari byte pertama dari data selanjutnya
        JMP KCL            ; Melompat ke KCL jika semua byte sama

BSR:    MOV DL, [DAT+SI]   ; Menyalin byte pertama dari data saat ini ke dalam register DL
        MOV DH, [DAT+SI+1] ; Menyalin byte kedua dari data saat ini ke dalam register DH
        MOV CL, [DAT+SI+2] ; Menyalin byte ketiga dari data saat ini ke dalam register CL

KCL:    ADD SI, 3      ; Menambahkan 3 ke SI untuk menggeser ke data berikutnya dalam array DAT
        CMP SI, 24     ; Membandingkan SI dengan 24 (ukuran total data dalam bit)
        JNE LUP1       ; Melompat kembali ke LUP1 jika SI belum mencapai 24        
        MOV AH, 4CH    ; Menetapkan fungsi exit (4CH) ke dalam register AH
        INT 21H        ; Memanggil sistem operasi DOS untuk keluar
        
MAIN ENDP
END MAIN
