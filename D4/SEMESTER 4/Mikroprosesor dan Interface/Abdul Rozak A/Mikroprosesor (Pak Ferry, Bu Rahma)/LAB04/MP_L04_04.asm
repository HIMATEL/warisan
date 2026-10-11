TITLE L04_02
.MODEL SMALL
.STACK 100H
.DATA 
   BM1 DD 47403456H, 22674321H, 47654321H, 12354765H
   BM2 DD 36234567H, 66766550H, 45566772H, 67234567H
   BN1 DW 324H, 473H, 661H, 277H
   BN2 DW 162H, 425H, 654H, 144H
   BM3 DD 0,0,0,0
   BN3 DW 0,0,0,0


.CODE
MAIN PROC  
     MOV AX,@DATA
     MOV DS,AX 
                
        MOV AX,0
        MOV DX,0
        MOV SI,0
        MOV DI,0
        
        
 LUP:   MOV BX,0
        MOV CX,0
        MOV DX,[BM1+SI]
        ADD DX,[BM2+SI]
        ADC CL,0
       
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
        
 SKIP3: MOV [BM3+SI],DX
 
        INC SI
        INC SI
        
        ADD CX,[BM1+SI]
        ADD CX,[BM2+SI]
        
        MOV AL,CL
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
        ADC BL,0
        
 SKIP6: MOV AL,CH
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP7
        ADD CH,80H
        ADC BL,0
        
 SKIP7: MOV [BM3+SI],CX
 
        INC SI
        INC SI
        
        ADD BX,[BN1+DI]
        ADD BX,[BN2+DI]
        
        MOV AL,BL
        AND AL,0FH
        CMP AL,08H
        JB  SKIP8
        ADD BL,08H
        ADC BH,0
        
 SKIP8: MOV AL,BL
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP9
        ADD BL,80H
        ADC BH,0
        
 SKIP9: MOV AL,BH
        AND AL,0FH
        CMP AL,08H
        JB  SKIPA
        ADD BH,08H
        
 SKIPA: MOV [BN3+DI],BX
        
        INC DI
        INC DI
        
        CMP SI,10H
        JB  LUP
           
     MOV AH,4CH
     INT 21h     
MAIN ENDP                 
END MAIN                  