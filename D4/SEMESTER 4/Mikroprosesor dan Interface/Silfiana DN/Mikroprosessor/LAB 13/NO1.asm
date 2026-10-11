TITLE LAB13 NO1
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV AX,0
     
     MOV CH,0AH   ; Mengatur register CH dengan nilai 0Ah (10 desimal)
     MOV CL,3H    ; Mengatur register CL dengan nilai 03h (3 desimal)
     MOV AL,CH    ; Memindahkan nilai dari CH ke register AL
     DIV CL       ; Membagi AL dengan CL, hasil bagi disimpan di AL dan sisa di AH
     MOV DL,AL    ; Memindahkan hasil bagi (AL) ke register DL
     MOV DH,AH    ; Memindahkan sisa hasil bagi (AH) ke register DH
     
     MOV AH,4CH
     INT 21H

MAIN ENDP
END MAIN  
