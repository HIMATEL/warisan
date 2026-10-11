TITLE M9_5 
.MODEL SMALL
.STACK 100H    
.DATA
        INPUT DB 0FFH,0FFH,0FFH,0,0   
              DB 0FFH,0FFH,0FFH,0,0   
              DB 0FFH,0FFH,0FFH,0,0   
              DB 0FFH,0FFH,0FFH,0,0   
              DB 0FFH,0FFH,0FFH,0,0   
              DB 0FFH,0FFH,0FFH,0,0   
              DB 0FFH,0FFH,0FFH,0,0   
              DB 0FFH,0FFH,0FFH,0,0   
              
        OUTPUT DD 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        ADCDL DB 0,0
        ADCCL DB 0,0
        VARAX DW 0,0,0,0
        VARXX DW 0,0,0,0
        ADCDAA DB 0,0
.CODE
MAIN        PROC 
            MOV AX,@DATA
            MOV DS,AX
            MOV SI,0
            MOV DI,0
            
ULANG:      MOV AX,0
            MOV BX,0
            MOV DX,0
            MOV CX,0
            
            MOV BH,[INPUT+SI]
            MOV AL,BH
            AND AL,0F0H
            SHR AL,1
            SHR AL,1
            SHR AL,1
            SHR AL,1
            
            ADD AL,0
            DAA
            
            ;PERKALIAN KE-1
            CALL KALI 
            
            ;PERTAMBAHAN KE-1 
            MOV BH,[INPUT+SI]                       
            AND BH,0FH
            ADD AL,BH
            DAA
            ADC AH,0           
            
            ;PERKALIAN KE-2
            CALL KALI     
            
            
            ;PERTAMBAHAN KE-2
            INC SI
            MOV BH,[INPUT+SI]                         
            AND BH,0F0H
            SHR BH,1
            SHR BH,1
            SHR BH,1
            SHR BH,1
            ADD AL,BH
            DAA
            ADC AH,0
            
            ;PERKALIAN KE-3
            CALL KALI
            
            ;;PERTAMBAHAN KE-3
            MOV BH,[INPUT+SI]             
            AND BH,0FH 
            ADD AL,BH
            DAA
            ADC AH,0 
            
            ;PERKALIAN KE-4
            CALL KALI
            
            
            ;PERTAMBAHAN KE-4
            INC SI
            MOV BH,[INPUT+SI]
            AND BH,0F0H
            SHR BH,1
            SHR BH,1
            SHR BH,1
            SHR BH,1
            ADD AL,BH
            DAA
            ADC AH,0
            
            ;PERKALIAN KE-5
            CALL KALI 
            
            ;PERTAMBAHAN KE-5
            MOV BH,[INPUT+SI]            
            AND BH,0FH
            ADD AL,BH
            DAA
            ADC AH,0
            
            
            INC SI
            INC SI
            
            ;MEMASUKKAN HASIL KONVERSI KE DATA AREA 'OUTPUT'
            MOV [OUTPUT+DI],AX
            MOV [OUTPUT+DI+2],DX
            MOV [OUTPUT+DI+4],CX
            MOV BH,0
            MOV [OUTPUT+DI+6],BX
            
            ;COUNTER DATA
            ADD DI,8
            
            ;MENYESUAIKAN INPUT
            INC SI
            
            CMP DI,40H
            JNZ ULANG
             
            
            MOV AH,4CH
            INT 21H
            MAIN ENDP 
            
            
            
                

KALI        PROC 
            ;MOV [SIMPAN2],0
            ;MOV [SIMPAN2+1],0
            ;MOV [SIMPAN2+2],0
            
            ;MOV [SIMPAN3],0
            ;MOV [SIMPAN3+1],0
            ;MOV [SIMPAN3+2],0
            MOV BH,0               
                           
            ;GANDA 1
              ;ADD AX,AX
            MOV [VARXX],AX
            CALL KOREKSI
            MOV AX,[VARXX]
            MOV BH,[ADCDAA]
            MOV [ADCDL],BH
                    
                ;AMANKAN DATA DI AX AGAR DAA BISA DILAKUKAN
                MOV [VARAX],AX
            
             ;ADD DX,DX
            MOV [VARXX],DX
            CALL KOREKSI
            MOV DX,[VARXX]
            MOV BH,[ADCDAA]
            MOV [ADCCL],BH
            
             ;ADD CX,CX
            MOV [VARXX],CX
            CALL KOREKSI      
            MOV CX,[VARXX] 
            ADD BL,[ADCDAA]  
            
            ADD DL,[ADCDL]
            ADD CL,[ADCCL]
            
                ;KEMBALIKAN DATA DI VARAX KE AX UNTUK PENGGANDAAN SELANJUTNYA
                MOV AX,[VARAX] 
                        
                           
            ;GANDA 2 
              ;ADD AX,AX
            MOV [VARXX],AX
            CALL KOREKSI
            MOV AX,[VARXX]
            MOV BH,[ADCDAA]
            MOV [ADCDL],BH
                    
                ;AMANKAN DATA DI AX AGAR DAA BISA DILAKUKAN
                MOV [VARAX],AX
            
             ;ADD DX,DX
            MOV [VARXX],DX
            CALL KOREKSI
            MOV DX,[VARXX]
            MOV BH,[ADCDAA]
            MOV [ADCCL],BH
            
             ;ADD CX,CX
            MOV [VARXX],CX
            CALL KOREKSI      
            MOV CX,[VARXX] 
            ADD BL,[ADCDAA]  
            
            ADD DL,[ADCDL]
            ADD CL,[ADCCL]
            
                ;KEMBALIKAN DATA DI VARAX KE AX UNTUK PENGGANDAAN SELANJUTNYA
                MOV AX,[VARAX]           
                           
                           
            ;GANDA 3
              ;ADD AX,AX
            MOV [VARXX],AX
            CALL KOREKSI
            MOV AX,[VARXX]
            MOV BH,[ADCDAA]
            MOV [ADCDL],BH
                    
                ;AMANKAN DATA DI AX AGAR DAA BISA DILAKUKAN
                MOV [VARAX],AX
            
             ;ADD DX,DX
            MOV [VARXX],DX
            CALL KOREKSI
            MOV DX,[VARXX]
            MOV BH,[ADCDAA]
            MOV [ADCCL],BH
            
             ;ADD CX,CX
            MOV [VARXX],CX
            CALL KOREKSI      
            MOV CX,[VARXX] 
            ADD BL,[ADCDAA]  
            
            ADD DL,[ADCDL]
            ADD CL,[ADCCL]
            
                ;KEMBALIKAN DATA DI VARAX KE AX UNTUK PENGGANDAAN SELANJUTNYA
                MOV AX,[VARAX]
                            
                            
            ;GANDA 4
              ;ADD AX,AX
            MOV [VARXX],AX
            CALL KOREKSI
            MOV AX,[VARXX]
            MOV BH,[ADCDAA]
            MOV [ADCDL],BH
                    
                ;AMANKAN DATA DI AX AGAR DAA BISA DILAKUKAN
                MOV [VARAX],AX
            
             ;ADD DX,DX
            MOV [VARXX],DX
            CALL KOREKSI
            MOV DX,[VARXX]
            MOV BH,[ADCDAA]
            MOV [ADCCL],BH
            
             ;ADD CX,CX
            MOV [VARXX],CX
            CALL KOREKSI      
            MOV CX,[VARXX] 
            ADD BL,[ADCDAA]  
            
            ADD DL,[ADCDL]
            ADD CL,[ADCCL]
            
                ;KEMBALIKAN DATA DI VARAX KE AX UNTUK PENGGANDAAN SELANJUTNYA
                MOV AX,[VARAX]
                
            MOV BH,0
                
                
            RET
            KALI ENDP 
           
            
            
            
KOREKSI     PROC
            MOV [ADCDAA],0
            
            MOV AX,[VARXX]                     
            
            MOV BH,AH
            MOV AH,0
            
            ADD AL,AL
            DAA
            ADC AH,0 
            MOV BL,AL
            
            MOV AL,BH
            ADD AL,AL
            DAA
            ADC [ADCDAA],0
            
            ADD AL,AH
            DAA
            
            MOV AH,AL
            MOV AL,BL
            MOV BX,0
            
            MOV [VARXX],AX
            RET

END MAIN