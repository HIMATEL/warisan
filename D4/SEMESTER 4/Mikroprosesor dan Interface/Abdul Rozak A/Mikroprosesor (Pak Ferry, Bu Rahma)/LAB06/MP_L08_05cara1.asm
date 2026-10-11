TITLE MEMINDAHKAN 16 DATA 16 BIT
.MODEL SMALL
.STACK 100H
.DATA
BM DW 16 DUP(0)
.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
      MOV SI,1
      MOV CL,BM
     
LUP:  CMP CL,[BM+SI]
      JBE SKIP
      MOV CL,[BM+SI]
     
SKIP: INC SI
      CMP SI,8
      JB  LUP
     
     MOV AH,4CH
     INT 21H
     MAIN ENDP
END MAIN