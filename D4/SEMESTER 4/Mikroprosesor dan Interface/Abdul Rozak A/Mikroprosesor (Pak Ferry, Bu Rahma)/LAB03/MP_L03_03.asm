TITLE L03_03
.MODEL SMALL
.STACK 100H

.DATA
    BM1 DW 1693H,7887H,6381H,94H,32H,4423H,1987H,4700H,4902H,7935H
    BM2 DW 3437H,4996H,63H,8109H,9443H,2762H,4023H,6723H,3225H,1298H
    BM3 DW 10 DUP(0) 
    BM4 DW 10 DUP(0)

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX 
     MOV SI,0
     
LUP: MOV DX,0             ;inisialisasi DX,CX,BX, dan AX agar diisi oleh 0
     MOV CX,0
     MOV BX,0
     MOV AX,0
     
     MOV DX,[BM1+SI]      ;memindahkan isi BM1 indeks SI ke DX
     MOV CX,[BM2+SI]      ;memindahkan isi BM2 indeks SI ke CX
     
     MOV AL,DL            ;memindahkan isi register DL ke AL agar bisa dikoreksi
     ADD AL,CL            ;menambahkan isi register CL ke AL
     DAA                  ;koreksi isi register AL agar berubah ke desimal
     MOV BL,AL            ;memindahkan isi register AL ke BL
     ADC BH,0             ;menambahkan carry ke register BH
       
     MOV AL,BH            ;memindahkan isi register BH ke AL
     MOV BH,0             ;mengisi BH dengan 0
     
     ADD AL,DH            ;menambahkan isi register DH ke AL
     ADD AL,CH            ;menambahkan isi register CH ke AL
     DAA                  ;koreksi isi register AL agar berubah ke desimal
     ADC BH,0             ;menambahkan carry ke register BH
     
     MOV DX,0             ;membuat register DX bernilai 0
     MOV DL,BL            ;memindahkan isi register BL ke DL
     MOV DH,AL            ;memindahkan isi register AL ke DH
     MOV [BM3+SI],DX      ;memasukkan isi register DX ke BM3 indeks SI
     
     MOV CX,0             ;CX dibuat 0
     MOV CL,BH            ;isi register BH dimasukkan ke CL
     MOV [BM4+SI],CX      ;isi register CX dimasukkan ke BM4+SI
     
                          
     INC SI               ;SI dinaikkan nilainya 2 kali karena alamat yang digunakan akan naik 2
     INC SI
     CMP SI,14H           ;membandingkan nilai SI dan 14H
     JNZ LUP              ;jika hasil pembandingan 0, maka keluar dari loop
     
       
     MOV AH,4CH
     INT 21H
                          ;pada program ini, operasi penjumlahan harus dilakukan tiap 2 digit karena
                          ;harus dilakukan di register AL. untuk hasil penjumlahan disimpan terlebih
                          ;dahulu ke DX lalu disimpan ke BM3, lalu untuk carry nya disimpan di BM4 
MAIN ENDP
END MAIN