TITLE UTS LAB-1
.MODEL SMALL
.STACK 100H
.DATA
DAT DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
HASIL DW 0

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV SI,0
     MOV DX,0
     
LUP: MOV [DAT+SI],DL
     
     INC SI
     ADD DL,5H
     MOV [DAT+SI],DL
     
     INC SI
     ADD DL,0AH
     
     CMP SI,10H
     JNZ LUP
     
      MOV CX,0
      MOV SI,0
LUUP: ADD CL,[DAT+SI]
      ADC CH,0
      INC SI
      CMP SI,10H
      JNZ LUUP
      
      MOV [HASIL],CX
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN