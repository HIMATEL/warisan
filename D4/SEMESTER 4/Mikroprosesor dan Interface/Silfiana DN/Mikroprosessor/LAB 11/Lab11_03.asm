TITLE LAB 12 NO3
.MODEL SMALL                  
.STACK 100H      
.DATA
BM1 DB 11H,22H,33H,44H,55H,66H,77H,88H
    DB 99H,11H,13H,15H,17H,19H,1AH,1BH
BM2 DW 16 DUP(0)
  
.CODE
MAIN PROC   
        MOV AX,@DATA 
        MOV DS,AX
        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0
        MOV SI,0
        MOV DI,0
      
LUP:    MOV CH,[BM1+SI]  ;Memindahkan nilai dari BM1[SI] ke register CH
        MOV DH,0         ;Mengatur register DH menjadi 0
        MOV DL,CH        ;Memindahkan nilai dari CH ke DL
        AND DL,0F8H      ;Melakukan operasi AND pada DL dengan 0F8H (11111000) untuk mengambil bit tertentu
        ADD DL,CH        ;Menambahkan nilai CH ke DL
        ADC DH,0         ;Menambahkan nilai carry ke DH
        MOV BX,DX        ;Memindahkan nilai DX ke BX
        
        AND BX,0FF80H    ;Melakukan operasi AND pada BX dengan 0FF80H (1111111110000000) untuk mengambil bit tertentu
        ADD DX,BX        ;Menambahkan nilai BX ke DX
        MOV [BM2+DI],DX  ;Menyimpan nilai DX ke dalam array BM2 pada indeks DI
        INC SI           ;Menambah nilai SI sebesar 1 (menuju ke elemen berikutnya di BM1)
        ADD DI,2         ;Menambah nilai DI sebesar 2 (menuju ke elemen berikutnya di BM2, karena BM2 adalah array kata)
        CMP SI,16        ;Membandingkan nilai SI dengan 16 (panjang array BM1)
        JNZ LUP          ;Lompat ke LUP jika SI tidak sama dengan 16 (mengulangi loop)
      
        MOV AH,4CH
        INT 21H
MAIN ENDP
END MAIN      
