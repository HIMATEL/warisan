TITLE LAB05 NO04

.MODEL SMALL
.STACK 100H

.DATA
    BM1 DD 84749679H
    BM2 DD 4839668H
    BM3 DD 0

.CODE
MAIN PROC 
     MOV AX,@DATA
     MOV DS,AX
         
     MOV CX,[BM1]
     MOV BX,[BM1+2]
     SUB CX,[BM2] 
     SBB BX,[BM2+2]
         
     MOV AL,CL
     SUB AL,0
     DAS
     MOV CL,AL
         
     MOV AL,CH
     SUB AL,0
     DAS
     MOV CH,AL
         
     MOV AL,BL
     SUB AL,0
     DAS
     MOV BL,AL
     
     MOV AL,BH
     SUB AL,0
     DAS
     MOV BH,AL
         
     MOV [BM3],CX
     MOV [BM3+2],BX    
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN
