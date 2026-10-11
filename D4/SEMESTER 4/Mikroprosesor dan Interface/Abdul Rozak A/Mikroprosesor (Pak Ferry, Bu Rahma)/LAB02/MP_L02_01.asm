TITLE LAB02 NO1
.MODEL SMALL
.STACK 100H

.DATA
    BM1 DB 93H,77H,1CH,9AH,0CCH,44H,6EH,77H
    BM2 DB 0FFH,0D2H,6CH,81H,93H,62H,0A6H,0D8H
    BM3 DW 8 DUP(0)

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV SI,0          ;inisialisasi SI agar 0
     MOV DX,0          ;inisialisasi DX agar 0

     
LUP1:ADD DL,[BM1+SI]   ;register DL ditambahkan dengan isi BM1 index SI
     INC SI            ;isi register SI bertambah 1
     ADC DH,0          ;register DH ditambah carry flag
     CMP SI,8H         ;isi register SI dibandingkan dengan 8H
     JNZ LUP1          ;jika hasil pembandingan SI dengan 8H 
                       ;tidak sama dengan 0 maka kembali ke LUP1
                            
     MOV SI,0          ;register SI diisi dengan 0
LUP2:ADD DL,[BM2+SI]   ;register DL ditambahkan dengan isi BM2 index SI
     INC SI            ;isi register SI bertambah 1
     ADC DH,0          ;register DH ditambah carry flag
     CMP SI,8H         ;isi register SI dibandingkan dengan 8H
     JNZ LUP2          ;jika hasil pembandingan SI dengan 8H 
                       ;tidak sama dengan 0 maka kembali ke LUP1
     
     MOV [BM3],DX      ;BM3 dimasukkan isi register DX        
       
     MOV AH,4CH
     INT 21H
    
MAIN ENDP
END MAIN
