TITLE L03_02A
.MODEL SMALL
.STACK 100H
.DATA 
BM1 DB 93H,77H,80H,94H,32H,44H,85H,47H,99H,75H
BM2 DB 37H,49H,82H,81H,93H,27H,85H,23H,99H,12H
BM3 DB 10 DUP(0)

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX 
     
     MOV SI,0
     MOV AX,0
       
LUP1:ADD AL,[BM1+SI]
     DAA 
     ADC BH,0
     MOV BL,AL
     MOV AL,BH
     DAA
     MOV BH,AL
     MOV AL,BL
     INC SI
     CMP SI,0AH
     JNZ LUP1
     
     MOV SI,0
LUP2:ADD AL,[BM2+SI]
     DAA
     ADC BH,0 
     MOV BL,AL
     MOV AL,BH
     DAA
     MOV BH,AL
     MOV AL,BL
     INC SI
     CMP SI,0AH
     JNZ LUP2
     
     MOV [BM3],BL
     MOV [BM3+1],BH  
       
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN