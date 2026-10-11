TITLE L03_01
.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX 
     
     MOV AX,0  
     MOV AL,97H
     ADD AL,69H
     DAA 
     ADC BH,0
     ADD AL,84H
     DAA
     ADC BH,0
     MOV BL,AL  
       
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN