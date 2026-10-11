TITLE LAB05 NO05
.MODEL SMALL
.STACK 100H

.DATA
    DATA1 DW 3234H
    DATA2 DW 2767H
    DATA3 DW 0

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV CX,[DATA1]
     SBB CX,[DATA2]
     MOV AL,CL
     AND AL,0FH
     CMP AL,08H
     JB LUP1
     SUB CL,08H
     
LUP1:MOV AL,CL
     AND AL,0F0H
     CMP AL,80H
     JB LUP2
     SUB CL,80H 
     
LUP2:MOV AL,CH
     AND AL,0FH
     CMP AL,08H
     JB LUP3
     SUB CH,08H

LUP3:MOV AL,CH
     AND AL,0F0H
     CMP AL,80H
     JB LUP4
     SUB CH,80H
     
LUP4:MOV [DATA3],CX
     MOV AH,4CH
     INT 21H  
     
MAIN ENDP
END MAIN   



