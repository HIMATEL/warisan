TITLE LAB8 NO 12
.MODEL SMALL
.STACK 100H

.DATA
BIL DB 23H,77H,1CH,9,0CCH,44H,6EH,77H,0,01BH
    DB 0FFH,0D2H,6CH,81H,33H,22H,0A6H,28H,12H,4
    
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX    
      
     MOV SI, 0          ; Mengatur SI untuk menunjuk ke elemen pertama dari array BIL
     MOV CH, 0          ; Menginisialisasi CH (counter) ke nilai 0

BARU:MOV AL, [BIL+SI] ; Mengambil nilai byte dari array BIL pada indeks SI dan memuatnya ke dalam AL
     CMP AL, 24H      ; Membandingkan nilai di AL dengan 24H (36 dalam desimal)
     JL BKN           ; Melompat ke label BKN jika nilai di AL lebih kecil dari 24H
     CMP AL, 0        ; Membandingkan nilai di AL dengan 0
     JL BKN           ; Melompat ke label BKN jika nilai di AL adalah kurang dari 0
     AND AL, 1        ; Melakukan operasi bitwise AND dengan 1 untuk memeriksa apakah nilai di AL adalah bilangan ganjil
     JNZ BKN          ; Melompat ke label BKN jika nilai di AL adalah bilangan ganjil

     ; Jika nilai di AL lebih kecil dari atau sama dengan 24H, maka inkremen counter CH
     INC CH

BKN:INC SI         ; Menginkremen nilai SI untuk mengambil byte berikutnya dari array BIL
    CMP SI, 20     ; Memeriksa apakah sudah mencapai akhir array
    JNZ BARU       ; Jika belum, lompat ke label BARU untuk melanjutkan loop

     MOV AH,4CH
     INT 21H
     
MAIN ENDP
END MAIN            

