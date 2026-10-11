TITLE LAB12 NO4
.MODEL SMALL                  
.STACK 100H      
.DATA 
BM1 DW 1111H,2222H,3333H,4444H
    DW 5555H,6666H,7777H,8888H
BM2 DB 24 DUP (0)
   
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
      
LUP:    MOV DX,[BM1+SI]       ; Memindahkan nilai dari array BM1 pada indeks SI ke register DX
        MOV BX,DX             ; Menyalin nilai DX ke BX
        AND BX,0FFF8H         ; Masking bit 0-2 dari BX (hanya menyisakan bit 3-15)
        ADD DX,BX             ; Menambahkan nilai BX ke DX
        RCL CL,1              ; Rotate carry left pada CL sebanyak 1 bit
        MOV BX,DX             ; Menyalin nilai DX ke BX
        AND BX,0FF80H         ; Masking bit 0-6 dari BX (hanya menyisakan bit 7-15)
        ADD DX,BX             ; Menambahkan nilai BX ke DX
        RCL CL,1              ; Rotate carry left pada CL sebanyak 1 bit
        MOV BX,DX             ; Menyalin nilai DX ke BX
        AND BX,0F800H         ; Masking bit 0-10 dari BX (hanya menyisakan bit 11-15)
        ADD DX,BX             ; Menambahkan nilai BX ke DX
        RCL CL,1              ; Rotate carry left pada CL sebanyak 1 bit
        MOV BX,DX             ; Menyalin nilai DX ke BX
        AND BX,08000H         ; Masking bit 0-14 dari BX (hanya menyisakan bit 15)
        ADD DX,BX             ; Menambahkan nilai BX ke DX
        RCL CL,1              ; Rotate carry left pada CL sebanyak 1 bit
        MOV BH,CL             ; Menyalin nilai CL ke BH
        AND CL,0F8H           ; Masking bit 0-2 dari CL (hanya menyisakan bit 3-7)
        ADD CL,BH             ; Menambahkan nilai BH ke CL

        MOV [BM2+DI+3],CH     ; Menyalin nilai CH ke array BM2 pada offset DI+3
        MOV [BM2+DI+2],CL     ; Menyalin nilai CL ke array BM2 pada offset DI+2
        MOV [BM2+DI+1],DH     ; Menyalin nilai DH ke array BM2 pada offset DI+1
        MOV [BM2+DI],DL       ; Menyalin nilai DL ke array BM2 pada offset DI
        MOV BX,0              ; Mengatur ulang register BX menjadi 0
        MOV DX,0              ; Mengatur ulang register DX menjadi 0
        MOV CX,0              ; Mengatur ulang register CX menjadi 0
        ADD SI,2              ; Menambahkan 2 ke SI (melompat ke word berikutnya di BM1)
        ADD DI,4              ; Menambahkan 4 ke DI (melompat ke 4 byte berikutnya di BM2)
        CMP SI,16             ; Membandingkan nilai SI dengan 16
        JNZ LUP               ; Lompat ke LUP jika SI tidak sama dengan 16 (looping)

        MOV AH,4CH
        INT 21H
MAIN ENDP
END MAIN     
 