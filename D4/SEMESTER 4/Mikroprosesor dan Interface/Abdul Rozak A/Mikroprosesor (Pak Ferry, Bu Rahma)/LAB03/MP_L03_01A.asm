TITLE L03_01
.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX 
     
     MOV AX,0   ;inisialisasi AX dan BX agar diisi 0
     MOV BX,0  
     ADD AL,97H ;menambahkan isi register AL dengan 97H
     DAA        ;dikoreksi agar menjadi desimal
     ADC BH,0   ;menjumlahkan carry dengan isi register BH
     ADD AL,69H ;menambahkan isi register AL dengan 69H
     DAA
     ADC BH,0
     ADD AL,84H ;menambahkan isi register AL dengan 84H
     DAA 
     ADC BH,0
     
     
     MOV BL,AL  ;memindahkan isi register AL ke BL
     MOV AL,BH  ;memindahkan isi register BH ke AL agar bisa dikoreksi
     DAA        ;dikoreksi agar menjadi desimal
     MOV BH,AL  ;memindahkan lagi isi register AL ke BH
       
     MOV AH,4CH 
     INT 21H
MAIN ENDP
END MAIN        ;hasil penjumlahan disimpan di register BX