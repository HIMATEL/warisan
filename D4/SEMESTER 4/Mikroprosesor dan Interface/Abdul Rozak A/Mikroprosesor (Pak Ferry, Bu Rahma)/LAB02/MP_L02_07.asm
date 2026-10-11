TITLE LAB02 NO7
.MODEL SMALL
.STACK 100H

.DATA 

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV DX,0FF89H
     MOV CX,0FFFFH
     MOV BX,0FFFH
     
     ADD DX,0ABCDH
     ADC CX,0  
     ADC BX,0
     
     MOV AH,4CH
     INT 21H
    
MAIN ENDP
END MAIN