TITLE UAS LAB-02
.MODEL SMALL
.STACK 100H
.DATA
PRODUCT DW 0
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,0
    MOV SI,0
    
    ADD BX,CX
    MOV AL,BL
    ADD AL,0
    DAA      
    ADC BH,0
    MOV BL,AL 
    
    MOV AL,BH
    ADD AL,0
    DAA
    ADC AH,0
    MOV BH,AL
    
    MOV AL,AH
    ADD AL,0
    DAA
    MOV AH,AL 
             
    MOV DI,DX
    AND DI,00FFH
    MOV DL,0         
    MOV CX,0 
LUP0: ;PENGURANGAN BERULANG
      SUB BL,DH
      MOV AL,BL
      SUB AL,0
      DAS       
      SBB BH,0
      MOV BL,AL 
      
      MOV AL,BH
      SUB AL,0
      DAS      
      SBB AH,0
      MOV BH,AL
      
      MOV AL,AH
      SUB AL,0
      DAS
      MOV AH,AL
      
      ;COUNTER
      ADD CX,1
      MOV AL,CL
      ADD AL,0
      DAA      
      ADC CH,0
      MOV CL,AL
      
      MOV AL,CH
      ADD AL,0
      DAA
      ADC DL,0
      MOV CH,AL
      
      MOV AL,DL
      ADD AL,0
      DAA
      MOV DL,AL
      
      ADD BL,0
      CMP BL,DH
      JBE LUP0
      ADD BH,0
      JNZ LUP0
      ADD AH,0
      JNZ LUP0
      MOV [PRODUCT+4],BX ;SISA BAGI 
      SUB CX,DI
      MOV AL,CL
      SUB AL,0
      DAS      
      SBB CH,0
      MOV CL,AL
      
      MOV AL,CH
      SUB AL,0
      DAS     
      SBB DL,0
      MOV CH,AL
      
      MOV AL,DL
      SUB AL,0
      DAS
      MOV DL,AL
      
      MOV DH,0
      MOV [PRODUCT],CX
      MOV [PRODUCT+2],DX
  
      MOV AH,4CH
      INT 21H
      MAIN ENDP    
END MAIN
  
