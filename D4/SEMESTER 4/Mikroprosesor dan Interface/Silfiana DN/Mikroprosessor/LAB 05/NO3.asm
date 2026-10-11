TITLE LAB05 NO03
.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
     MOV CX, 3464H
     MOV AL,CL
     SUB AL,69H
     DAS
     
     MOV CL,AL
     MOV AL,CH
     SBB AL,25H
     DAS
     MOV CH,AL
     
     MOV AH,4CH
     INT 21H 

MAIN ENDP
END MAIN
