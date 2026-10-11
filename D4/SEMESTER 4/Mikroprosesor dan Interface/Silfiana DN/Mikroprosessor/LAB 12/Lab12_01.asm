TITLE LAB12 NO1
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
      
        MOV CH,8H       ; Mengatur register CH (8-bit tinggi dari CX) dengan nilai 08h (8 desimal)
        MOV CL,4H       ; Mengatur register CL (8-bit rendah dari CX) dengan nilai 04h (4 desimal)
            
        MOV AL,CH       ; Memindahkan nilai dari CH ke register AL
        MOV DH,CL       ; Memindahkan nilai dari CL ke register DH
        MUL DH          ; Mengalikan AL dengan DH, hasilnya disimpan di AX
        MOV DH,AL       ; Memindahkan hasil dari AL ke register DH
        MOV AH,4CH  
        INT 21H
MAIN  ENDP
END MAIN        
