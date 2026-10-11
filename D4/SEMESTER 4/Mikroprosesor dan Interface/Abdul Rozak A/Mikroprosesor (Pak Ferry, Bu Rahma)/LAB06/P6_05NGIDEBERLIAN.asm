TITLE P6_05   ;KONVERSI DESIMAL KE OKTAL 4 DIGIT (INPUT BH=MSB,CH=LSB)
.MODEL SMALL
.STACK 100H
.DATA
SIMPAN DW 0,0
HASIL DD 0  
.CODE

MAIN     PROC
         MOV SI,0
         MOV AX,@DATA
         MOV DS,AX
         ;KONVERSI SATUAN DES KE OKT{DISIMPAN DI BL)
         MOV AL,CH
         AND AL,0FH
         MOV BL,AL
         CMP BL,7H
         JBE SANA
         ADD BL,8H
SANA:    
         ;KONVERSI PULUHAN DES KE OKT(DISIMPAN DI AX)
         ;DENGAN CARA DIGANDAKAN 3 KALI
         ;DITAMBAHKAN BIL. HASIL GANDA PERTAMA
         ;DITAMBAHKAN SATUAN      
         MOV AL,CH
         AND AL,0F0H
         MOV CL,4H
         SHR AL,CL
         CMP AL,7H
         JBE SINI
         ADD AL,8H
SINI:    
         MOV AH,0
         ADD AL,AL
         MOV CL,AL
         AND CL,0FH
         CMP CL,08H
         JB DITU1.0
         ADD AL,08H
DITU1.0: MOV CL,AL
         AND CL,0F0H
         CMP CL,80H
         JB DIEU1.0
         ADD AL,80H
         
    
DIEU1.0: MOV CL,AL   
         ADD AL,AL
         MOV DL,AL
         AND DL,0FH
         CMP DL,08H
         JB DITU1.1
         ADD AL,08H
DITU1.1: MOV DL,AL
         AND DL,0F0H
         CMP DL,80H
         JB DIEU1.1
         ADD AL,80H
          
         
DIEU1.1: ADD AL,AL
         MOV DL,AL
         AND DL,0FH
         CMP DL,08H
         JB DITU1.2
         ADD AL,08H
DITU1.2: MOV DL,AL
         AND DL,0F0H
         CMP DL,80H
         JB DIEU1.2
         ADD AL,80H
         ADC AH,0
         
DIEU1.2: MOV CH,0
         ;REGISTER BX DAN CX SUDAH OKTAL
         ADD BL,CL
         ADD AL,BL
         MOV DX,AX
         AND DX,0FH
         CMP DX,08H
         JB DITU1.3
         ADD AX,08H
DITU1.3: MOV DX,AX
         AND DX,0F0H
         CMP DX,80H
         JB DIEU1.3
         ADD AX,80H
         
         
DIEU1.3: MOV [SIMPAN+0],AX
         
         
         ;KONVERSI RATUSAN DES KE OKT(DISIMPAN DI AX)
         ;DENGAN CARA DIGANDAKAN 3 KALI
         ;DITAMBAHKAN BIL. HASIL GANDA PERTAMA
         ;DITAMBAHKAN PULUHAN DAN SATUAN
         MOV AL,BH
         AND AL,0FH
         ;MOV CL,4H
         ;SHR AL,CL
         CMP AL,7H
         JBE SINI2.6
         ADD AL,8H
SINI2.6:    
         MOV AH,0
         MOV BL,AL
         ADD AL,AL
         MOV CL,AL
         AND CL,0FH
         CMP CL,08H
         JB DITU9.0
         ADD AL,08H
DITU9.0: MOV CL,AL
         AND CL,0F0H
         CMP CL,80H
         JB DIEU9.0
         ADD AL,80H
         
    
DIEU9.0: MOV CL,AL   
         ADD AL,AL
         MOV DL,AL
         AND DL,0FH
         CMP DL,08H
         JB DITU9.1
         ADD AL,08H
DITU9.1: MOV DL,AL
         AND DL,0F0H
         CMP DL,80H
         JB DIEU9.1
         ADD AL,80H
          
         
DIEU9.1: ADD AL,AL
         MOV DL,AL
         AND DL,0FH
         CMP DL,08H
         JB DITU9.2
         ADD AL,08H
DITU9.2: MOV DL,AL
         AND DL,0F0H
         CMP DL,80H
         JB DIEU9.2
         ADD AL,80H
         ADC AH,0
         
DIEU9.2: MOV CH,0
         ;REGISTER BX DAN CX SUDAH OKTAL
         ;ADD BL,CL
         ;ADD BL,CL
         ADD AL,CL
         MOV DX,AX
         
         AND DX,0FH
         CMP DX,08H
         JB DITU9.3
         ADD AX,08H
DITU9.3: MOV DX,AX
         AND DX,0F0H
         CMP DX,80H
         JB DIEU9.3
         ADD AX,80H  
DIEU9.3:         

         ;GANDA 1
         MOV DX,AX
         ADD DX,DX
         MOV CL,DL
         AND CL,0FH
         CMP CL,08H
         JB DITU2.0
         ADD DL,08H
DITU2.0: MOV CL,DL
         AND CL,0F0H
         CMP CL,80H
         JB DIEU3.0
         ADD DL,80H
         ADC DH,0 ;TANDA
         
DIEU3.0: MOV CH,DH
         AND CH,0FH
         CMP CH,08H
         JB DITU2.1
         ADD DH,08H
DITU2.1: MOV CH,DH
         AND CH,0F0H
         CMP CH,80H
         JB DIEU3.1
         ADD DH,80H
         
         
                  
DIEU3.1: MOV AX,DX ;TANDA
         
         
         ;GANDA 2         
         ADD DX,DX
         MOV CL,DL
         AND CL,0FH
         CMP CL,08H
         JB DITU2.4
         ADD DL,08H
DITU2.4: MOV CL,DL
         AND CL,0F0H
         CMP CL,80H
         JB DIEU3.4
         ADD DL,80H
         ADC DH,0
      
DIEU3.4: MOV CL,DH
         AND CL,0FH
         CMP CL,08H
         JB DITU2.5
         ADD DH,08H
DITU2.5: MOV CL,DH
         AND CL,0F0H
         CMP CL,80H
         JB DIEU3.5
         ADD DL,80H
         ADC DH,0
         
         
         ;GANDA 3
DIEU3.5: ADD DX,DX
         MOV CL,DL
         AND CL,0FH
         CMP CL,08H
         JB DITU2.6
         ADD DL,08H
DITU2.6: MOV CL,DL
         AND CL,0F0H
         CMP CL,80H
         JB DIEU3.6
         ADD DL,80H
         ADC DH,0
         
DIEU3.6: MOV CL,DH
         AND CL,0FH
         CMP CL,08H
         JB DITU2.7
         ADD DH,08H
DITU2.7: MOV CL,DH
         AND CL,0F0H
         CMP CL,80H
         JB DIEU3.7
         ADD DL,80H
         
 
      
DIEU3.7: ADD AX,DX      ;TANDA
         MOV CH,AL
         AND CH,0FH
         CMP CH,08H
         JB DITU2.8
         ADD AL,08H
DITU2.8: MOV CH,AL
         AND CH,0F0H
         CMP CH,80H
         JB DIEU3.8
         ADD AL,80H
         ADC AH,0                  
DIEU3.8: MOV CH,AH
         AND CH,0FH
         CMP CH,08H
         JB DITU2.9
         ADD AH,08H
DITU2.9: MOV CH,AH
         AND CH,0F0H
         CMP CH,80H
         JB DIEU3.9
         ADD AH,80H
         
                  
DIEU3.9: 
         MOV [SIMPAN+2],AX        
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         ;KONVERSI RIBUAN DES KE OKT(DISIMPAN DI AX)
         ;DENGAN CARA DIGANDAKAN 3 KALI
         ;DITAMBAHKAN BIL. HASIL GANDA PERTAMA
         ;DITAMBAHKAN PULUHAN DAN SATUAN
         MOV AL,BH
         AND AL,0F0H
         MOV CL,4H
         SHR AL,CL
         CMP AL,7H
         JBE SINI2.7
         ADD AL,8H
SINI2.7: 
         ;GANDA 1 (PULUHAN)   
         MOV AH,0
         MOV BL,AL
         ADD AL,AL
         MOV CL,AL
         AND CL,0FH
         CMP CL,08H
         JB DITU4.0
         ADD AL,08H
DITU4.0: MOV CL,AL
         AND CL,0F0H
         CMP CL,80H
         JB DIEU4.0
         ADD AL,80H
         
         ;GANDA 2 (PULUHAN)
DIEU4.0: MOV CL,AL   
         ADD AL,AL
         MOV DL,AL
         AND DL,0FH
         CMP DL,08H
         JB DITU4.1
         ADD AL,08H
DITU4.1: MOV DL,AL
         AND DL,0F0H
         CMP DL,80H
         JB DIEU4.1
         ADD AL,80H
          
         ;GANDA 3 (PULUHAN)
DIEU4.1: ADD AL,AL
         MOV DL,AL
         AND DL,0FH
         CMP DL,08H
         JB DITU4.2
         ADD AL,08H
DITU4.2: MOV DL,AL
         AND DL,0F0H
         CMP DL,80H
         JB DIEU4.2
         ADD AL,80H
         ADC AH,0
         
DIEU4.2: MOV CH,0
         ;REGISTER BX DAN CX SUDAH OKTAL
         ;ADD BL,CL
         ;ADD BL,CL
         ADD AL,CL
         MOV DX,AX
         
         AND DX,0FH
         CMP DX,08H
         JB DITU4.3
         ADD AX,08H
DITU4.3: MOV DX,AX
         AND DX,0F0H
         CMP DX,80H
         JB DIEU4.3
         ADD AX,80H  
DIEU4.3:         

         ;GANDA 1 (RATUSAN)
         MOV DX,AX
         ADD DX,DX
         MOV CL,DL
         AND CL,0FH
         CMP CL,08H
         JB DITU5.0
         ADD DL,08H
DITU5.0: MOV CL,DL
         AND CL,0F0H
         CMP CL,80H
         JB DIEU5.0
         ADD DL,80H
         ADC DH,0
DIEU5.0: MOV CH,DH
         AND CH,0FH
         CMP CH,08H
         JB DITU5.1
         ADD DH,08H
DITU5.1: MOV CH,DH
         AND CH,0F0H
         CMP CH,80H
         JB DIEU5.1
         ADD DH,80H
         
         
                  
DIEU5.1: MOV AX,DX
         
         
         ;GANDA 2 (RATUSAN)        
         ADD DX,DX
         MOV CL,DL
         AND CL,0FH
         CMP CL,08H
         JB DITU4.4
         ADD DL,08H
DITU4.4: MOV CL,DL
         AND CL,0F0H
         CMP CL,80H
         JB DIEU4.4
         ADD DL,80H
         ADC DH,0
      
DIEU4.4: MOV CL,DH
         AND CL,0FH
         CMP CL,08H
         JB DITU4.5
         ADD DH,08H
DITU4.5: MOV CL,DH
         AND CL,0F0H
         CMP CL,80H
         JB DIEU4.5
         ADD DL,80H
         ADC DH,0
         
         
         ;GANDA 3 (RATUSAN)
DIEU4.5: ADD DX,DX
         MOV CL,DL
         AND CL,0FH
         CMP CL,08H
         JB DITU4.6
         ADD DL,08H
DITU4.6: MOV CL,DL
         AND CL,0F0H
         CMP CL,80H
         JB DIEU4.6
         ADD DL,80H
         ADC DH,0
         
DIEU4.6: MOV CL,DH
         AND CL,0FH
         CMP CL,08H
         JB DITU4.7
         ADD DH,08H
DITU4.7: MOV CL,DH
         AND CL,0F0H
         CMP CL,80H
         JB DIEU4.7
         ADD DL,80H
         
 
      
DIEU4.7: ADD AX,DX
         MOV CH,AL
         AND CH,0FH
         CMP CH,08H
         JB DITU4.8
         ADD AL,08H
DITU4.8: MOV CH,AL
         AND CH,0F0H
         CMP CH,80H
         JB DIEU4.8
         ADD AL,80H
         ADC AH,0                  
DIEU4.8: MOV CH,AH
         AND CH,0FH
         CMP CH,08H
         JB DITU4.9
         ADD AH,08H
DITU4.9: MOV CH,AH
         AND CH,0F0H
         CMP CH,80H
         JB DIEU4.9
         ADD AH,80H       
           
                  
DIEU4.9: 

         ;GANDA 1 (RIBUAN)
         ADD AX,AX
         MOV CH,AL
         AND CH,0FH
         CMP CH,08H
         JB DITU6.0
         ADD AL,08H
DITU6.0: MOV CH,AL
         AND CH,0F0H
         CMP CH,80H
         JB DIEU6.0
         ADD AL,80H
         ADC AH,0                  
DIEU6.0: MOV CH,AH
         AND CH,0FH
         CMP CH,08H
         JB DITU6.1
         ADD AH,08H
DITU6.1: MOV CH,AH
         AND CH,0F0H
         CMP CH,80H
         JB DIEU6.1
         ADD AH,80H       
           
                  
DIEU6.1: MOV DX,AX
         
         ;GANDA 2 (RIBUAN)
         ADD AX,AX
         MOV CH,AL
         AND CH,0FH
         CMP CH,08H
         JB DITU6.2
         ADD AL,08H
DITU6.2: MOV CH,AL
         AND CH,0F0H
         CMP CH,80H
         JB DIEU6.2
         ADD AL,80H
         ADC AH,0                  
DIEU6.2: MOV CH,AH
         AND CH,0FH
         CMP CH,08H
         JB DITU6.3
         ADD AH,08H
DITU6.3: MOV CH,AH
         AND CH,0F0H
         CMP CH,80H
         JB DIEU6.3
         ADD AH,80H       
           
                  
DIEU6.3: MOV BL,0
         ;GANDA 3 {RIBUAN}
         ADD AX,AX
         MOV CH,AL
         AND CH,0FH
         CMP CH,08H
         JB DITU6.4
         ADD AL,08H
DITU6.4: MOV CH,AL
         AND CH,0F0H
         CMP CH,80H
         JB DIEU6.4
         ADD AL,80H
         ADC AH,0                  
DIEU6.4: MOV CH,AH
         AND CH,0FH
         CMP CH,08H
         JB DITU6.5
         ADD AH,08H
DITU6.5: MOV CH,AH
         AND CH,0F0H
         CMP CH,80H
         JB DIEU6.5
         ADD AH,80H
         ADC BL,0       
           
                  
DIEU6.5: ADD AX,DX
         MOV CH,AL
         AND CH,0FH
         CMP CH,08H
         JB DITU7.0
         ADD AL,08H
DITU7.0: MOV CH,AL
         AND CH,0F0H
         CMP CH,80H
         JB DIEU7.0
         ADD AL,80H
         ADC AH,0                  
DIEU7.0: MOV CH,AH
         AND CH,0FH
         CMP CH,08H
         JB DITU7.1
         ADD AH,08H
DITU7.1: MOV CH,AH
         AND CH,0F0H
         CMP CH,80H
         JB DIEU7.1
         ADD AH,80H
         ADC BL,0       
           
                  
DIEU7.1: MOV DX,AX     ;TANDA
         ADD DX,[SIMPAN+0]
         MOV CH,DL
         AND CH,0FH
         CMP CH,08H
         JB DITU6.6
         ADD DL,08H
DITU6.6: MOV CH,DL
         AND CH,0F0H
         CMP CH,80H
         JB DIEU6.6
         ADD DL,80H
         ADC DH,0                  
DIEU6.6: MOV CH,DH
         AND CH,0FH
         CMP CH,08H
         JB DITU6.7
         ADD DH,08H
DITU6.7: MOV CH,DH
         AND CH,0F0H
         CMP CH,80H
         JB DIEU6.7
         ADD DH,80H           
                  
DIEU6.7:
         INC DI
         INC DI
         ADD DX,[SIMPAN+2]
         MOV CH,DL
         AND CH,0FH
         CMP CH,08H
         JB DITU6.8
         ADD DL,08H
DITU6.8: MOV CH,DL
         AND CH,0F0H
         CMP CH,80H
         JB DIEU6.8
         ADD DL,80H
         ADC DH,0                  
DIEU6.8: MOV CH,DH
         AND CH,0FH
         CMP CH,08H
         JB DITU6.9
         ADD DH,08H
DITU6.9: MOV CH,DH
         AND CH,0F0H
         CMP CH,80H
         JB DIEU6.9
         ADD DH,80H           
         ADC BL,0         
DIEU6.9:
         MOV BH,0
         MOV SI,0
         MOV [HASIL+SI],DX
         INC SI
         INC SI
         MOV [HASIL+SI],BX
         
         MOV AH,4CH
         INT 21H
         
         MAIN ENDP
END MAIN

        
        
