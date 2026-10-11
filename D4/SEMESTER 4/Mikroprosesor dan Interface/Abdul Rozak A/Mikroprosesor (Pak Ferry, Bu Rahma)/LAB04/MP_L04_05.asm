TITLE L04_05
.MODEL SMALL
.STACK 100H
.DATA 
   I  DD 7654324h,6767543h,7766554h,7454326h,6426765h,7755643h
      DD 7776665h,5556667h,7747576h
   O  DW 0


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
        
        MOV AL,DL
        AND AL,0FH
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
        ADC BX,0
        
 SKIP6: MOV AL,CH
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP7
        ADD CH,80H
        ADC BX,0
        
 SKIP7: INC DI
        CMP DI,09H
        JB  LUP
        
        MOV [O],DX
        MOV [O+2],CX
        MOV [O+4],BX
        
           
     MOV AH,4CH
     INT 21h     
MAIN ENDP                 
END MAIN                  