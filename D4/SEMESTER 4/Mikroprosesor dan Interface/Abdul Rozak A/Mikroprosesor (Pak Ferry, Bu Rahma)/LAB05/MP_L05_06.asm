TITLE PENGURANGAN
.MODEL SMALL
.STACK 100H
.DATA
  DAT1 DD 76543215H
  DAT2 DD 5745326H
  DAT3 DD 0

.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
        MOV DX,[DAT1]
        MOV CX,[DAT1+2]
        SUB DX,[DAT2]
        SBB CX,[DAT2+2]
     
        MOV AL,DL  ;koreksi digit 0
        AND AL,0FH
        CMP AL,08H
        JB  SKIP0
        SUB DL,08H
     
 SKIP0: MOV AL,DL  ;koreksi digit 1
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP1
        SUB DL,80H
        
 SKIP1: MOV AL,DH  ;koreksi digit 2
        AND AL,0FH
        CMP AL,08H
        JB  SKIP2
        SUB DH,08H
     
 SKIP2: MOV AL,DH  ;koreksi digit 3
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP3
        SUB DH,80H
        
 SKIP3: MOV AL,CL  ;koreksi digit 4
        AND AL,0FH
        CMP AL,08H
        JB  SKIP4
        SUB CL,08H
     
 SKIP4: MOV AL,CL  ;koreksi digit 5
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP5
        SUB CL,80H
        
 SKIP5: MOV AL,CH  ;koreksi digit 6
        AND AL,0FH
        CMP AL,08H
        JB  SKIP6
        SUB CH,08H
     
 SKIP6: MOV AL,CH  ;koreksi digit 7
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP7
        SUB CH,80H
        
 SKIP7: MOV [DAT3],DX
        MOV [DAT3+2],CX
     
     
     MOV AH,4CH
     INT 21H
MAIN ENDP
END MAIN 