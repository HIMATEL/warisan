.DATA
DAT1 DW 9 DUP(0) 

.CODE
MAIN    PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV SI,0
    MOV DI,0
    MOV CH,0
    MOV CL,0
    MOV AL,0 
    MOV BH,0
    MOV DH,0
    MOV AH,0 
    
    MOV [DAT1+SI],100H
    INC SI
    INC SI 
    INC SI
    INC SI
    ADD AL,75H 
    DAA      
    MOV [DAT1+SI],AX 
   
 A: SUB AL,25H
    DAS  
    INC SI
    INC SI
    INC SI
    INC SI
    
    MOV [DAT1+SI],AX
    CMP SI,0FH
    JB A 
           
    MOV DH,CH  
    MOV AL,0H  
    MOV AL,85H
    INC DI
    INC DI
    MOV [DAT1+DI],AX
  B:SUB AL,25H
    DAS 
    
    INC DI   
    INC DI
    INC DI
    INC DI
    MOV [DAT1+DI],AX
    CMP DI,0EH
    JB B    
    
                          
    MOV SI,0CH
    MOV DI,0EH 
    MOV AX,[DAT1+DI]
  C:ADD AX,[DAT1+SI]
    DAA
    MOV CX,AX
    ADC BH,0
   
    DAA
    DEC SI
    DEC SI
    MOV CH,BH 
   
    CMP SI,0H
    JNZ C  
    
    ADD CX,100H
    
    
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN