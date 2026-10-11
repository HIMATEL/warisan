TITLE LAB05 NO06

.MODEL SMALL
.STACK 100H

.DATA
    DATA1 DD 76543215H
    DATA2 DD 5745326H
    DATA3 DD 0

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV DX,[DATA1]
     MOV CX,[DATA1+2]
     SUB DX,[DATA2]
     SBB CX,[DATA2+2]
     
     MOV AL,DL
     AND AL,0FH
     CMP AL,08H
     JB LUP1
     SUB DL,08H
     
LUP1:MOV AL,DL
     AND AL,0F0H
     CMP AL,80H
     JB LUP2
     SUB DL,80H 
     
LUP2:MOV AL,DH
     AND AL,0FH
     CMP AL,08H
     JB LUP3
     SUB DH,08H

LUP3:MOV AL,DH
     AND AL,0F0H
     CMP AL,80H
     JB LUP4
     SUB DH,80H

LUP4:MOV AL,CL
     AND AL,0FH
     CMP AL,08H
     JB LUP5
     SUB CL,08H 

LUP5:MOV AL,CL
     AND AL,0F0H
     CMP AL,80H
     JB LUP6
     SUB CL,80H

LUP6:MOV AL,CH
     AND AL,0FH
     CMP AL,08H
     JB LUP7
     SUB CH,08H

LUP7:MOV AL,CH
     AND AL,0F0H
     CMP AL,80H
     JB LUP8
     SUB CH,80H
     
LUP8:MOV [DATA3],DX
     MOV [DATA3+2],CX
     
     MOV AH,4CH
     INT 21H  
     
MAIN ENDP
END MAIN   



