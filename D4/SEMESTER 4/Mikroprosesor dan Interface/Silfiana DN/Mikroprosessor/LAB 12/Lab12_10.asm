TITLE Lab13_10 
.MODEL SMALL                  
.STACK 100H     
.DATA
TEMP1 DW 1311H,3145H,5124H,5321H,8217H
TEMP2 DB 22H,19H,54H,98H,77H 
 
.CODE
MAIN PROC 
      MOV AX,@DATA
      MOV DS,AX 
      MOV AX,0
      MOV BX,0
      MOV CX,0
      MOV DX,0
                 
SINI: PUSH DS
      MOV BX,TEMP1[SI]
      
      MOV AX,0300H
      MOV DS,AX
      
      MOV [DI],BX
      ADD DI,2
      
      POP DS
       
      ADD SI,2
      CMP SI,10
      JNZ SINI
      
      MOV SI,0
      MOV DI,0
      
SANA: PUSH DS
      MOV BL,TEMP2[SI]
      
      MOV AX,0400H
      MOV DS,AX
      
      MOV [DI],BL
      ADD DI,2
      
      POP DS
       
      ADD SI,1
      CMP SI,5
      JNZ SANA
         
      MOV SI,0
      MOV DI,0

AWAL: MOV AX,0300H
      MOV DS,AX
      
      MOV BL,[DI]
      MOV BH,[DI+1] 
      
      MOV AX,0400H
      MOV DS,AX
      
      MOV CH,[DI]
      
      MOV [20],BX
      MOV [30],CH
      
      MOV AX,0
      MOV BX,0
      MOV DX,0
      MOV [50],0
      MOV [60],0
      
      MOV BX,CX
      AND CH,0FH
      CMP CH,0
      JE SK1A
      CMP CH,1
      JE SK1
      
      MOV AX,[20]
P1:   MOV [60],0
      ADD AX,[20]
      ADC [50],0
      ADD AL,0
      CALL SDAA
      ADC [60],0
      MOV DL,AL
      MOV AL,AH
      CALL SDAA
      ADC [50],0
      ADD AL,[60]
      MOV DH,AL
      MOV AL,[50]
      CALL SDAA
      MOV CL,AL
      MOV AX,DX
      MOV [50],CL      
      DEC CH
      CMP CH,1
      JNZ P1
      JMP SK1A
      
SK1:  MOV DX,[20]
      
SK1A: MOV [70],CL
      MOV [75],DX 
      
      MOV AX,0
      MOV BX,0
      MOV CX,0
      MOV DX,0
      MOV [50],0
      MOV [60],0
      
      MOV AX,[20]
      MOV CH,[30]
      AND CH,0F0H
      SHR CH,4
      
      CMP CH,0
      JE SK2A
      CMP CH,1
      JE SK2
      
      MOV AX,[20]
P2:   MOV [60],0
      ADD AX,[20]
      ADC [50],0
      ADD AL,0
      CALL SDAA
      ADC [60],0
      MOV DL,AL
      MOV AL,AH
      CALL SDAA
      ADC [50],0
      ADD AL,[60]
      MOV DH,AL
      MOV AL,[50]
      CALL SDAA
      MOV CL,AL
      MOV AX,DX
      MOV [50],CL      
      DEC CH
      CMP CH,1
      JNZ P2
      JMP SK2A

SK2:  MOV DX,[20]    
      
SK2A: SHL DX,1
      RCL CL,1
      SHL DX,1
      RCL CL,1
      SHL DX,1
      RCL CL,1
      SHL DX,1
      RCL CL,1
      
      MOV AX,DX
      ADD AX,[75]
      CALL SDAA
      ADC AH,0
      ADC CL,0
      MOV DL,AL
      MOV AL,AH
      ADD AL,0
      CALL SDAA
      MOV DH,AL
      ADC CL,0
      MOV AL,CL
      ADD AL,[70]
      CALL SDAA
      MOV CL,AL
      
      MOV AX,500H
      MOV DS,AX
      
      MOV [SI+2],CL
      MOV [SI+1],DH
      MOV [SI],DL   
      
      ADD DI,2
      ADD SI,4
      CMP SI,20
      JNZ AWAL
         
      MOV AH,4CH 
      INT 21H
MAIN ENDP
SDAA PROC 
      PUSH BX   
      PUSH CX   
      MOV BH,AH
      LAHF   
      MOV BL,AH
      MOV CH,AL 
      MOV CL,AL  
      AND CL,0FH 
      TEST AH,10H
      JZ L22
      ADD AL,6
      JNC L22
      ADD AL,60H 
      OR BL,1
L22:  TEST AH,1
      JZ L33
      ADD AL,60H
      OR BL,1
L33:  MOV CH,AL
      AND CH,0FH
      CMP CH,9
      JBE L44 
      ADD AL,6
      JNC L44
      ADD AL,60H
      OR BL,1
L44:  MOV CH,AL
      AND CH,0F0H
      CMP CH,90H
      JBE L55
      ADD AL,60H
      OR BL,1
L55:  MOV AH,BL
      SAHF
      MOV AH,BH            
      POP CX
      POP BX 
      RET
SDAA ENDP
END MAIN      