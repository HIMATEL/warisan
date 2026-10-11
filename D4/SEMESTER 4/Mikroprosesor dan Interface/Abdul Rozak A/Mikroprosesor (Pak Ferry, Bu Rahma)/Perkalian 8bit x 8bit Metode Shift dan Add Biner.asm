;METODE SHIFT DAN ADD KE KANAN            

TITLE 
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN    PROC  
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AH,8
        MOV BX,0
        ADD DH,0
        JZ ZZ
        ADD DL,0
        JZ ZZ
        MOV CH,0
        MOV CL,DH
        MOV AL,DL
AA:     SHR AL,1            
        JNC BB          
        ADD BX,CX             
BB:     SHL CX,1
        DEC AH
        JNZ AA                 
        
ZZ:     MOV AH,4CH
        INT 21H
MAIN ENDP
END MAIN


