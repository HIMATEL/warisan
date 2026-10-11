TITLE LAB06 NO01 ;(LOOK UP TABLE)
.MODEL SMALL
.STACK 100H
.CODE 
.DATA

MAIN PROC
     MOV DH,0
     MOV DL,CH
     CMP DL,7
     JBE AKH
     AND DL,0FH
     CMP DL,8
     JB L1
     ADD DL,8

L1:  MOV BL,DL
     MOV AH,0
     MOV AL,CH
     AND AL,0F0H
     MOV CL,4   
     SHR AL,CL
     CMP AL,8
     JB L2
     ADD AL,8

L2:  MOV DH,0
     MOV DL,AL
     ADD DX,DX
     CALL KOREK
     MOV SI,DX
     ADD DX,DX
     CALL KOREK
     MOV BH,0
     ADD DX,BX
     CALL KOREK 
     
AKH: MOV AH,4CH
     INT 21H
     ENDP

KOREK PROC
      MOV AX,DX
      AND AL,0FH
      CMP AL,8
      JB S1
      ADD DX,8

S1:   MOV AX,DX
      AND AL,0F0H
      MOV CL,4
      SHR AL,CL
      CMP AL,8
      JB S2
      ADD DX,80H

S2:   RET
    
KOREK ENDP
END MAIN
