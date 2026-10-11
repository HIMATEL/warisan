TITLE  LAB6 NO_12

.MODEL SMALL
.STACK 100H
.DATA                 
.CODE 

MAIN PROC NEAR
    
    MOV AX,@DATA
    MOV DS,AX
    MOV DH,CH
    RCL DH,1
    
    PUSHF
    RCL CL,1
    MOV DL,7

L1: RCL DH,1
    JNC L3
    POPF
    CMC
L2: PUSHF
    RCL CL,1
    DEC DL
    JNZ L1
                
    MOV AH,4CH
    INT 21H   

L3: POPF
    JMP L2
    
MAIN ENDP
END MAIN
