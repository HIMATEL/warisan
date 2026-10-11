TITLE LAB12 NO6
.MODEL SMALL                  
.STACK 100H      
.DATA
TEKS DB "Perkalian Data Oktal 1 Digit x 1 Digit:$"
KALI DB " x $"
SAMADENGAN DB " = $" 
.CODE
MAIN PROC     
      MOV AX,@DATA 
      MOV DS,AX
      
      MOV DX,OFFSET TEKS
      MOV AH,9     
      INT 21H
      
LUP:  MOV AX,0
      MOV BX,0
      MOV CX,0
      MOV DX,0
      
      MOV DL,0DH    
      MOV AH,2
      INT 21H
      MOV DL,0AH  
      INT 21H
      
      MOV AH,1     
      INT 21H
      SUB AL,30H   
      MOV CH,AL
      
      MOV DX,OFFSET KALI
      MOV AH,9     
      INT 21H
      
      MOV AH,1   
      INT 21H
      SUB AL,30H
      MOV CL,AL
      
      MOV DX,OFFSET SAMADENGAN
      MOV AH,9     
      INT 21H       
      
      CMP CH,0
      JZ SKIP0
      CMP CL,0
      JZ SKIP0
      MOV DH,CH
      MOV AH,CL  
      
LUP1: ADD DH,CH
      MOV BL,DH
      AND BL,0FH
      CMP BL,7
      JBE LUP2
      ADD DH,8   
      
LUP2: MOV BL,DH
      AND BL,0F0H
      SHR BL,4
      CMP BL,7
      JBE LUP3
      ADD DH,80H  
      
LUP3: DEC AH
      CMP AH,1
      JNZ LUP1
       
SKIP0:MOV DL,DH
      AND DL,0F0H
      SHR DL,4
      CMP DL,0
      JE  LUP4
      ADD DL,30H
      MOV AH,2
      INT 21H
      
LUP4: MOV DL,DH
      AND DL,0FH
      ADD DL,30H
      MOV AH,2
      INT 21H
      JMP LUP     
      
      MOV AH,4CH  
      INT 21H      
MAIN  ENDP   
END MAIN    
  