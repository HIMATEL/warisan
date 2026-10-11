TITLE LAB8 NO 3
.MODEL SMALL
.STACK 100H

.DATA
BIL DB 23H,77H,1CH,9,0CCH,44H,6EH,77H,0,01BH
    DB 0FFH,0D2H,6CH,81H,33H,22H,0A6H,28H,12H,4
    
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
               
     MOV SI,13H   ; Mengatur SI untuk menunjuk ke elemen ke-13 dari array BIL
     MOV BL,0     ; Menginisialisasi BL (counter) ke nilai 0
     
BARU:MOV AL,[BIL+SI]  ; Mengambil nilai byte dari array BIL pada indeks SI dan memuatnya ke dalam AL
     SHR AL,1         ; Bergeserkan bit ke kanan 1 kali, setara dengan membagi nilai dengan 2
     JNC BKN          ; Melompat ke label BKN jika tidak ada carry setelah operasi shift (nilai genap)
     
     ; Jika nilai setelah digeser ke kanan 1 kali adalah ganjil, maka inkremen counter BL
     INC BL
     
BKN: DEC SI          ; Mengurangi nilai SI untuk mengambil byte berikutnya dari array BIL
     JNS BARU        ; Melompat ke label BARU jika nilai di SI adalah tidak negatif, untuk melanjutkan loop
      
     MOV AH,4CH
     INT 21H
     
MAIN ENDP
END MAIN   
