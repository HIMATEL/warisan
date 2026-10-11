TITLE LAB8 NO 9
.MODEL SMALL
.STACK 100H

.DATA
BIL DB 23H,77H,1CH,9,0CCH,44H,6EH,77H,0,01BH
    DB 0FFH,0D2H,6CH,81H,33H,22H,0A6H,28H,12H,4
    
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
               
     MOV SI,13H
     MOV CL,0
BARU:MOV AL,[BIL+SI]
     
     ADD AL,0
     JZ BKN
     JS BKN 
     JP BKN
     
     ;jika positif maka masuk ke program dibawah ini
     INC CL
BKN: DEC SI
     JNS BARU
          
     MOV AH,4CH
     INT 21H
     
MAIN ENDP
END MAIN