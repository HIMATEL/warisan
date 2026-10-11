TITLE Lab12_10
.MODEL SMALL                  
.STACK 100H      
.DATA
BM1 DB 12H,34H,56H,  23H,45H,67H
    DB 45H,67H,21H,  22H,33H,44H
    DB 55H,66H,77H,  34H,67H,65H
    DB 45H,54H,12H,  76H,54H,32H 
BM2 DB 24 DUP(0)
 
.CODE
MAIN PROC    
        MOV AX,@DATA
        MOV DS,AX
        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0
        MOV DI,0
      
LUP:    MOV CL,[BM1+SI+2]
        MOV DH,[BM1+SI+1]
        MOV DL,[BM1+SI]
        MOV BX,DX
        AND BX,7
        AND DX,0FFF0H
        SHR CL,1
        RCR DX,1
        ADD DX,BX
      
        MOV BX,DX
        AND BX,3FH
        AND DX,0FF80H
        SHR CL,1
        RCR DX,1
        ADD DX,BX 
      
        MOV BX,DX
        AND BX,1FFH
        AND DX,0FE00H
        SHR CL,1
        RCR DX,1
        ADD DX,BX
      
        MOV BX,DX
        AND BX,0FFFH
        AND DX,0F000H
        SHR CL,1
        RCR DX,1
        ADD DX,BX
      
        MOV BX,DX
        AND BX,7FFFH
        AND DX,8000H
        SHR CL,1
        RCR DX,1
        ADD DX,BX

        MOV [BM2+DI+3],0
        MOV [BM2+DI+2],CL
        MOV [BM2+DI+1],DH    
        MOV [BM2+DI],DL
        ADD SI,3
        ADD DI,4
        CMP SI,24
        JNZ LUP      
      
        MOV AH,4CH  
        INT 21H
MAIN ENDP
END MAIN      