TITLE LAB11 NO2
.MODEL SMALL                  
.STACK 100H      
.DATA  
.CODE
MAIN PROC    
     MOV AX,@DATA
     MOV DS,AX
     MOV AX,0
     MOV BX,0
     MOV CX,0
     
     MOV CX,1A01H  ; Memindahkan nilai 1A01H ke register CX
     MOV AX,CX     ; Memindahkan nilai dari CX ke AX
     MOV CX,0      ; Mengatur register CX menjadi 0
     MOV BX,AX     ; Memindahkan nilai AX ke BX
        
     AND BX,0FFF8H ; Melakukan operasi AND pada BX dengan 0FFF8H (1111111111111000) untuk menghapus 3 bit terakhir
     ADD BX,AX     ; Menambahkan nilai AX ke BX
     RCL CL,1      ; Rotate left melalui carry pada CL sebanyak 1 kali
     MOV DX,BX     ; Memindahkan nilai BX ke DX
     MOV BX,DX     ; Memindahkan nilai DX ke BX
        
     AND BX,0FF80H ; Melakukan operasi AND pada BX dengan 0FF80H (1111111110000000) untuk mengambil bit tertentu
     ADD DX,BX     ; Menambahkan nilai BX ke DX
     RCL CL,1      ; Rotate left melalui carry pada CL sebanyak 1 kali
     MOV BX,DX     ; Memindahkan nilai DX ke BX
        
     AND BX,0F800H ; Melakukan operasi AND pada BX dengan 0F800H (1111100000000000) untuk mengambil bit tertentu
     ADD DX,BX     ; Menambahkan nilai BX ke DX
     RCL CL,1      ; Rotate left melalui carry pada CL sebanyak 1 kali
     MOV BX,DX     ; Memindahkan nilai DX ke BX
        
     AND BX,08000H ; Melakukan operasi AND pada BX dengan 08000H (1000000000000000) untuk mengambil bit tertentu
     ADD DX,BX     ; Menambahkan nilai BX ke DX
     RCL CL,1      ; Rotate left melalui carry pada CL sebanyak 1 kali
     MOV BH,CL     ; Memindahkan nilai CL ke BH
        
     AND CL,0F8H   ; Melakukan operasi AND pada CL dengan 0F8H (11111000) untuk mengambil bit tertentu
     ADD CL,BH     ; Menambahkan nilai BH ke CL
      
     MOV AH,4CH 
     INT 21H
MAIN ENDP  
END MAIN                
