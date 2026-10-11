TITLE LAB03 NO 1
.MODEL SMALL
.STACK 100H

.DATA
.CODE
MAIN PROC
MOV AL,97H
ADD AL,69H
ADD AL,84H
DAA


MOV AH, 4CH      ; Set fungsi exit
INT 21H          ; Panggil sistem untuk keluar

MAIN ENDP
END MAIN


