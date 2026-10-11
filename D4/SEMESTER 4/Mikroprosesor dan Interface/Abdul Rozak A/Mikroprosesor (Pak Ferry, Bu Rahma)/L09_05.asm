TITLE L09_06 ;KONVERSI HEKSADESIMAL 8 DIGIT KE DESIMAL
.MODEL SMALL
.STACK 100H    
.DATA
        INPUT DB 0H,0H,0FFH,0FFH,0FFH   ;FFFFFF
              DB 0H,0H,0C1H,07AH,099H   ;C17A99
              DB 0H,0H,027H,013H,0A3H   ;2713A3
              DB 0H,0H,0CCH,0ADH,0BDH   ;CCADBD
              DB 0H,0H,056H,049H,094H   ;564994
              DB 0H,0H,0B2H,01CH,08BH   ;B21C8B
              DB 0H,0H,07FH,0B3H,048H   ;7FB348
              DB 0H,0H,045H,09AH,08AH   ;459A8A
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
            
            ;PERKALIAN KE-6
            CALL KALI
            
            
            ;PERTAMBAHAN KE-6
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
            
            ;PERKALIAN KE-7
            CALL KALI 
            
            ;PERTAMBAHAN KE-7
            MOV BH,[INPUT+SI]
            AND BH,0FH
            ADD AL,BH
            DAA
            ADC AH,0
            
            ;PERKALIAN KE-8
            CALL KALI 
            
            
            ;;PERTAMBAHAN KE-8
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
            
            ;PERKALIAN KE-9
            CALL KALI 
            
            ;;PERTAMBAHAN KE-9
            MOV BH,[INPUT+SI]
            AND BH,0FH
            ADD AL,BH 
            DAA
            ADC AH,0 
            
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