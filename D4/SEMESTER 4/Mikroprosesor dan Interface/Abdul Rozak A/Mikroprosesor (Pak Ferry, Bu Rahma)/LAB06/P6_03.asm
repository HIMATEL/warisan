TITLE P6_03   ;KONVERSI HEKSA KE OKTAL
.MODEL SMALL
.STACK 100H
.DATA  
.CODE

MAIN     PROC  
         MOV CH,0FFH
         CMP CH,0H
         JNZ SITU
SANA:    DEC CH
         ADD AL,1H
         ADC AH,0
         MOV BH,AL
         AND BH,0FH
         CMP BH, 08H
         JB DITU
         ADD AL,8H
DITU:    MOV BH,AL
         AND BH,0F0H
         CMP BH,80H
         JB DIEU
         ADD AL,80H
         ADD AH,1H
SITU:     
DIEU:
         CMP CH,0H
         JNZ SANA
         
         MOV AH,4CH
         INT 21H
         
         MAIN ENDP
END MAIN
         
          
         
         
