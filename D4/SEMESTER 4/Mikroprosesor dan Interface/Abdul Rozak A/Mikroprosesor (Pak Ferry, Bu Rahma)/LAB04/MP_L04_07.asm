TITLE L04_07
.MODEL SMALL
.STACK 100H
.DATA 
   I  DW 3756H
   O  DD 0


.CODE
MAIN PROC  
     MOV AX,@DATA
     MOV DS,AX 
                
        MOV AX,0
        MOV CX,0
        MOV DX,0
        MOV SI,0
        MOV DI,0
        
        MOV CX,[I]
        SAL CX,4
        ADD BL,3H
        MOV DX,CX
        MOV CX,BX
        
 LUP:   ADD DX,7560H
        ADC CL,3H
        
        MOV AL,DL
        AND AL,0FH
        CMP AL,08H
        JB  SKIP0
        ADD DL,08H
        
 SKIP0: MOV AL,DL
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP1
        ADD AL,80H
        ADC DH,0
        
 SKIP1: MOV AL,DH
        AND AL,0FH
        CMP AL,08H
        JB  SKIP2
        ADD DH,08H
        
 SKIP2: MOV AL,DH
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP3
        ADD DH,80H
        ADC CL,0
        
 SKIP3: MOV AL,CL
        AND AL,0FH
        CMP AL,08H
        JB  SKIP4
        ADD CL,08H
        
 SKIP4: INC SI
        CMP SI,2H
        JB  LUP
        
        ADD DX,[I]
        ADC CL,0
        
        MOV AL,DL
        AND AL,0FH
        CMP AL,08H
        JB  SKIP5
        ADD DL,08H
        
 SKIP5: MOV AL,DL
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP6
        ADD AL,80H
        ADC DH,0
        
 SKIP6: MOV AL,DH
        AND AL,0FH
        CMP AL,08H
        JB  SKIP7
        ADD DH,08H
        
 SKIP7: MOV AL,DH
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP8
        ADD DH,80H
        ADC CL,0
        
 SKIP8: MOV AL,CL
        AND AL,0FH
        CMP AL,08H
        JB  SKIP9
        ADD CL,08H
        
 SKIP9: MOV [O],DX
        MOV [O+2],CX
        
     MOV AH,4CH
     INT 21h     
MAIN ENDP                 
END MAIN                  