TITLE PENGURANGAN
.MODEL SMALL
.STACK 100H
.DATA
  DAT1 DD 8A7CD679H
  DAT2 DD ABCD668H
  DAT3 DD 0

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV CX,[DAT1]      ;DAT1 alamat 0 dan 1 (4digit terakhir) disimpan di register CX
     MOV BX,[DAT1+2]    ;DAT1 alamat 2 dan 3 (4digit pertama) disimpan di register BX
     SUB CX,[DAT2]      ;pengurangan isi register CX dengan DAT2 alamat 0 dan 1
     SBB BX,[DAT2+2]    ;pengurangan isi register BX dengan DAT2 alamat 2 dan 3 dengan
                        ;borrow dari pengurangan sebelumnya
     
     MOV [DAT3],CX      ;isi register CX disimpan di DAT3 alamat 0 dan 1
     MOV [DAT3+2],BX    ;isi register BX disimpan di DAT3 alamat 2 dan 3
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN 