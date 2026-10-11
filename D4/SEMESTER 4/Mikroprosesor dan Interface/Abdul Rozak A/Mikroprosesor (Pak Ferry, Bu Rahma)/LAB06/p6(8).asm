.model small
.stack 100h
.data
   
 
.code                                                           

main proc
         mov ax,@data
         mov ds,ax
         mov bx,0
         
            
         
         mov dl,cl
         and cx,0fff0h
         shr cl,1
         shr cl,1
         shr cl,1
         shr cl,1
         mov al,cl
         add al,al
         daa
         
         sub dl,al
         mov al,dl
         sub al,0
         das 
         mov dl,al
         
         mov si,dx
         
         
         shr cx,1
         shr cx,1
         shr cx,1
         shr cx,1
         shr cx,1
         shr cx,1
         shr cx,1
         shr cx,1
         
         mov ch,cl
         and cl,0fh
         and ch,0f0h
         
         shr ch,1
         shr ch,1
         shr ch,1
         shr ch,1
         
         mov ax,0
                 
lup1:    cmp cl,0
         ja s1
         mov cl,0
         jbe lup2
s1:      add al,64h
         daa
         adc ah,0
         mov bl,al
         mov al,ah
         add al,0
         daa 
         mov bh,al
         mov al,bl
         mov ah,bh
         dec cl
         jnz lup1
         cmp ch,0
         mov dx,0
         jbe ex   
            
         mov ax,0
         mov dx,0
lup2:    add ax,512h
         daa 
         mov dl,al
         mov al,ah
         add al,0
         daa
         mov dh,al
         mov ax,dx
         dec ch
         jnz lup2
    mov dx,ax
         
ex:        add dx,si 
           mov ax,0
         mov al,dl
         add al,0
         daa 
         adc ah,0
         mov dl,al
         mov al,ah
         add al,dh
         daa
         mov dh,al
         
         add dx,bx
         mov ax,0
         mov al,dl
         add al,0
         daa 
         adc ah,0
         mov dl,al
         mov al,ah
         add al,dh
         daa
         mov dh,al

         
         
exit:    MOV AH,4CH
         INT 21H
         MAIN ENDP
END MAIN  
                  