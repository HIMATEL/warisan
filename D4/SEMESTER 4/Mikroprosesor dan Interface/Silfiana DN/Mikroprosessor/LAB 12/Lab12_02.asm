TITLE LAB12 NO2
.MODEL SMALL                  
.STACK 100H
.DATA
.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
      
        MOV AX,0        ; Mengatur register AX menjadi 0
        MOV CX,0        ; Mengatur register CX menjadi 0
        MOV DX,0        ; Mengatur register DX menjadi 0
      
        MOV CH,23H       ; Mengatur register CH (8-bit tinggi dari CX) dengan nilai 23h (23 desimal)
        MOV CL,15H       ; Mengatur register CL (8-bit rendah dari CX) dengan nilai 15h (15 desimal)
            
        MOV AL,CH       ; Memindahkan nilai dari CH ke register AL
        MOV DH,CL       ; Memindahkan nilai dari CL ke register DH
        MUL DH          ; Mengalikan AL dengan DH, hasilnya disimpan di AX
        MOV DX,AX       ; Memindahkan hasil dari AX ke register DX
       
        MOV AH,4CH  
        INT 21H
MAIN  ENDP
END MAIN        
