TITLE LAB 12 NO8
.MODEL SMALL                  
.STACK 100H      
.DATA 
TEMP1 DW 1111H,2222H,3333H,4444H,5555H
TEMP2 DW 2222H,3333H,4444H,5555H,6666H
.CODE
MAIN PROC 
      MOV AX,@DATA
      MOV DS,AX
      
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
      MOV BX,TEMP2[SI]
      
      MOV AX,0400H
      MOV DS,AX
      
      MOV [DI],BX
      ADD DI,2
      
      POP DS
       
      ADD SI,2
      CMP SI,10
      JNZ SANA
         
      MOV SI,0
      MOV DI,0

AWAL: PUSH SI
      MOV [30],0
      MOV [35],0
      MOV [40],0
      MOV [45],0
      MOV [50],0
      MOV [55],0
      MOV AX,0
      MOV BX,0
      MOV CX,0
      MOV DX,0
      
      MOV AX,0300H
      MOV DS,AX
      
      MOV CL,[DI]
      MOV CH,[DI+1]
      
      MOV AX,0400H
      MOV DS,AX
      
      MOV AL,[DI]
      MOV AH,[DI+1]
      
      MOV [10],AX
      MOV [20],CX
      MOV CX,0
                  
      CMP [20],0
      JZ NOL
      CMP AX,0
      JZ NOL
      
      MOV DX,[20]
      MOV SI,[10]
      AND SI,0FH
      CMP SI,0
      JE SK1A
      CMP SI,1
      JE SK1
      CALL KALI 
           
      MOV [30],CX
      MOV [35],DX
      JMP SK1A

SK1:  MOV CX,0
      MOV DX,[20]
      MOV [30],CX
      MOV [35],DX
      
SK1A: MOV DX,[20]
      MOV SI,AX
      
      AND SI,0F0H
      SHR SI,4
      CMP SI,0
      JE SK2A
      CMP SI,1
      JE SK2
      CALL KALI
      JMP D2
      
SK2:  MOV CX,0
      MOV DX,[20]
      
D2:   MOV BL,4
D1:   SHL DX,1
      RCL CX,1
      DEC BL
      CMP BL,0
      JNZ D1
           
      MOV [40],CX
      MOV [45],DX
      
SK2A: MOV DX,[20]
      MOV SI,AX
      
      AND SI,0F00H
      SHR SI,8H
      CMP SI,0
      JE SK3A
      CMP SI,1
      JE SK3
      CALL KALI
      JMP D3
      
SK3:  MOV CX,0
      MOV DX,[20]
      
D3:   MOV CH,CL
      MOV CL,DH
      MOV DH,DL
      MOV DL,0
      
      MOV [50],CX
      MOV [55],DX
      
SK3A: MOV DX,[20]
      MOV SI,AX
      
      AND SI,0F000H
      SHR SI,12
      CMP SI,0
      JE SK4A
      CMP SI,1
      JE SK4
      CALL KALI
      JMP D5
      
SK4:  MOV CX,0
      MOV DX,[20]
      
D5:   MOV BL,12
D4:   SHL DX,1
      RCL CX,1
      DEC BL
      CMP BL,0
      JNZ D4
      
SK4A: ADD DX,[35]
      ADC CX,[30]
      
      CALL UBAH
      
      ADD DX,[45]
      ADC CX,[40]
      
      CALL UBAH
      
      ADD DX,[55]
      ADC CX,[50]
      
      CALL UBAH
      
      MOV AX,500H
      MOV DS,AX
      
      POP SI
      
      MOV [SI+2],CX
      MOV [SI],DX
      
      ADD DI,2
      ADD SI,4
      CMP DI,10
      JNZ AWAL 
           
NOL:  MOV AH,4CH
      INT 21H      
MAIN ENDP
KALI PROC
      MOV CX,0
L1:   ADD DX,[20]
      ADC CL,0
      MOV BX,DX
      AND BX,0FH
      CMP BX,7
      JBE P1
      ADD DX,8
      ADC CL,0 
      
P1:   MOV BX,DX
      AND BX,0F0H
      CMP BX,70H
      JBE P2
      ADD DX,80H
      ADC CL,0 
      
P2:   MOV BX,DX
      AND BX,0F00H
      CMP BX,700H
      JBE P3
      ADD DX,800H
      ADC CL,0
      
P3:   MOV BX,DX
      AND BX,0F000H
      CMP BX,7000H
      JBE P4
      ADD DX,8000H
      ADC CL,0
            
P4:   DEC SI
      CMP SI,1
      JNZ L1
           
      RET     
KALI ENDP
UBAH PROC
      MOV [100],DX
      MOV [105],CX
      
      MOV AX,CX
      MOV BX,DX
        
      AND DX,0FH
      MOV CX,0
      CMP DX,7H
      JBE S1
      ADD BX,8H
      ADC AX,0
      
S1:   MOV DX,BX
      AND DX,0F0H
      MOV CX,0
      CMP DX,70H
      JBE S2
      ADD BX,80H
      ADC AX,0 
      
S2:   MOV DX,BX
      AND DX,0F00H
      MOV CX,0
      CMP DX,700H
      JBE S3
      ADD BX,800H
      ADC AX,0
      
S3:   MOV DX,BX
      AND DX,0F000H
      MOV CX,0
      CMP DX,7000H
      JBE S4
      ADD BX,8000H
      ADC AX,0 
      
S4:   MOV CX,AX
      AND CX,0FH
      CMP CX,7H
      JBE S5
      ADD AX,8H
      
S5:   MOV CX,AX
      AND CX,0F0H
      CMP CX,70H
      JBE S6
      ADD AX,80H 
      
S6:   MOV CX,AX
      AND CX,0F00H
      CMP CX,700H
      JBE S7
      ADD AX,800H
      
S7:   MOV CX,AX
      AND CX,0F000H
      CMP CX,7000H
      JBE S8
      ADD AX,8000H 
      
S8:   MOV CX,AX
      MOV DX,BX
      
      RET      
UBAH ENDP     
END MAIN      