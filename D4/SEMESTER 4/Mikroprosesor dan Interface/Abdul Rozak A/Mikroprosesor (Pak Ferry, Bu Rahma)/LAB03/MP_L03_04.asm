TITLE LAB03 NO4
.MODEL SMALL
.STACK 100H

.DATA
    BM1 DD 78903456H,59674321H,57654321H,62332220H,22117755H     
    BM2 DD 12345678H,28766550H,35667723H,12345678H,62117755H      
    BM3 DD 0,0,0,0,0 

.CODE
MAIN PROC                      ;program kali ini mirip dengan nomor sebelumnya, tetapi ini datanya
     MOV AX,@DATA              ;terdiri dari 8 digit, sehingga harus dipisah setiap 4 bits untuk
     MOV DS,AX                 ;disimpan di register, kemudian dipisah lagi menjadi 2 bits agar bisa
     MOV SI,0                  ;dikoreksi menjadi desimal
     MOV DI,0
                               ;setelah itu, dioperasikan dan hasilnya disimpan di BM3
        
     
     MOV AH,0
LUP: MOV DX,0
     MOV CX,0
     MOV BX,0
     MOV AL,0
     
     MOV DX,[BM1+SI]
     MOV CX,[BM2+SI]
     
     MOV AL,DL
     ADD AL,CL
     DAA
     MOV BL,AL
     ADC BH,0
       
     MOV AL,BH
     MOV BH,0
     
     ADD AL,DH
     ADD AL,CH
     DAA   
     ADC BH,0
     
     MOV DX,0
     MOV DL,BL
     MOV DH,AL
     MOV [BM3+SI],DX
             
             
             
     INC SI
     INC SI        
     MOV DX,0
     MOV CX,0
     MOV AL,0
     
     MOV DX,[BM1+SI]
     MOV CX,[BM2+SI]
     MOV AL,BH
     MOV BH,0
     
     ADD AL,DL
     DAA
     ADC BH,0
     ADD AL,CL
     DAA
     MOV BL,AL
     ADC BH,0
       
     MOV AL,BH
     MOV BH,0
     
     ADD AL,DH
     ADD AL,CH
     DAA   
     ADC BH,0 

     MOV DX,0
     MOV DL,BL
     MOV DH,AL
     MOV [BM3+SI],DX
       
     
     INC SI
     INC SI
     CMP SI,14H
     JNZ LUP
               
                  
     MOV AH,4CH
     INT 21H
    
MAIN ENDP
END MAIN