.MODEL SMALL
.STACK 100h
.DATA    
.CODE                                                           

MAIN PROC
    
        MOV CL,CH
        MOV BL,CH        
        SHR BL,1 
        XOR CL,BL        
                  
         MOV AH,4CH
         INT 21H
         MAIN ENDP
END MAIN  
                  
