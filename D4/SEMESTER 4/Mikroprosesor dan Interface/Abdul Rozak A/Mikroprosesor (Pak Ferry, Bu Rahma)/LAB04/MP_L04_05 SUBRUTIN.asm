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
        
        MOV AL,DH
        CALL KOREKSI
        MOV DL,AL
        ADC DH
        
        MOV AL,DH
        CALL KOREKSI
        MOV DH,AL
        ADC CL
        
        MOV AL,CL
        CALL KOREKSI
        MOV CL,AL
        ADC CH
        
        MOV AL,CH
        CALL KOREKSI
        MOV CH,AL
        ADC BL
        
        INC DI
        CMP DI,09H
        JB  LUP
        
        MOV [O],DX
        MOV [O+2],CX
        MOV [O+4],BX    
           
     MOV AH,4CH
     INT 21h     
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