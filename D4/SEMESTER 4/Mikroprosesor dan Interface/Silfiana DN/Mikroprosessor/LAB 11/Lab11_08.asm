TITLE LAB11 NO8
.MODEL SMALL                  
.STACK 100H      
.DATA
BM1 DB 11H,22H,33H,44H,55H,66H,77H,88H
    DB 99H,10H,20H,30H,40H,50H,70H,8AH
BM2 DB 16 DUP(0)
 
.CODE
MAIN PROC   
        MOV AX,@DATA
        MOV DS,AX
        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0   
        
LUP:    MOV CH,[BM1+SI]     ; Memuat nilai dari BM1[SI] ke dalam CH
        MOV BL,CH           ; Menyalin nilai CH ke dalam BL
        AND BL,7            ; Melakukan operasi AND dengan 7 pada BL
        MOV CL,CH           ; Menyalin nilai CH ke dalam CL
        AND CL,0F8H         ; Melakukan operasi AND dengan 0F8H pada CL
        SHR CL,1            ; Menggeser nilai CL ke kanan sebanyak 1 kali
        ADD CL,BL           ; Menambahkan nilai BL ke dalam CL
        MOV [BM2+SI],CL     ; Menyimpan nilai CL di dalam BM2[SI]
        INC SI              ; Meningkatkan nilai SI
        CMP SI,16           ; Membandingkan nilai SI dengan 16
        JNZ LUP             ; Jika SI tidak sama dengan 16, kembali ke LUP
      
        MOV AH,4CH   
        INT 21H
        
MAIN  ENDP
END MAIN    
