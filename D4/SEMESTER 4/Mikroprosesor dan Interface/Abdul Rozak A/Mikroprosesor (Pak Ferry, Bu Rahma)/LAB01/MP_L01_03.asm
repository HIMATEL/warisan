title MP_L01_03
.model small
.stack 100h
.data

.code
main    proc
        mov cx,0ffffh
        add cx,0dd7ah
        adc bl,0
        add cx,448bh
        adc bl,0
        add cx,0aa66h
        adc bl,0
        add cx,88ddh
        adc bl,0
        add cx,9cffh
        adc bl,0
        
endp main    

end main