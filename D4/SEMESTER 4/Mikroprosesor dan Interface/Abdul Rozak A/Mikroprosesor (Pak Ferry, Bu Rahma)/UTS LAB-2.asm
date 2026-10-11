TITLE UTS LAB-2
.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX           
     
     MOV BX,CX
     AND BX,000FH
     MOV AL,BL
     ADD AL,0
     DAA
     MOV BL,AL
     
     AND CX,0FFF0H
     SHR CX,1
     SHR CX,1
     SHR CX,1
     SHR CX,1
     
     ADD CX,CX
     MOV AL,CL
     ADD AL,0
     DAA
     ADC CH,0 
     MOV CL,AL
     MOV AL,CH
     ADD AL,0
     DAA 
     MOV CH,AL     
     
     ADD BX,CX
     MOV AL,BL
     ADD AL,0
     DAA
     ADC BH,0 
     MOV CL,BL
     MOV AL,BH
     ADD AL,0
     DAA 
     MOV BH,AL
     
     ADD CX,CX
     MOV AL,CL
     ADD AL,0
     DAA
     ADC CH,0 
     MOV CL,AL
     MOV AL,CH
     ADD AL,0
     DAA 
     MOV CH,AL 
     
     ADD CX,CX
     MOV AL,CL
     ADD AL,0
     DAA
     ADC CH,0 
     MOV CL,AL
     MOV AL,CH
     ADD AL,0
     DAA    
     MOV CH,AL 
     
     ADD BX,CX
     MOV AL,BL
     ADD AL,0
     DAA
     ADC BH,0 
     MOV CL,BL
     MOV AL,BH
     ADD AL,0
     DAA 
     MOV BH,AL      
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN                                                       