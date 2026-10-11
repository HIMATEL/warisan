TITLE P6_01CR4   ;KONVERSI DESIMAL KE OKTAL
.MODEL SMALL
.STACK 100H
.DATA  
.CODE

MAIN     PROC  
         MOV AL,CH
         AND AL,0FH
         MOV BL,AL
         CMP BL,7H
         JBE SANA
         ADD BL,8H
SANA:         
         MOV AL,CH
         AND AL,0F0H
         MOV CL,4H
         SHR AL,CL
         CMP AL,7H
         JBE SINI
         ADD AL,8H
SINI:    
         MOV AH,0
         ADD AX,AX
         MOV CX,AX
         AND CX,0FH
         CMP CX,08H
         JB DITU1.0
         ADD AX,08H
DITU1.0: MOV CX,AX
         AND CX,0F0H
         CMP CX,80H
         JB DIEU1.0
         ADD AX,80H
         
    
DIEU1.0: MOV CX,AX   
         ADD AX,AX
         MOV DX,AX
         AND DX,0FH
         CMP DX,08H
         JB DITU1.1
         ADD AX,08H
DITU1.1: MOV DX,AX
         AND DX,0F0H
         CMP DX,80H
         JB DIEU1.1
         ADD AX,80H
          
         
DIEU1.1: ADD AX,AX
         MOV DX,AX
         AND DX,0FH
         CMP DX,08H
         JB DITU1.2
         ADD AX,08H
DITU1.2: MOV DX,AX
         AND DX,0F0H
         CMP DX,80H
         JB DIEU1.2
         ADD AX,80H
         
         
DIEU1.2: MOV CH,0
         ;REGISTER BX DAN CX SUDAH OKTAL
         ADD BX,CX
         ;HASIL PENJUMLAHAN SUDAH OKTAL 
         
         ;KOREKSI
         ;CMP BX,10H
         ;JA DINYA
         ;CMP BX,09H
         ;JB DINYI
         ;ADD BX,8H
         
DINYA:   
DINYI:   ADD AX,BX
         MOV DX,AX
         AND DX,0FH
         CMP DX,08H
         JB DITU1.3
         ADD AX,08H
DITU1.3: MOV DX,AX
         AND DX,0F0H
         CMP DX,80H
         JB DIEU1.3
         ADD AX,80H
         
         
DIEU1.3: MOV DX,AX
         
         MOV AH,4CH
         INT 21H
         
         MAIN ENDP
END MAIN
         
          
         
         
