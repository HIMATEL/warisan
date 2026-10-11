TITLE PENGURANGAN
.MODEL SMALL
.STACK 100H
.DATA
  DAT1 DD 84749679H
  DAT2 DD 4839668H
  DAT3 DD 0

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV CX,[DAT1]
     MOV BX,[DAT1+2]
     SUB CX,[DAT2]
     SBB BX,[DAT2+2]
     
     MOV AL,CL ;pengoreksian digit 0 dan 1
     SUB AL,0
     DAS
     MOV CL,AL
     
     MOV AL,CH ;pengoreksian digit 2 dan 3
     SUB AL,0
     DAS
     MOV CH,AL
     
     MOV AL,BL ;pengoreksian digit 4 dan 5
     SUB AL,0
     DAS
     MOV BL,AL
     
     MOV AL,BH ;pengoreksian digit 6 dan 7
     SUB AL,0
     DAS
     MOV BH,AL
     
     MOV [DAT3],CX
     MOV [DAT3+2],BX
     
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN 