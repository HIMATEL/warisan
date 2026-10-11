TITLE P6_02   ;KONVERSI OKTAL KE DESIMAL
.MODEL SMALL
.STACK 100H
.DATA  
.CODE

MAIN     PROC  
         MOV CH,77H
         CMP CH,0H
         JZ SITU
SANA:    DEC CH
         MOV BH,CH
         AND BH,0FH
         CMP BH, 08H
         JB DITU
         SUB CH,8H
DITU:    MOV BH,CH
         AND BH,0F0H
         CMP BH,80H
         JB DIEU
         SUB CH,80H

DIEU:    ADD AL,1H
         DAA
         ADC AH,0
SITU:
         CMP CH,0H
         JNZ SANA
         MOV DL,AL
         
         MOV AH,4CH
         INT 21H
         
         MAIN ENDP
END MAIN
         
          
         
         
