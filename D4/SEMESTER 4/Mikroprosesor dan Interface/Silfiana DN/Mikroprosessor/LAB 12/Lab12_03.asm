TITLE LAB12 NO3
.MODEL SMALL                  
.STACK 100H      
.DATA
.CODE
MAIN PROC
      MOV AX,@DATA
      MOV DS,AX
      
      MOV AX,0        ; Mengatur register AX menjadi 0
      MOV BX,0        ; Mengatur register BX menjadi 0
      MOV CX,0        ; Mengatur register CX menjadi 0
      MOV DX,0        ; Mengatur register DX menjadi 0
      
      MOV BX,1234H    ; Mengatur register BX dengan nilai 1234h
      MOV CH,54H      ; Mengatur register CH dengan nilai 54h
            
      MOV AX,BX       ; Memindahkan nilai dari BX ke register AX
      MOV DL,CH       ; Memindahkan nilai dari CH ke register DL
      MUL DX          ; Mengalikan AX dengan DL, hasilnya disimpan di AX
      MOV CL,DL       ; Memindahkan hasil dari DL ke register CL
      MOV DX,AX       ; Memindahkan hasil dari AX ke register DX
      
      MOV AH,4CH 
      INT 21H      
MAIN  ENDP 
END MAIN     

      
  