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
     
     MOV AL,DL
     CALL KOREKSI
     
     MOV [DAT+SI],DL
     
     INC SI
     ADD DL,10H
     
     MOV AL,DL
     CALL KOREKSI
     
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

KOREKSI PROC
     MOV AH,AL
     AND AH,0FH
     CMP AH,08H
     JBE SK0
     ADD AL,08H
    
SK0: MOV AH,AL
     AND AH,0F0H
     CMP AH,80H
     JBE SK1
     ADD AL,80H
     
SK1:      
     RET
     KOREKSI ENDP 
END MAIN 