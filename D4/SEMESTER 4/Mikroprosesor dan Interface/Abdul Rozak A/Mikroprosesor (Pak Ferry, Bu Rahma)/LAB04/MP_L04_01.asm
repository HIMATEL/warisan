TITLE L04_01
.MODEL SMALL
.STACK 100H
.DATA 
BM1 DB 45H,77H,50H,64H,32H,44H,35H,47H,47H,75H
BM2 DB 37H,47H,72H,51H,53H,27H,35H,23H,47H,72H
BM3 DB 10 DUP(0)
BM4 DB 10 DUP(0)


.CODE
MAIN PROC  
     MOV AX,@DATA
     MOV DS,AX 
     
        MOV SI,0          ;inisialisasi SI diisi oleh 0
LUP1:   MOV AH,0          ;register AH di 0 kan
        MOV AL,[BM1+SI]   ;memasukkan isi BM1 indeks SI ke register AL
        ADD AL,[BM2+SI]   ;manmbahkan isi BM2 indeks SI ke register AL
        ADC AH,0          ;menambahkan carry ke register AH
        MOV CL,AL         ;memasukkan isi register AL ke CL untuk dikoreksi
        AND CL,0FH        ;mengubah isi register CL menjadi satu digit saja untuk dicek
        CMP CL,08H        ;mengecek digit terakhir CL, dibandingkan dengan 8H
        JB  SKIP          ;jika hasil cek CL kurang dari 8, maka akan langsung lumpat ke SKIP   
                          ;jika lebih dari 8, maka akan dikoreksi
        ADD AL,08H        ;digit terakhir AL ditambah dengan 8H agar bisa menjadi oktal 
SKIP:   MOV CL,AL         ;AL yang sudah dikoreksi digit terakhirnya dipindahkan ke CL
        AND CL,0F0H       ;mengubah isi register CL menjadi digit kedua terakhir saja untuk dicek
        CMP CL,80H        ;mengecek digit, dibandingkan dengan 8H
        JB  SKIP1         ;jika hasil cek CL kurang dari 80H, maka akan langsung lumpat ke SKIP   
                          ;jika lebih dari 80H, maka akan dikoreksi
        ADD AX,80H        ;isi register AX ditambah dengan 80H, sekarang data sudah menjadi oktal
SKIP1:  MOV [BM3+SI],AL   ;memasukkan isi register AL ke BM3 indeks SI
        MOV [BM4+SI],AH   ;memasukkan isi register AH atau carry ke BM4 indeks SI
        INC SI            ;SI bertambah
        CMP SI,0AH        ;loop untuk mengulang sampai 9 kali
        JB  LUP1
          
     MOV AH,4CH
     INT 21h     
MAIN ENDP                 ;program akan menjumlahkan setiap pasangan bilangan oktal
END MAIN                  ;kemudian hasilnya disimpan di BM3 dan BM4