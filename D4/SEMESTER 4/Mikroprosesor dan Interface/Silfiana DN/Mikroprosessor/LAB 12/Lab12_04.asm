TITLE LAB12 NO4
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
      
      MOV BX,4312H    ; Mengatur register BX dengan nilai 4312h
      MOV CX,5478H    ; Mengatur register CX dengan nilai 5478h
            
      MOV AX,BX       ; Memindahkan nilai dari BX ke register AX
      MOV DX,CX       ; Memindahkan nilai dari CX ke register DX
      MUL DX          ; Mengalikan AX dengan DX, hasilnya disimpan di DX
      MOV SI,DX       ; Memindahkan hasil dari DX ke register SI
      MOV DX,AX       ; Memindahkan hasil dari AX ke register DX
      
      MOV AH,4CH 
      INT 21H      
MAIN  ENDP 
END MAIN     
   