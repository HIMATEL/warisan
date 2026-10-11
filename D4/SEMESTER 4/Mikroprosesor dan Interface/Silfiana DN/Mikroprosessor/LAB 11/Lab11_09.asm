TITLE Lab12_09
.MODEL SMALL                  
.STACK 100H      
.DATA
BM1 DW 1122H, 3344H, 5566H, 7788H, 5040H
    DW 6050H, 4A4AH, 2A2AH, 3A3AH, 4A4AH
BM2 DW 10 DUP(0)
 
.CODE
MAIN PROC    
        MOV AX,@DATA
        MOV DS,AX
        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0
      
LUP:    MOV CX,[BM1+SI]
        MOV BX,CX
        AND BX,7
        AND CX,0FFF0H
        SHR CX,1
        ADD CX,BX
      
        MOV BX,CX
        AND BX,3FH
        AND CX,0FF80H
        SHR CX,1
        ADD CX,BX 
      
        MOV BX,CX
        AND BX,1FFH
        AND CX,0FE00H
        SHR CX,1
        ADD CX,BX
       
        MOV [BM2+SI],CX 
        ADD SI,2
        CMP SI,20
        JNZ LUP     
      
        MOV AH,4CH
        INT 21H
MAIN ENDP
END MAIN                     


