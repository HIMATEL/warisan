TITLE KONVERSI GRAY CODE TO BINARY 8 BIT
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN    PROC
  
        MOV CL,CH
        SHR CL,1
        XOR CL,CH
        SHR CL,1
        XOR CL,CH
        SHR CL,1
        XOR CL,CH
  
        MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN  
                  
