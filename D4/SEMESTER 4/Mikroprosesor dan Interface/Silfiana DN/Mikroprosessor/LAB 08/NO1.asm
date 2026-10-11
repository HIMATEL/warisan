TITLE LAB8 NO 1
.MODEL SMALL
.STACK 100H

.DATA
BIL DB 23H,77H,1CH,9,0CCH,44H,6EH,77H,0,01BH
    DB 0FFH,0D2H,6CH,81H,33H,22H,0A6H,28H,12H,4
    
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV SI,13H     ; Mengatur SI untuk menunjuk ke elemen ke-13 dari array BIL
     MOV CL,0       ; Menginisialisasi CL (counter) ke nilai 0
     
BARU:MOV AL,[BIL+SI]  ; Mengambil nilai byte dari array BIL pada indeks SI dan memuatnya ke dalam AL
     ADD AL,0         ; Menambahkan 0 ke dalam AL (mungkin hanya untuk kejelasan)
     JZ BKN           ; Melompat ke label BKN jika nilai di AL adalah 0 (nol)
     JS BKN           ; Melompat ke label BKN jika nilai di AL adalah negatif
     
     ; Jika nilai di AL adalah positif, maka inkremen counter CL
     INC CL
     
BKN: DEC SI          ; Mengurangi nilai SI untuk mengambil byte berikutnya dari array BIL
     JNS BARU        ; Melompat ke label BARU jika nilai di SI adalah tidak negatif, untuk melanjutkan loop
          
     MOV AH,4CH
     INT 21H
     
MAIN ENDP
END MAIN  
