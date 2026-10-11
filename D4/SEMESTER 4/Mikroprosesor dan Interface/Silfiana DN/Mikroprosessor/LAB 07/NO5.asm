TITLE LAB07 NO5
.MODEL SMALL
.STACK 100H

.DATA 
DAT1 DB 23H,56H,22H,8AH,0F3H,66H,8H,7CH    

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV ES,AX
     
     MOV CX,8        ; Memuat nilai 8 ke dalam register CX (jumlah elemen yang akan diproses)
     MOV AL,DAT1     ; Memuat byte pertama dari DAT1 ke dalam register AL
     LEA DI,DAT1     ; Mengatur DI ke alamat offset dari variabel DAT1
     CLD             ; Mengatur arah gerakan string menjadi maju (clear direction flag)

L1:                  ; Label untuk awal loop
     SCASB           ; Membandingkan byte yang ada di alamat ES:DI dengan byte 
                     ; yang ada di dalam register AL
     JA L2           ; Melompat ke L2 jika byte di alamat ES:DI lebih besar 
                     ; daripada byte yang ada di dalam register AL
     LOOP L1         ; Mengulangi loop selama CX belum mencapai 0 (CX - 1 != 0)
     JMP L3          ; Melompat ke L3

L2:                  ; Label L2
     MOV AL,DAT[DI-1] ; Memuat byte sebelumnya dari DAT1 ke dalam register AL
     LOOP L1          ; Mengulangi loop selama CX belum mencapai 0 (CX - 1 != 0)

L3:                  ; Label L3
     MOV CL,AL       ; Memuat nilai dari register AL ke dalam register CL
     
     MOV AH,4CH
     INT 21H
    
MAIN ENDP
END MAIN
