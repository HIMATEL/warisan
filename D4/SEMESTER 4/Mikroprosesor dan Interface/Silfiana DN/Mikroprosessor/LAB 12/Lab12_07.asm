TITLE LAB12 NO7
.MODEL SMALL                  
.STACK 100H      
.DATA
TEKS DB "Perkalian Data Oktal 2 Digit x 2 Digit:$"
KALI DB " x $"
SAMADENGAN DB " = $" 
.CODE
MAIN PROC    
      MOV AX,@DATA 
      MOV DS,AX
      
      MOV DX,OFFSET TEKS
      MOV AH,9     
      INT 21H
      
HUSH: MOV AX,0
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
      
      MOV AX,CX      
      CMP CH,0
      JZ HUSHC
      CMP CL,0
      JZ HUSHC
      
      AND CL,0FH
      MOV DL,CH
      MOV SI,CX
      AND SI,0FFH
      CMP SI,0
      JE HUSH4
      CMP SI,1
      JE HUSH4  
      
HUSH1:ADD DL,CH
      ADC DH,0
      MOV BL,DL
      AND BL,0FH
      CMP BL,7
      JBE HUSH2
      ADD DL,8  
      
HUSH2:MOV BL,DL
      AND BL,0F0H
      SHR BL,4
      CMP BL,7
      JBE HUSH3
      ADD DL,80H
      ADC DH,0  
      
HUSH3:DEC SI
      CMP SI,1
      JNZ HUSH1
      
HUSH4:MOV [10],DX
      MOV DX,0
            
      MOV CL,AL
      AND CL,0F0H
      SHR CL,4
      MOV SI,CX
      AND SI,0FFH
      CMP SI,0
      JE HUSH8
      CMP SI,1
      MOV DL,CH
      JE HUSH8
      MOV DL,AH  
      
HUSH5:ADD DL,CH
      ADC DH,0
      MOV BL,DL
      AND BL,0FH
      CMP BL,7
      JBE HUSH6
      ADD DL,8 
      
HUSH6:MOV BL,DL                        
      AND BL,0F0H
      SHR BL,4
      CMP BL,7
      JBE HUSH7
      ADD DL,80H
      ADC DH,0  
      
HUSH7:DEC SI
      CMP SI,1
      JNZ HUSH5
      
HUSH8:SHL DX,4
      ADD DX,[10]
      MOV AX,DX
      MOV [20],DX
      
      AND DX,0FH
      CMP DX,7
      JBE HUSH9
      ADD AX,8H
      
HUSH9:MOV DX,[20]
      AND DX,0F0H
      CMP DX,70H
      JBE HUSHA
      ADD AX,80H 
      
HUSHA:MOV DX,[20]
      AND DX,0F00H
      CMP DX,700H
      JBE HUSHB
      ADD AX,800H 
             
HUSHB:MOV BX,AX
      MOV DX,BX 

HUSHC:AND DH,0F0H
      SHR DH,4
      ADD DH,30H
      MOV DL,DH
      MOV AH,2
      INT 21H
      
      MOV DX,BX
      AND DH,0FH
      ADD DH,30H
      MOV DL,DH
      MOV AH,2
      INT 21H
      
      MOV DX,BX
      AND DL,0F0H
      SHR DL,4
      ADD DL,30H
      MOV AH,2
      INT 21H
      
      MOV DX,BX
      AND DL,0FH
      ADD DL,30H
      MOV AH,2
      INT 21H
      JMP HUSH     
      
      MOV AH,4CH
      INT 21H    
MAIN ENDP
END MAIN      