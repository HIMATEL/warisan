TITLE LAB 11 NO7
.MODEL SMALL                  
.STACK 100H      
.DATA 
BM1 DB 1AH,14H,1FH,1EH,51H, 2AH,24H,2FH,2EH,51H
    DB 5AH,54H,3FH,3EH,51H, 6AH,64H,4FH,4EH,51H
    DB 7AH,74H,5FH,5EH,51H, 0FFH,0FFH,0FFH,0FFH,0FFH
BM2 DW 24 DUP (0)
   
.CODE
MAIN PROC    
        MOV AX,@DATA
        MOV DS,AX
        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0
        MOV SI,0
        MOV DI,0
      
LUP:    MOV BL,[BM1+SI+4]
        MOV CH,[BM1+SI+3]
        MOV CL,[BM1+SI+2]  
        MOV DH,[BM1+SI+1]
        MOV DL,[BM1+SI]
        MOV [100],DX
        AND DX,0FFF8H
        ADD DX,[100]
        RCL CX,1
        RCL BX,1
        RCL AX,1
     
        MOV [100],DX
        AND [100],0FF80H
        ADD DX,[100]
        RCL CX,1
        RCL BX,1
        RCL AX,1
      
        MOV [100],DX
        AND [100],0F800H
        ADD DX,[100]
        RCL CX,1
        RCL BX,1
        RCL AX,1
      
        MOV [100],DX
        AND [100],08000H
        ADD DX,[100]
        RCL CX,1
        RCL BX,1
        RCL AX,1
      
        MOV [100],CX
        AND [100],0FFF8H
        ADD CX,[100]
        RCL BX,1
        RCL AX,1
      
        MOV [100],CX
        AND [100],0FF80H
        ADD CX,[100]
        RCL BX,1
        RCL AX,1
      
        MOV [100],CX
        AND [100],0F800H
        ADD CX,[100]
        RCL BX,1
        RCL AX,1
      
        MOV [100],CX
        AND [100],8000H
        ADD CX,[100]
        RCL BX,1
        RCL AX,1
      
        MOV [100],BX
        AND [100],0FFF8H
        ADD BX,[100]
        RCL AX,1
      
        MOV [100],BX
        AND [100],0FF80H
        ADD BX,[100]
        RCL AX,1
      
        MOV [100],BX
        AND [100],0F800H
        ADD BX,[100]
        RCL AX,1
      
        MOV [100],BX
        AND [100],8000H
        ADD BX,[100]
        RCL AX,1
      
        MOV [100],AX
        AND [100],0FFF8H
        ADD AX,[100]
      
        MOV [100],AX
        AND [100],0FF80H
        ADD AX,[100]
      
        MOV [100],AX
        AND [100],0F800H
        ADD AX,[100]
      
        MOV [100],AX
        AND [100],8000H
        ADD AX,[100]
        
        MOV [BM2+DI+6],AX
        MOV [BM2+DI+4],BX  
        MOV [BM2+DI+2],CX
        MOV [BM2+DI],DX
        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0
        ADD SI,5
        ADD DI,8
        CMP SI,30
        JNZ LUP
      
        MOV AH,4CH 
        INT 21H
MAIN ENDP
END MAIN   
   