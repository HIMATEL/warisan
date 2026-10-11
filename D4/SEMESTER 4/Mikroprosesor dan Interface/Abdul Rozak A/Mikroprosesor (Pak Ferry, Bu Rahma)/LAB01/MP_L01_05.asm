title MP_L01_05
.model small
.stack 100h
.data
bil db 0FFH,7AH,8BH,66H,0DDH, 9CH. 88H,54H,0B7H,99H,7EH,9DH,5EH,2BH,66H,4FH,0C5H,7AH,0AAH,9CH  
.code
main    proc
        mov ax,@data
        mov ds,ax
        
        mov di,0
        mov cx,[di]
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di] 
        add di,1
        add cx,[di]  
        
        mov ah,4ch
        int 21h
        
endp main    

end main