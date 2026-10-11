TITLE P6_01CR4   ;KONVERSI DESIMAL KE OKTAL
.MODEL SMALL
.STACK 100H
.DATA 
SUM DD 0,0,0,0 
.CODE

MAIN     PROC 
         MOV AX,@DATA
         MOV DS,AX
         MOV SI,0
          
         MOV AL,CH
         AND AL,0FH
         MOV BL,AL
         CMP BL,7H
         JBE SANA
         ADD BL,8H
SANA:         
         MOV AL,CH
         MOV [SUM+0],AX
         CALL KOREKSI
         MOV AX,[SUM+0]
             
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

KOREKSI PROC 

        MOV CL,[SUM+0]
        MOV CH,[SUM+1]
        MOV BL,[SUM+2]
        MOV BH,[SUM+3]
        MOV DL,CL
        AND DL,0X0F
        CMP DL,7
        JBE L1
        ADD CX,8 
        ADC BX,0

L1:     MOV DL,CL
        AND DL,0X0F0  
        CMP DL,0X70
        JBE L2
        ADD CX,0X80
        ADC BX,0

L2:     MOV DH,CH
        AND DH,0X0F
        CMP DH,7
        JBE L3
        ADD CH,8
        ADC BX,0 

L3:     MOV DH,CH
        AND DH,0X0F0
        CMP DH,0X70
        JBE L4
        ADD CH,0X80
        ADC BX,0

L4:     MOV DL,BL
        AND DL,0X0F
        CMP DL,7
        JBE L5
        ADD BL,8
        ADC BH,0

L5:     MOV DL,BL
        AND DL,0X0F0
        CMP DL,0X70
        JBE L6
        ADD BL,0X80
        ADC BH,0

L6:     MOV DH,BH
        AND DH,0X0F
        CMP DH,7
        JBE L7
        ADD BH,0X8

L7:     MOV [SUM+0],CL
        MOV [SUM+1],CH
        MOV [SUM+2],BL
        MOV [SUM+3],BH
        
        RET
KOREKSI ENDP


END MAIN
         
          
         
         
