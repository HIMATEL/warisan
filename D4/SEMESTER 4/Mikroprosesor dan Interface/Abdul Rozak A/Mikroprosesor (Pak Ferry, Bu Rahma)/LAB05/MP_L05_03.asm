TITLE PENGURANGAN
.MODEL SMALL
.STACK 100H
.DATA
  DAT1 DW 3464H
  DAT2 DW 2569H
  DAT3 DW 0

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV CX,[DAT1]
     SUB CX,[DAT2]
     
     MOV AL,CL      ;pengkoreksian digit 0 dan 1
     SUB AL,0
     DAS 
     MOV CL,AL
     MOV AL,CH      ;pengkoreksian digit 2 dan 3
     SUB AL,0
     DAS 
     MOV CH,AL
     
     MOV [DAT3],CX
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN 