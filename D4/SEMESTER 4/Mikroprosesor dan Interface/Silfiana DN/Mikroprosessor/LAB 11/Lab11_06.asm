TITLE LAB11 NO6
.MODEL SMALL                  
.STACK 100H      
.DATA 
BM1 DW 1A11H,1F11H, 2A22H,2F22H
    DW 3A33H,3F33H, 4A44H,4F44H
    DW 7A77H,7F77H, 1FFFH,1FFFH    
BM2 DW 18 DUP (0)
   
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
        
LUP:    MOV CX,[BM1+SI+2] ; Memindahkan nilai dari BM1[SI+2] ke CX
        MOV AX,[BM1+SI]   ; Memindahkan nilai dari BM1[SI] ke AX    
        MOV DX,AX         ; Menyalin nilai AX ke DX
       
        AND DX,0FFF8H     ; AND DX dengan 0FFF8H (masking bit 3-15)
        ADD DX,AX         ; Menambahkan AX ke DX
        RCL CX,1          ; Rotate CX left through carry
        RCL BX,1          ; Rotate BX left through carry
     
        MOV AX,DX         ; Menyalin nilai DX ke AX
        AND AX,0FF80H     ; AND AX dengan 0FF80H (masking bit 7-15)
        ADD DX,AX         ; Menambahkan AX ke DX
        RCL CX,1          ; Rotate CX left through carry
        RCL BX,1          ; Rotate BX left through carry
        MOV AX,DX         ; Menyalin nilai DX ke AX
        
        AND AX,0F800H     ; AND AX dengan 0F800H (masking bit 11-15)
        ADD DX,AX         ; Menambahkan AX ke DX
        RCL CX,1          ; Rotate CX left through carry
        RCL BX,1          ; Rotate BX left through carry
        MOV AX,DX         ; Menyalin nilai DX ke AX
       
        AND AX,08000H     ; AND AX dengan 08000H (masking bit 15)
        ADD DX,AX         ; Menambahkan AX ke DX
        RCL CX,1          ; Rotate CX left through carry
        RCL BX,1          ; Rotate BX left through carry
        MOV AX,CX         ; Menyalin nilai CX ke AX
       
        AND AX,0FFF8H     ; AND AX dengan 0FFF8H (masking bit 3-15)
        ADD CX,AX         ; Menambahkan AX ke CX
        RCL BX,1          ; Rotate BX left through carry
        MOV AX,CX         ; Menyalin nilai CX ke AX
        
        AND AX,0FF80H     ; AND AX dengan 0FF80H (masking bit 7-15)
        ADD CX,AX         ; Menambahkan AX ke CX
        RCL BX,1          ; Rotate BX left through carry
        MOV AX,CX         ; Menyalin nilai CX ke AX
        
        AND AX,0F800H     ; AND AX dengan 0F800H (masking bit 11-15)
        ADD CX,AX         ; Menambahkan AX ke CX
        RCL BX,1          ; Rotate BX left through carry
        MOV AX,CX         ; Menyalin nilai CX ke AX
        
        AND AX,8000H      ; AND AX dengan 8000H (masking bit 15)
        ADD CX,AX         ; Menambahkan AX ke CX
        RCL BX,1          ; Rotate BX left through carry
        MOV AX,BX         ; Menyalin nilai BX ke AX
       
        AND AX,0FFF8H     ; AND AX dengan 0FFF8H (masking bit 3-15)
        ADD BX,AX         ; Menambahkan AX ke BX
        MOV AX,BX         ; Menyalin nilai BX ke AX
       
        AND AX,0FF80H     ; AND AX dengan 0FF80H (masking bit 7-15)
        ADD BX,AX         ; Menambahkan AX ke BX
        MOV AX,BX         ; Menyalin nilai BX ke AX
        
        AND AX,0F800H     ; AND AX dengan 0F800H (masking bit 11-15)
        ADD BX,AX         ; Menambahkan AX ke BX
        MOV AX,BX         ; Menyalin nilai BX ke AX
        
        AND AX,8000H      ; AND AX dengan 8000H (masking bit 15)
        ADD BX,AX         ; Menambahkan AX ke BX
        
        MOV [BM2+DI+6],0  ; Mengosongkan (0) word ke-4 BM2 pada offset DI+6
        MOV [BM2+DI+4],BX ; Menyalin nilai BX ke BM2 pada offset DI+4
        MOV [BM2+DI+2],CX ; Menyalin nilai CX ke BM2 pada offset DI+2
        MOV [BM2+DI],DX   ; Menyalin nilai DX ke BM2 pada offset DI
        MOV BX,0          ; Mengosongkan (0) register BX
        MOV CX,0          ; Mengosongkan (0) register CX
        MOV DX,0          ; Mengosongkan (0) register DX
        ADD SI,4          ; Menambah SI sebesar 4 untuk memproses word berikutnya
        ADD DI,8          ; Menambah DI sebesar 8 untuk memproses word berikutnya
        CMP SI,24         ; Membandingkan SI dengan 24 (total elemen BM1)
        JNZ LUP           ; Jika SI belum mencapai 24, lompat ke LUP
      
        MOV AH,4CH
        INT 21H
MAIN ENDP
END MAIN 