TITLE LAB02 NO4
 
.MODEL SMALL
.STACK 100H

.DATA
BM1 DW 4321H,0065H,
SUM DD 0

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV SI,0
     MOV DX,0
     MOV CX,0 
     MOV BL,0
     
LUP1:MOV SI,0
     ADD DX,[BM1+SI]
     INC SI
     INC SI
     ADC CX,[BM1+SI]
     ADD BL,1    
        
     CMP BL,32H
     JNZ LUP1
     
     MOV [SUM],DX
     MOV [SUM+2],CX   
       
     MOV AH,4CH
     INT 21H
    
MAIN ENDP
END MAIN