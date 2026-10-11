TITLE KONVERSI BINARY TO GRAY CODE 16 BIT
.MODEL SMALL
.STACK 100h
.DATA      
.CODE                                                           

MAIN PROC
    
        MOV DX,CX
        MOV BX,CX
        
        SHR BX,1 
        XOR DX,BX
     
        
         MOV AH,4CH
         INT 21H
         MAIN ENDP
END MAIN  
                  
