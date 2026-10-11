TITLE Lab12_11
.MODEL SMALL                  
.STACK 100H      
.DATA
BM1 DB 11H,11H,11H,11H,11H,  22H,22H,22H,22H,22H
    DB 33H,33H,33H,33H,33H,  44H,44H,44H,44H,44H
    DB 66H,66H,66H,66H,66H,  77H,77H,77H,77H,77H 
BM2 DW 12 DUP(0)
 
.CODE
MAIN PROC   
        MOV AX,@DATA 
        MOV DS,AX
        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0
      
HUSH:   MOV BL,[BM1+SI+4]
        MOV CH,[BM1+SI+3]
        MOV CL,[BM1+SI+2]     
        MOV DH,[BM1+SI+1]
        MOV DL,[BM1+SI]

        MOV AX,DX
        AND AX,7
        AND DX,0FFF0H
        SHR BL,1
        RCR CX,1
        RCR DX,1
        ADD DX,AX
      
        MOV AX,DX
        AND AX,3FH
        AND DX,0FF80H
        SHR BL,1
        RCR CX,1
        RCR DX,1
        ADD DX,AX 
      
        MOV AX,DX
        AND AX,1FFH
        AND DX,0FE00H
        SHR BL,1
        RCR CX,1
        RCR DX,1
        ADD DX,AX
      
        MOV AX,DX
        AND AX,0FFFH
        AND DX,0F000H
        SHR BL,1
        RCR CX,1
        RCR DX,1
        ADD DX,AX
      
        MOV AX,DX
        AND AX,7FFFH
        AND DX,08000H
        SHR BL,1
        RCR CX,1
        RCR DX,1
        ADD DX,AX
      
        MOV AX,CX
        AND AX,3
        AND CX,0FFF8H
        SHR BL,1
        RCR CX,1
        ADD CX,AX
      
        MOV AX,CX
        AND AX,1FH
        AND CX,0FFC0H
        SHR BL,1
        RCR CX,1
        ADD CX,AX
      
        MOV AX,CX
        AND AX,0FFH
        AND CX,0FF00H
        SHR BL,1
        RCR CX,1
        ADD CX,AX
      
        MOV AX,CX
        AND AX,7FFH
        AND CX,0F000H
        SHR BL,1
        RCR CX,1
        ADD CX,AX

        MOV [BM2+DI+2],CX
        MOV [BM2+DI],DX    
        ADD DI,4
        ADD SI,5
        CMP SI,30
        JNZ HUSH    
      
        MOV AH,4CH
        INT 21H
MAIN  ENDP
END MAIN      