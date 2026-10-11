TITLE 
.MODEL SMALL
.STACK 100H
.DATA   

;---------------------------------------------
; PROGRAMER : FERRY S
; TANGGAL   : 29 JUNI2018
;---------------------------------------------
.CODE
MAIN PROC 
      MOV AX,0B800H
      MOV DS,AX 
      MOV SI,0
      MOV BP,12; 12 BARIS PERTAMA 
      ;MOV BX,1020H; WARNA AWAL
START:MOV AH,3 ; ULANG 3 KALI 
      MOV BX,0020H; WARNA AWAL
SANA: MOV CX,2
L0:   MOV [SI],0E020H;KUNING 2 KOLOM
      ADD SI,2
      LOOP L0 
      ADD BX,1000H;;;;;;;;;;;;;;;;;
      MOV DI,12
      SUB DI,BP
      MOV CX,BP
      JCXZ Z1
L1:   MOV [SI],BX
      ADD SI,2
      LOOP L1 
Z1:   MOV CX,DI
      ADD BX,1000H; GANTI WARNA W2  
      JCXZ Z3
L2:   MOV [SI],BX 
      ADD SI,2
      LOOP L2
Z3:  MOV CX,DI
      ADD BX,1000H; GANTI WARNA W3 
      JCXZ ZZ
L3:   MOV [SI],BX 
      ADD SI,2
      LOOP L3 
ZZ:   ADD BX,1000H; GANTI WARNA W4
      MOV CX,BP
      JCXZ Z2
L4:   MOV [SI],BX 
      ADD SI,2
      LOOP L4  
     
Z2:   DEC AH
      JNZ SANA 
      
      MOV CX,2
L5:   MOV [SI],0E020H;KUNING 2 KOLOM
      ADD SI,2
      LOOP L5 
      
      DEC BP
      JNZ START   
      ;====================== 
      MOV CX,80
N1: MOV [SI], 0E020H; KUNING 1 BARIS
      ADD SI,2
      LOOP N1
      
      ;======================
 MOV BP,11; 12 BARIS PERTAMA 
STAR:MOV AH,3 ; ULANG 3 KALI 
      MOV BX,0C020H; WARNA AWAL
SAN: MOV CX,2
L00:   MOV [SI],0E020H;KUNING 2 BRS
      ADD SI,2
      LOOP L00 
      SUB BX,1000H;;;;;;;;;;;;;;;;;
      MOV DI,12
      SUB DI,BP
      MOV CX,DI
      JCXZ Z11
L11:   MOV [SI],BX
      ADD SI,2
      LOOP L11 
Z11:   MOV CX,BP
      SUB BX,1000H; GANTI WARNA W2  
      JCXZ Z33
L22:   MOV [SI],BX 
      ADD SI,2
      LOOP L22
Z33:  MOV CX,BP
      SUB BX,1000H; GANTI WARNA W3 
      JCXZ ZZZ
L33:   MOV [SI],BX 
      ADD SI,2
      LOOP L33 
ZZZ:   SUB BX,1000H; GANTI WARNA W4
      MOV CX,DI
      JCXZ Z22
L44:   MOV [SI],BX 
      ADD SI,2
      LOOP L44  
     
Z22:   DEC AH
      JNZ SAN 
      
      MOV CX,2
L55:   MOV [SI],0E020H;KUNING 2 KOLOM
      ADD SI,2
      LOOP L55 
      
      DEC BP
      JNS STAR    
         

      MOV AH,4CH
      INT 21H
      
MAIN ENDP
END MAIN