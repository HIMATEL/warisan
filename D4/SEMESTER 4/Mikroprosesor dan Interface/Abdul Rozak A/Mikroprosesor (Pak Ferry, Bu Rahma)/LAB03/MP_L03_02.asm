TITLE LAB03 NO2
.MODEL SMALL
.STACK 100H

.DATA
    BM1 DB 93H,77H,80H,94H,32H,44H,85H,47H,99H,75H
    BM2 DB 37H,49H,82H,81H,93H,27H,85H,23H,99H,12H
    BM3 DB 10 DUP(0) 
    BM4 DB 10 DUP(0)

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV AL,0           ;inisialisasi AL, BX, dan SI agar diisi oleh 0
     MOV BX,0
     MOV SI,0
     
LUP: MOV AL,[BM1+SI]    ;register AL diisi oleh isi BM1 dengan indeks SI
     ADD AL,[BM2+SI]    ;register AL ditambahkan oleh isi BM2 dengan indeks SI
     DAA                ;koreksi isi register AL agar menjadi desimal
     MOV [BM3+SI],AL    ;memindahkan isi register AL ke BM3 dengan indeks SI
     ADC [BM4+SI],0     ;menambahkan carry ke BM4 dengan indeks SI
     INC SI
     
     CMP SI,0AH         ;membandingkan SI dengan AH
     JB LUP             ;ketika pembandingan SI dengan AH sama dengan 0 maka keluar dari loop
           
                        ;hasil penjumlahan dapat dilihat di vars setelah di RUN
       
     MOV AH,4CH
     INT 21H
    
MAIN ENDP
END MAIN