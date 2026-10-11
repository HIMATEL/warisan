TITLE L02_05
.MODEL SMALL                                       
.STACK 100H
.DATA  
  
.CODE 
MAIN PROC         
     MOV AX, @DATA
     MOV DS, AX
     
     MOV CX,0       ;inisialisasi CX diisi dengan 0
     MOV DX,0       ;inisialisasi DX diisi dengan 0 
     
     MOV DX,0033H   ;register DX diisi dengan 33H
     MOV CX,0000H
     
     ADD DX,00EEH   ;Nilai register DX ditambahkan dengan EEH
     ADC CX,0000H
     
     ADD DX,0CD45H  ;nilai register DX ditambahkan dengan 0CD45H
     ADC CX,0ABH   ;nilai register CX ditambahkan dengan 00AAB dan carry flag 
     
     ADD DX,0B897H
     ADC CX,0AABH
     
     ADD DX,0CDEH
     ADC CX,0000H
     
     ADD DX,0DH
     ADC CX,00H
     
         
     MOV AH,4CH
     INT 21H      
MAIN ENDP
END  MAIN