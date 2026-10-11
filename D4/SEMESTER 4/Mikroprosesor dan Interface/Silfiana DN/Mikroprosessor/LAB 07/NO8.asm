TITLE LAB07 NO8
.MODEL SMALL
.STACK 100H

.DATA 
DAT1 DW 2121H,1256H,2132H,138AH,0F31H,6116H,0218H,27CH    

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV ES,AX
     
     MOV CX,16           ; Memuat nilai 16 ke dalam register CX (jumlah elemen yang akan diproses)
     MOV AX,DAT1         ; Memuat nilai pertama dari DAT1 ke dalam register AX
     LEA DI,DAT1         ; Mengatur DI ke alamat offset dari variabel DAT1
     CLD                 ; Mengatur arah gerakan string menjadi maju (clear direction flag)

L1:                       ; Label untuk awal loop
     SCASB                ; Membandingkan byte yang ada di alamat ES:DI dengan 
                          ; byte yang ada di dalam register AL
     JG L2                ; Melompat ke L2 jika nilai AL lebih besar dari 0 
                          ; yang ada di dalam register AL
     LOOP L1              ; Mengulangi loop selama CX belum mencapai 0 (CX - 1 != 0)
     JMP L3               ; Melompat ke L3

L2:                       ; Label L2
     MOV AX,DAT[DI-2]     ; Memuat byte sebelumnya dari DAT1 ke dalam register AX
     LOOP L1              ; Mengulangi loop selama CX belum mencapai 0 (CX - 1 != 0)

L3:                       ; Label L3
     MOV CX,AX            ; Memuat nilai dari register AX ke dalam register CX
     
     
     MOV AH,4CH
     INT 21H
    
MAIN ENDP
END MAIN
