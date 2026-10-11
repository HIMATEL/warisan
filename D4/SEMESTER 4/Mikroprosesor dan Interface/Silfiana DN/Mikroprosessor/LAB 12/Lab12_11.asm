TITLE Lab13_11
.MODEL SMALL                  
.STACK 100H      
.DATA 
TEMP1 DB 11H,11H,11H, 22H,22H,22H
      DB 33H,33H,33H, 44H,44H,44H
      DB 55H,55H,55H
TEMP2 DW 1234H,5671H,7654H,1267H,4523H
   
.CODE
MAIN  PROC
      MOV AX,@DATA 
      MOV DS,AX 
      
      MOV AX,0
      MOV BX,0
      MOV CX,0
      MOV DX,0         
     
SINI: PUSH DS
      MOV CL,TEMP1[SI+2]
      MOV DH,TEMP1[SI+1]
      MOV DL,TEMP1[SI]
      
      MOV AX,0300H
      MOV DS,AX
      
      MOV [DI+2],CL 
      MOV [DI+1],DH
      MOV [DI],DL
      ADD DI,4
      
      POP DS
       
      ADD SI,3
      CMP SI,15
      JNZ SINI
      
      MOV SI,0
      MOV DI,0
      
SANA: PUSH DS 

      MOV BX,TEMP2[SI]
      
      MOV AX,0400H
      MOV DS,AX
      
      MOV [DI],BX
      ADD DI,4
      
      POP DS
       
      ADD SI,2
      CMP SI,10
      JNZ SANA
         
      MOV SI,0
      MOV DI,0  
AWAL: MOV [30],0
      MOV [33],0
      MOV [35],0
      MOV [40],0
      MOV [43],0
      MOV [45],0
      MOV [50],0
      MOV [53],0
      MOV [55],0
      MOV AX,0
      MOV BX,0
      MOV CX,0
      MOV DX,0
      
      PUSH SI
      MOV AX,0300H
      MOV DS,AX
      
      MOV BL,[DI+2]
      MOV CH,[DI+1]
      MOV CL,[DI]
      
      MOV AX,0400H
      MOV DS,AX
      
      MOV AH,[DI+1]
      MOV AL,[DI]
      
      MOV [115],AX
      MOV [120],BX
      MOV [125],CX
      MOV BX,0
      MOV CX,0
                  
      CMP [120],0
      JNZ INI
      CMP [125],0
      JZ NOL
INI:  CMP AX,0
      JZ NOL
      
      MOV BX,0
      MOV CX,[120]
      MOV DX,[125]
      MOV SI,[115]
      AND SI,0FH
      CMP SI,0
      JE SK1A
      CMP SI,1
      JE SK1
      CALL KALI 
      
      MOV BX,0
      MOV [30],BX
      MOV [33],CX
      MOV [35],DX
      JMP SK1A

SK1:  MOV CX,0
      MOV BX,0
      MOV CL,[120]
      MOV DX,[125]
      MOV [30],BX
      MOV [33],CX
      MOV [35],DX
      
SK1A: MOV BX,0
      MOV CX,[120]
      MOV DX,[125]
      MOV SI,[115]
      
      AND SI,0F0H
      SHR SI,4
      CMP SI,0
      JE SK2A
      CMP SI,1
      JE SK2
      CALL KALI
      MOV BX,0
      JMP D2
             
SK2:  MOV BX,0
      MOV CX,[120]
      MOV DX,[125]
      
D2:   MOV AH,4
D1:   SHL DX,1
      RCL CX,1
      RCL BX,1
      DEC AH
      CMP AH,0
      JNZ D1
      
      MOV [40],BX     
      MOV [43],CX
      MOV [45],DX
      
SK2A: MOV BX,0
      MOV CX,[120]
      MOV DX,[125]
      MOV SI,[115]
      
      AND SI,0F00H
      SHR SI,8H
      CMP SI,0
      JE SK3A
      CMP SI,1
      JE SK3
      CALL KALI
      MOV BX,0
      JMP D3
      
SK3:  MOV BX,0
      MOV CX,[120]
      MOV DX,[125]
      
D3:   MOV BH,BL
      MOV BL,CH
      MOV CH,CL
      MOV CL,DH
      MOV DH,DL
      MOV DL,0
      
      MOV [50],BX
      MOV [53],CX
      MOV [55],DX
      
SK3A: MOV BX,0
      MOV CX,[120]
      MOV DX,[125]
      MOV SI,[115]
      
      AND SI,0F000H
      SHR SI,12
      CMP SI,0
      JE SK4A
      CMP SI,1
      JE SK4
      CALL KALI
      MOV BX,0
      JMP D5
      
SK4:  MOV BX,0
      MOV CX,[120]
      MOV DX,[125]
      
D5:   MOV AH,12
D4:   SHL DX,1
      RCL CX,1
      RCL BX,1
      DEC AH
      CMP AH,0
      JNZ D4
      
SK4A: 
      ADD DX,[35]
      ADC CX,[33]
      ADC BX,[30]
      
      CALL UBAH
      
      ADD DX,[45]
      ADC CX,[43]
      ADC BX,[40]
      
      CALL UBAH
      
      ADD DX,[55]
      ADC CX,[53]
      ADC BX,[50]
      
      CALL UBAH
      
      MOV AX,500H
      MOV DS,AX
      
      POP SI
      
      MOV [SI+4],BL 
      MOV [SI+3],CH
      MOV [SI+2],CL
      MOV [SI+1],DH
      MOV [SI],DL
      
      ADD DI,4
      ADD SI,8
      CMP DI,20
      JNZ AWAL
                    
NOL:  MOV AH,4CH  
      INT 21H    
MAIN ENDP  
KALI PROC      
L1:   ADD DX,[125]
      ADC CX,[120]
      MOV BX,DX
      AND BX,0FH
      CMP BX,7H
      JBE P1
      ADD DX,8
      ADC CX,0 
      
P1:   MOV BX,DX
      AND BX,0F0H
      CMP BX,70H
      JBE P2
      ADD DX,80H
      ADC CX,0 
      
P2:   MOV BX,DX
      AND BX,0F00H
      CMP BX,700H
      JBE P3
      ADD DX,800H
      ADC CX,0
      
P3:   MOV BX,DX
      AND BX,0F000H
      CMP BX,7000H
      JBE P4
      ADD DX,8000H
      ADC CL,0
            
P4:   MOV BX,CX
      AND BX,0FH
      CMP BX,7H
      JBE P5
      ADD CX,8

P5:   MOV BX,CX
      AND BX,0F0H
      CMP BX,70H
      JBE P6
      ADD CX,80H 

P6:   MOV BX,CX
      AND BX,0F00H
      CMP BX,700H
      JBE P7
      ADD CX,800H

P7:   DEC SI
      CMP SI,1
      JNZ L1
           
      RET 
KALI ENDP
UBAH PROC      
      PUSH DI
      PUSH SI
      
      MOV [100],DX
      MOV [103],CX
      MOV [105],BX
      
      MOV AX,BX
      MOV SI,CX
      MOV DI,DX
        
      AND DX,0FH
      MOV CX,0
      CMP DX,7H
      JBE S1
      ADD DI,8H
      ADC SI,0
      ADC AX,0    
      
S1:   MOV DX,DI
      AND DX,0F0H
      MOV CX,0
      CMP DX,70H
      JBE S2
      ADD DI,80H
      ADC SI,0
      ADC AX,0    
      
S2:   MOV DX,DI
      AND DX,0F00H
      MOV CX,0
      CMP DX,700H
      JBE S3
      ADD DI,800H
      ADC SI,0
      ADC AX,0
      
S3:   MOV DX,DI
      AND DX,0F000H
      MOV CX,0
      CMP DX,7000H
      JBE S4
      ADD DI,8000H
      ADC SI,0
      ADC AX,0 
      
S4:   MOV CX,SI
      AND CX,0FH
      CMP CX,7H
      JBE S5
      ADD SI,8H
      ADC AX,0
      
S5:   MOV CX,SI
      AND CX,0F0H
      CMP CX,70H
      JBE S6
      ADD SI,80H
      ADC AX,0 
      
S6:   MOV CX,SI
      AND CX,0F00H
      CMP CX,700H
      JBE S7
      ADD SI,800H
      ADC AX,0
      
S7:   MOV CX,SI
      AND CX,0F000H
      CMP CX,7000H
      JBE S8
      ADD SI,8000H
      ADC AX,0 
      
S8:   MOV BX,AX
      AND BX,0FH
      CMP BX,7H
      JBE S9
      ADD AX,8H
      
S9:   MOV BX,AX
      AND BX,0F0H
      CMP BX,70H
      JBE S10
      ADD AX,80H
      
S10:  MOV BX,AX
      AND BX,0F00H
      CMP BX,700H
      JBE S11
      ADD AX,800H
      
S11:  MOV BX,AX
      AND BX,0F000H
      CMP BX,7000H
      JBE S12
      ADD AX,8000H
      
S12:  MOV BX,AX
      MOV CX,SI
      MOV DX,DI
      
      POP SI
      POP DI
      
      RET
UBAH ENDP     
END MAIN      