TITLE LAB13 NO3
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX  
     
     MOV AX,0 
     MOV BX,0
     MOV CX,0
     MOV DX,0
     
     MOV BX,1234H ; Mengatur register BX dengan nilai 1234h (4660 desimal)
     MOV CH,0AAH  ; Mengatur register CH dengan nilai 0AAh (170 desimal)
     MOV AX,BX    ; Memindahkan nilai dari BX ke register AX
     MOV CL,CH    ; Memindahkan nilai dari CH ke register CL (CL akan menjadi pembagi)
     MOV CH,0     ; Mengatur CH menjadi 0 untuk memastikan CX hanya berisi nilai dari CL
     DIV CX       ; Membagi AX dengan CX, hasil bagi disimpan di AX dan sisa bagi disimpan di DX
     MOV CX,0     ; Mengatur register CX menjadi 0
     MOV CX,DX    ; Memindahkan nilai sisa bagi (DX) ke register CX
     MOV DX,AX    ; Memindahkan hasil bagi (AX) ke register DX

     MOV AH,4CH
     INT 21H

MAIN ENDP
END MAIN  
