TITLE LAB8 NO 10
.MODEL SMALL
.STACK 100H

.DATA
BIL DB 23H,77H,1CH,9,0CCH,44H,6EH,77H,0,01BH
    DB 0FFH,0D2H,6CH,81H,33H,22H,0A6H,28H,12H,4
    
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX    
      
     MOV SI, 0        ; Mengatur SI untuk menunjuk ke elemen pertama dari array BIL
     MOV AL, 0        ; Menginisialisasi AL (counter) ke nilai 0

BARU:MOV BH, [BIL+SI] ; Mengambil nilai byte dari array BIL pada indeks SI dan memuatnya ke dalam BH
     CMP BH, 0B4H     ; Membandingkan nilai di BH dengan 0B4H (180 dalam desimal)
     JB BKN           ; Melompat ke label BKN jika nilai di BH lebih kecil dari 0B4H
     AND BH, 1        ; Melakukan operasi bitwise AND dengan 1 untuk memeriksa apakah nilai di BH adalah bilangan ganjil
     JZ BKN           ; Melompat ke label BKN jika nilai di BH adalah bilangan genap

     ; Jika nilai di BH lebih besar atau sama dengan 0B4H, maka inkremen counter AL
     INC AL

BKN: INC SI         ; Menginkremen nilai SI untuk mengambil byte berikutnya dari array BIL
     CMP SI, 20     ; Memeriksa apakah sudah mencapai akhir array
     JNZ BARU       ; Jika belum, lompat ke label BARU untuk melanjutkan loop

     MOV AH,4CH
     INT 21H
     
MAIN ENDP
END MAIN            

