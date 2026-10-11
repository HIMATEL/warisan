TITLE LAB06_10
.MODEL SMALL                  
.STACK 200H      
.DATA

BM1 DB 56H,34H,12H, 54H,73H,65H, 77H,77H,77H
    DB 23H,23H,23H, 56H,65H,55H, 54H,76H,43H
    DB 00H,40H,23H,
BM2 DB 21 DUP (0)
 
.CODE
MAIN PROC
      MOV AX,@DATA
      MOV DS,AX
      MOV SS,AX
                                       
LUP:  MOV AX,0
      MOV BX,0
      MOV CX,0
      MOV DX,0
      MOV BH,[BM1+SI+2]
      MOV BL,[BM1+SI+1] 
      
      MOV AL,BH
      AND AL,0F0H
      SHR AL,4
      CALL KALI 
      
      MOV AL,BH
      AND AL,0FH
      MOV AH,0
      ADD AX,DX
      DAA                                            
      CALL KALI
                                                                                
      MOV AL,BL                                    
      AND AL,0F0H                                  
      SHR AL,4                                         
      MOV AH,0                                    
      ADD AX,DX                                   
      DAA     
      CALL KALI
      
      MOV AL,BL
      AND AL,0FH
      MOV AH,0
      ADD AX,DX
      DAA
      CALL KALI
      
      MOV BL,BM1[SI]
      MOV AL,BL                                    
      AND AL,0F0H                                  
      SHR AL,4                                         
      MOV AH,0                                    
      ADD AX,DX                                   
      DAA     
      CALL KALI
      
      MOV AL,BL
      AND AL,0FH
      MOV AH,0
      ADD AX,DX
      DAA
      MOV DL,AL
                      
      MOV BM2[SI+2],CL
      MOV BM2[SI+1],DH
      MOV BM2[SI],DL
      ADD SI,3
      CMP SI,21
      JNZ LUP
      
      MOV AH,4CH
      INT 21H      
MAIN ENDP  

KALI PROC      
      ADC AH,0
      MOV DH,AH
LUP1: MOV DL,AL    
      MOV AL,CL
      ADD AL,AL
      DAA
      MOV CL,AL
      MOV AL,DH
      ADD AL,AL
      DAA
      ADC CL,0
      MOV DH,AL
      MOV AL,DL
      ADD AL,AL
      DAA
      ADC DH,0
      MOV DL,AL            
      INC DI
      CMP DI,3
      JNZ LUP1
      MOV DI,0
      RET      
KALI ENDP
END MAIN
