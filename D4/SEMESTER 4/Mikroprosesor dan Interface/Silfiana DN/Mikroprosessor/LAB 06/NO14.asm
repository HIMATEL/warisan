TITLE  LAB6 NO_14

.MODEL SMALL
.STACK 100H
.DATA                 
.CODE 

MAIN PROC NEAR
    
    MOV AX,@DATA
    MOV DS,AX
    MOV AX,CX
    RCL AX,1
    
    PUSHF
    RCL DX,1
    MOV BX,0FH

L1: RCL AX,1
    JNC L3
    POPF
    CMC
L2: PUSHF
    RCL DX,1
    DEC BX
    JNZ L1
                  
    MOV AH,4CH
    INT 21H   

L3: POPF
    JMP L2
    
MAIN ENDP
END MAIN
