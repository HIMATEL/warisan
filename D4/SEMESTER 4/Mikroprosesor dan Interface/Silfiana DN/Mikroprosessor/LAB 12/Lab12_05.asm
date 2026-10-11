TITLE LAB12 NO5
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
      MOV AX,@DATA   ; Memindahkan alamat segmen data ke register AX
      MOV DS,AX      ; Menginisialisasi register data segment (DS) dengan nilai dari AX
      
      MOV AX,0       ; Mengatur register AX menjadi 0
      MOV BX,0       ; Mengatur register BX menjadi 0
      MOV CX,0       ; Mengatur register CX menjadi 0
      MOV DX,0       ; Mengatur register DX menjadi 0
      MOV DI,0       ; Mengatur register DI menjadi 0

      MOV BL,12H     ; Mengatur register BL dengan nilai 12h (8-bit bagian rendah dari 24-bit)
      MOV CX,3456H   ; Mengatur register CX dengan nilai 3456h (16-bit bagian tinggi dari 24-bit)
      MOV BH,78H     ; Mengatur register BH dengan nilai 78h (8-bit pengali)

      ; Mengalikan BL dengan BH, hasilnya disimpan di AX (BL * BH -> AL)
      MOV AL,BL
      MUL BH         ; AL * BH -> AX
      MOV DI,AX      ; Simpan hasil pertama di DI

      ; Mengalikan bagian rendah CX (CL) dengan BH
      MOV AL,CL
      MUL BH         ; AL * BH -> AX
      ADD DX,AX      ; Tambahkan hasil ke DX

      ; Mengalikan bagian tinggi CX (CH) dengan BH
      MOV AL,CH
      MUL BH         ; AL * BH -> AX
      ADD DX,AX      ; Tambahkan hasil ke DX
      
      ; Jika ada overflow, hasil akan berada di DX:DI
      ; Jika tidak, hasil akhir akan ada di DI:DX

      MOV AH,4CH     ; Mengatur AH dengan kode layanan 4Ch (terminasi program)
      INT 21H        ; Memanggil interrupt 21h untuk mengakhiri program
MAIN  ENDP           ; Akhir dari prosedur utama
END MAIN             ; Akhir dari program, mulai eksekusi dari label MAIN
  