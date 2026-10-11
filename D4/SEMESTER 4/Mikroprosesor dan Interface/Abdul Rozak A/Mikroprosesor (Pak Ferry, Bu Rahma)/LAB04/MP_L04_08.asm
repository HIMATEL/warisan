TITLE L04_07
.MODEL SMALL
.STACK 100H
.DATA 
   I  DD 74324H,67543H,77554H,74326H,64265H
      DD 77643H,76765H,67677H,74743H
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
        
 LUP:   ADD DX,[I+SI]
        INC SI
        INC SI
        ADC CX,[I+SI]
        INC SI
        INC SI
        
        MOV AL,DL     ;pengoreksian pada
        AND AL,0FH    ;register DL
        CMP AL,08H
        JB  SKIP0
        ADD DL,08H
        ADC DH,0
        
 SKIP0: MOV AL,DL
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP1
        ADD DL,80H
        ADC DH,0
        
 SKIP1: MOV AL,DH
        AND AL,0FH
        CMP AL,08H
        JB  SKIP2
        ADD DH,08H
        ADC CL,0
        
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
        ADC CH,0
        
 SKIP4: MOV AL,CL
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP5
        ADD CL,80H
        ADC CH,0
        
 SKIP5: MOV AL,CH
        AND AL,0FH
        CMP AL,08H
        JB  SKIP6
        ADD CH,08H
        
 SKIP6: INC DI
        CMP DI,09H
        JB  LUP
        
     MOV AH,4CH
     INT 21h     
MAIN ENDP                 
END MAIN                  