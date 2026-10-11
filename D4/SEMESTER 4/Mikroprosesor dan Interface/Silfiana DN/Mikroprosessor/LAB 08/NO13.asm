TITLE LAB8 NO 13
.MODEL SMALL
.STACK 100H

.DATA
BIL DB 23H,77H,1CH,9,0CCH,44H,6EH,77H,0,01BH
    DB 0FFH,0D2H,6CH,81H,33H,22H,0A6H,28H,12H,4
    
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX    
      
     MOV SI,0        ; Mengatur SI untuk menunjuk ke elemen pertama dari array BIL
     MOV DL,0        ; Menginisialisasi AL (counter) ke nilai 0

BARU:MOV AL,[BIL+SI] ; Mengambil nilai byte dari array BIL pada indeks SI dan memuatnya ke dalam BL
     CMP AL,64H      ; Membandingkan nilai di BL dengan 64H
     JG BKN          ; Melompat pada label BKN, jika nilai AL lebih besar dari 64H
     CMP AL,0        ; Membandingkan nilai di BL dengan 0
     JL BKN          ; Melompat pada label BKN, jika nilai di AL kurang dari 0
     AND AL,1        ; Melakukan operasi bitwise AND dengan 1 untuk memeriksa apakah nilai di BL adalah bilangan ganjil
     JNZ BKN         ; Melompat pada label BKN, jika nilai di AL adalah ganjil

     ; Jika nilai di BL lebih besar atau sama dengan 64H, maka inkremen counter DL
     INC DL

BKN: INC SI          ; Menginkremen nilai SI untuk mengambil byte berikutnya dari array BIL
     CMP SI, 20      ; Memeriksa apakah sudah mencapai akhir array
     JNZ BARU        ; Jika belum, lompat ke BARU untuk melanjutkan loop
     
     MOV AH,4CH
     INT 21H
     
MAIN ENDP
END MAIN            

