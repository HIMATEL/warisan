title MP_L01_04
.model small
.stack 100h
.data

.code
main    proc  
        MOV CX,0 
        MOV DX,0FFFFH
        MOV CL,0FFH
        ADD DX,0AF45H
        ADC CL,7AH
        ADC CH,0
        ADD DX,6543H
        ADC CL,8BH
        ADC CH,0
        ADD DX,0FF66H
        ADC CL,0FFH
        ADC CH,0
        ADD DX,0E4C9H
        ADC CL,0DDH
        ADC CH,0
        ADD DX,0DDEEH
        ADC CL,9CH
        ADC CH,0
endp main    

end main