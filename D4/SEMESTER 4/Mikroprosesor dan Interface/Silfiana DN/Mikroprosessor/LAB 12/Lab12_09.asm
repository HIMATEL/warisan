TITLE LAB12 NO9
.MODEL SMALL                  
.STACK 100H    
.DATA
TEKS DB "Perkalian Data Desimal 2 Digit x 2 Digit:$"
KALI DB " x $" 
SAMADENGAN DB " = $" 
 
.CODE
MAIN PROC
    
      MOV AX,@DATA 
      MOV DS,AX 
      MOV AX,0
      MOV BX,0
      MOV CX,0
      MOV DX,0
            
      MOV DX,OFFSET TEKS
      MOV AH,9     
      INT 21H
      
AWAL: MOV AX,0
      MOV BX,0
      MOV CX,0
      MOV DX,0
      MOV [10],0
      
      MOV DL,0DH    
      MOV AH,2
      INT 21H
      MOV DL,0AH   
      INT 21H
      
      MOV AH,1     
      INT 21H
      SUB AL,30H
      SHL AL,4   
      MOV CH,AL
      
      MOV AH,1     
      INT 21H
      SUB AL,30H   
      ADD CH,AL
      
      MOV DX,OFFSET KALI
      MOV AH,9     
      INT 21H
      MOV AH,1     
      INT 21H
      SUB AL,30H
      SHL AL,4
      MOV CL,AL 
      
      MOV AH,1     
      INT 21H
      SUB AL,30H   
      ADD CL,AL
      
      MOV DX,OFFSET SAMADENGAN
      MOV AH,9     
      INT 21H       
      MOV AX,0
      MOV DX,0
      
      MOV BX,CX
      AND CL,0FH
      CMP CL,0
      JE SK1A
      CMP CL,1
      JE SK1
      
      MOV AL,CH
P1:   ADD AL,CH
      DAA
      ADC AH,0
      MOV DL,AL
      MOV AL,AH
      ADD AH,0
      DAA
      MOV DH,AH
      MOV AX,DX      
      DEC CL
      CMP CL,1
      JNZ P1
      JMP SK1A
      
SK1:  MOV DL,CH
      
SK1A: MOV [10],DX 
      MOV CX,BX
      MOV AX,0
      MOV DX,0
      
      MOV BX,CX
      MOV AL,CH
      AND CL,0F0H
      SHR CL,4
      
      CMP CL,0
      JE SK2A
      CMP CL,1
      JE SK2
      
P2:   ADD AL,CH
      DAA
      ADC AH,0
      MOV DL,AL
      MOV AL,AH
      ADD AH,0
      DAA
      MOV DH,AH
      MOV AX,DX      
      DEC CL
      CMP CL,1
      JNZ P2 
      JMP SK2A

SK2:  MOV DL,CH    
      
SK2A: SHL DX,4
      MOV AX,DX
      ADD AX,[10]
      DAA
      ADC AH,0
      MOV DL,AL
      MOV AL,AH
      ADD AL,0
      DAA
      MOV DH,AL      
      
      MOV CX,DX
      MOV DL,CH
      AND DL,0F0H
      SHR DL,4 
      ADD DL,30H
      MOV AH,2
      INT 21H
      
      MOV DL,CH
      AND DL,0FH
      ADD DL,30H
      MOV AH,2
      INT 21H 
      
      MOV DL,CL
      AND DL,0F0H
      SHR DL,4 
      ADD DL,30H
      MOV AH,2
      INT 21H
      
      MOV DL,CL
      AND DL,0FH
      ADD DL,30H
      MOV AH,2
      INT 21H 
      JMP AWAL
      
NOL:  MOV DL,0
      ADD DL,30H
      MOV AH,2
      INT 21H
      JMP AWAL
            
      MOV AH,4CH
      INT 21H
MAIN ENDP 
END MAIN  
   