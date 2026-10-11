TITLE KONVERSI DES [8DGT] KE HEKDES
.MODEL SMALL
.STACK 100H
;PEMROGRAM     : FERRY S
;TANGGAL       : 23 JUNI 2020
;VERSI         : 001
;NAMA FILE     : DES-8DGT-2-HD
;--------------------------------------
.DATA
HSL DB 4 DUP(0)  ; UNT MENYIMPAN OUTPUT 
HS  DB 4 DUP(0)  ; MENGAMANKAN SEMENTARA
TEM DB 8 DUP(0)  ; UNT NYIMPAN INPUT 
KAL DB 'PROG KONVERSI DES 8DGT KE HEKDES [CONTOH:99999999=5F5E0FF;9999=270F;9=9]$'

.CODE
MAIN    PROC
        MOV AX,@DATA
        MOV DS,AX 
        MOV DX, OFFSET KAL
        MOV BP,0
        MOV AH,9
        INT 21H 
LAGI:   CALL HAPUS 
       
        MOV DL,0DH
        MOV AH,2
        INT 21H 
        MOV DL,0AH
        MOV AH,2
        INT 21H 
        CALL INKB  ;BACA KB 1
        MOV [TEM+7],CH
        CALL INKB ; BACA KB 2 APAKAH =
        CMP CL,77H
        JNE LAN1
        JMP GG 
LAN1:   CALL GSRKR ; DATA BARU KE 2
        
        CALL INKB ; BACA KB 3 APAKAH = 
        CMP CL,77H
        JNE LAN2
        JMP GG
LAN2:   CALL GSRKR   ; DATA BARU KE 3
        
        CALL INKB ; BACA KB 4 APAKAH = 
        CMP CL,77H
        JNE LAN3
        JMP GG
LAN3:   CALL GSRKR  ; DATA BARU KE 4
        
        CALL INKB ; BACA KB 5 APAKAH = 
        CMP CL,77H
        JNE LAN4
        JMP GG
LAN4:   CALL GSRKR  ; DATA BARU KE 5  
        
        CALL INKB ; BACA KB 6 APAKAH = 
        CMP CL,77H
        JNE LAN5
        JMP GG
LAN5:   CALL GSRKR  ; DATA BARU KE 6

        CALL INKB ; BACA KB 7 APAKAH = 
        CMP CL,77H
        JNE LAN6
        JMP GG
LAN6:   CALL GSRKR  ; DATA BARU KE 7

        CALL INKB ; BACA KB 8 APAKAH = 
        CMP CL,77H
        JNE LAN7
        JMP GG
LAN7:   CALL GSRKR  ; DATA BARU KE 8         

         
        CALL INKB   ; TOMBOL =
;--------------------------------       
GG:     MOV AL,[TEM+0]
        MOV [HSL+3],AL
        CALL KL10 
        MOV SI,1
        CALL TAMB
        CALL KL10
        MOV SI,2
        CALL TAMB
        CALL KL10
        MOV SI,3
        CALL TAMB
        CALL KL10
        MOV SI,4
        CALL TAMB 
        CALL KL10
        MOV SI,5
        CALL TAMB
        CALL KL10
        MOV SI,6
        CALL TAMB
        CALL KL10
        MOV SI,7
        CALL TAMB
               
        CMP [HSL],0 
      
        JNE N5
        CMP [HSL+1],0
        JNE N4
        CMP [HSL+2],0
        JNE N3 
               
        JMP N2
        
N5:     MOV DI,0 
        CALL CTK 
N4:     MOV DI,1
        CALL CTK
N3:     MOV DI,2
        CALL CTK 
N2:     MOV DI,3
        CALL CTK
 
        JMP LAGI         
            
        MOV AH,4CH
        INT 21H
MAIN    ENDP
;=======BERIKUT SUBRUTIN INPUT DATA KB:
INKB    PROC
        PUSH BX
        MOV CL,0
LL1:    MOV AH,7
        INT 21H                                 
        CMP AL,3DH   ; 3D ADALAH CODE ASCII DARI '='
        JNE PPP
        MOV CL,77H
        MOV BL,AL
        JMP PP2
PP1:    MOV AH,7
        INT 21H
PPP:    CMP AL,30H
        JB PP1 
        CMP AL,39H
        JA PP1 
        MOV BL,AL
        SUB AL,30H ; UBAH ASCII KE DIGIT 
        MOV CH,AL ; CH=OUTPUT SUBRUTIN
PP2:    MOV DL,BL
        MOV AH,2
        INT 21H
        POP BX
        RET
INKB    ENDP
;======BERIKUT SUBRUTIN PERKALIAN DGN 16:
KL10    PROC 
        PUSH DI
        PUSH AX 
        CALL KL2   ; HSL*2
        MOV DI,0
KL:     MOV AL,[HSL+DI] 
        MOV [HS+DI],AL    ; [HS] = [HSL] = HSL*2
        INC DI
        CMP DI,4
        JNZ KL
        
        CALL KL2 ; HSL*4
        CALL KL2 ; HSL*8
         
        MOV DI,3
        CLC
KLL:    MOV AL,[HSL+DI]
        ADC AL,[HS+DI]
        MOV [HSL+DI],AL 
        DEC DI
        JNS KLL
        POP AX
        POP DI
        RET
KL10    ENDP
;--------------
KL2     PROC 
        PUSH SI
        MOV SI,3
        CLC
KKK:    MOV AL,[HSL+SI]
        ADC AL,AL
        MOV [HSL+SI],AL
        DEC SI
        JNS KKK
        POP SI     
        RET
KL2     ENDP 
        
;======BERIKUT SUBRUTIN TAMBAHKAN DATA:  
TAMB    PROC 
        PUSH AX
        PUSH SI
        MOV AL,[HSL+3]
        ADD AL,[TEM+SI]
        MOV [HSL+3],AL
        
        MOV AL,[HSL+2]
        ADC AL,0
        MOV [HSL+2],AL
        
        MOV AL,[HSL+1]
        ADC AL,0
        MOV [HSL+1],AL
        
        MOV AL,[HSL]
        ADC AL,0
        MOV [HSL],AL
        POP SI
        POP AX
        RET
TAMB    ENDP
;======CETAK OUT:
CTK     PROC 
        PUSH AX
        PUSH DX
        PUSH DI
        MOV DL,[HSL+DI]  ; [ST]=2        
        AND DL,0F0H
        SHR DL,1
        SHR DL,1
        SHR DL,1
        SHR DL,1
        CMP DL,0
        JNE SA 
        CMP BP,0
        JE SN 
SA:     CMP DL,9
        JBE SG
        ADD DL,7H
SG:     ADD DL,30H
        MOV AH,2
        INT 21H
SN:     MOV DL,[HSL+DI]
        AND DL,0FH
        CMP DL,9
        JBE SK
        ADD DL,7H
SK:     ADD DL,30H
        MOV AH,2
        INT 21H
        MOV BP,1
        POP DI
        POP DX
        POP AX
        RET
CTK     ENDP
;=====HAPUS DATA AREA NUMERIK:
HAPUS   PROC 
        PUSH SI 
        MOV BP,0
        MOV AL,0
        MOV SI,7
HP:     MOV [TEM+SI],AL
        DEC SI
        JNS HP
         MOV SI,3
HP1:     MOV [HSL+SI],AL 
        MOV [HS+SI],AL
        DEC SI
        JNS HP1
        POP SI 
        RET
HAPUS   ENDP
;=====GSRKR:
GSRKR   PROC   ; GESER KIRI DATA PD VAR TEM
        MOV AL,[TEM+1]
        MOV [TEM],AL 
        MOV AL,[TEM+2]
        MOV [TEM+1],AL
        MOV AL,[TEM+3]
        MOV [TEM+2],AL
        MOV AL,[TEM+4]
        MOV [TEM+3],AL
        MOV AL,[TEM+5]
        MOV [TEM+4],AL 
        MOV AL,[TEM+6]
        MOV [TEM+5],AL
        MOV AL,[TEM+7]
        MOV [TEM+6],AL
        MOV [TEM+7],CH   ; DATA BARU CH
        RET
GSRKR   ENDP

END MAIN