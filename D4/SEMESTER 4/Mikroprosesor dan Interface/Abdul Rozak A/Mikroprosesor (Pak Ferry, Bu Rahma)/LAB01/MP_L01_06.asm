title MP_L01_06
.model small
.stack 100h
.data
  
.code
main    proc
        mov ax,@data
        mov ds,ax
        
        mov dx,0ff5fh
        mov cx,0
        mov cl,56h
        add dx,79h
        adc cl,0
        
        mov ah,4ch
        int 21h
        
endp main    

end main