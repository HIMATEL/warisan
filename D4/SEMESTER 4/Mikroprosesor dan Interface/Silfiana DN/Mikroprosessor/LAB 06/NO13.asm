TITLE  LAB6 NO_13

.MODEL SMALL
.STACK 100H
.DATA                 
.CODE 

MAIN PROC NEAR
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX,CX
    SHR DX,1
    XOR DX,CX
            
    MOV AH,4CH
    INT 21H   

MAIN ENDP
END MAIN
    