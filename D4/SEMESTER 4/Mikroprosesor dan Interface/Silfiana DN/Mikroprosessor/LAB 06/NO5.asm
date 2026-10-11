TITLE LAB06_05
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN    PROC
        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0
        MOV [210],0
        MOV [220],0
        MOV [230],0
        MOV [240],0
        
        MOV CX,9900H
        MOV DX,CX
        MOV AX,DX
        CMP DX,8
        JB  LUP6
LUP:    CMP AX,4096H
        JAE LUP1
        CMP AX,512H
        JAE LUP2
        CMP AX,64H
        JAE LUP3
        CMP AX,8
        JAE LUP4
        JMP LUP5
        
LUP1:   MOV [200],AL
        MOV AL,AH          
        SUB AL,40H
        DAS
        MOV AH,AL
        MOV AL,[200]
        SUB AL,96H
        DAS
        SBB AH,0
        INC [210]
        CMP AX,4096H
        JAE LUP1
        JMP LUP
 
LUP2:   MOV [200],AL
        MOV AL,AH
        SUB AL,5H
        DAS
        MOV AH,AL
        MOV AL,[200]
        SUB AL,12H
        DAS
        SBB AH,0
        INC [220]
        CMP AX,512H
        JAE LUP2
        JMP LUP
        
LUP3:   SUB AX,64H
        DAS
        INC [230]
        CMP AX,64H
        JAE LUP3
        CMP AX,8
        JMP LUP
        
LUP4:   SUB AL,8
        DAS
        INC [240]
        CMP AL,8
        JAE LUP4
        JMP LUP
        
LUP5:   MOV BH,0
        MOV BL,[210]
        MOV DH,[220]
        SHL DH,4
        ADD DH,[230]
        MOV DL,[240]
        SHL DL,4
        ADD DL,AL
        
LUP6:   MOV AH,4CH
        INT 21H
        
MAIN    ENDP
END     MAIN
