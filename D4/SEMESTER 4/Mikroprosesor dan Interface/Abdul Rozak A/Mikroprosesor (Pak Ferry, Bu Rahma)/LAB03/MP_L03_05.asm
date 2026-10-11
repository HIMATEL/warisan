TITLE L03_05
.MODEL SMALL
.STACK 100H

.DATA
    BM1 DD 78903496H,9H,59674321H,1H,23456746H,5H,31422566H,7H     ;digit awal dipisahkan
    BM2 DD 12345678H,9H,28766550H,3H,42546477H,7H,22365864H,2H      
    BM3 DD 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 


.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX 
     MOV SI,0
     MOV DI,0
     MOV AX,0
        
        
     ;PENJUMLAHAN 4 DIGIT PERTAMA
LUP: MOV DX,0
     MOV CX,0
     MOV BX,0
     MOV AX,0
     
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
                    
     ;PENJUMLAHAN 4 DIGIT KEDUA        
     INC SI
     INC SI        
     MOV DX,0
     MOV CX,0
     MOV AL,0
     MOV BL,0      
      
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
     
     
     ;PENJUMLAHAN 1 TERAKHIR        
     MOV DX,0
     MOV CX,0
     MOV AL,0
     MOV BL,0
     INC SI
     INC SI
      
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

     MOV DX,0
     MOV DL,BL

     MOV [BM3+SI],DX
     
     INC SI
     INC SI
     INC SI
     INC SI
     CMP SI,020H
     JNZ LUP
               
                  
     MOV AH,4CH
     INT 21H
    
MAIN ENDP
END MAIN                 