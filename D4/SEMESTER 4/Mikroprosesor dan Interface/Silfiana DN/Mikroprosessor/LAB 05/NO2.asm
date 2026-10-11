TITLE LAB05 NO02
.MODEL SMALL
.STACK 100H

.DATA
 DAT DD 8A7CD679H,0ABCD668H
 HASIL DD DUP(2)
 

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV SI,0 
     MOV DX,0
     MOV CX,0

     MOV DX,[SI]
     MOV CX,[SI+2]
     SUB DX,[SI+4]
     SBB CX,[SI+6]
     
     MOV HASIL,DX
     MOV HASIL+2,CX
      
     MOV AH, 4CH
     INT 21H
     
MAIN ENDP
END MAIN   

