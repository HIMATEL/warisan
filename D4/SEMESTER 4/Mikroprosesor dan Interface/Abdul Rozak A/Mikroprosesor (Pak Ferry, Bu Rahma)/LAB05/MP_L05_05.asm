TITLE PENGURANGAN
.MODEL SMALL
.STACK 100H
.DATA
  DAT1 DW 3234H
  DAT2 DW 2765H
  DAT3 DW 0

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
        MOV CX,[DAT1]
        SUB CX,[DAT2]
     
        MOV AL,CL    ;koreksi digit 0
        AND AL,0FH
        CMP AL,08H
        JB  SKIP0
        SUB CL,08H
     
 SKIP0: MOV AL,CL    ;koreksi digit 1
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP1
        SUB CL,80H
        
 SKIP1: MOV AL,CH    ;koreksi digit 2
        AND AL,0FH
        CMP AL,08H
        JB  SKIP2
        SUB CH,08H
     
 SKIP2: MOV AL,CH    ;koreksi digit 3
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP3
        SUB CH,80H
        
 SKIP3: MOV [DAT3],CX
     
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN 