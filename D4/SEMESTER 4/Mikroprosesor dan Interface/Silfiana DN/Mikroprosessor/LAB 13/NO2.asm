TITLE LAB13 NO2
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV AX,0
     
     MOV CH,0B2H  ; Mengatur register CH dengan nilai 0B2h (178 desimal)
     MOV CL,23H   ; Mengatur register CL dengan nilai 23h (35 desimal)
     MOV AL,CH    ; Memindahkan nilai dari CH ke register AL
     DIV CL       ; Membagi AL dengan CL, hasil bagi disimpan di AL dan sisa di AH
     MOV DL,AL    ; Memindahkan hasil bagi (AL) ke register DL
     MOV DH,AH    ; Memindahkan sisa hasil bagi (AH) ke register DH
     
     MOV AH,4CH
     INT 21H

MAIN ENDP
END MAIN  
