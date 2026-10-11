TITLE L03_01
.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
       
     MOV AL,47H
     ADD AL,39H
     DAA   
       
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN