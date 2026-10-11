TITLE M9_3 
.MODEL SMALL
.STACK 100H    
.DATA
        INPUT DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF               
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              DB 0,0,0,0,0FFH   ;FF
              
        OUTPUT DD 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
               DD 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 

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
            CMP BH,0
            JZ L0
            MOV AL,BH
            AND AL,0F0H
            SHR AL,1
            SHR AL,1
            SHR AL,1
            SHR AL,1
            
            ADD AL,0
            DAA
            
            ;PERKALIAN KE-1
L0:         CALL KALI 
            
            ;PERTAMBAHAN KE-1 
            MOV BH,[INPUT+SI]
            CMP BH,0
            JZ L1                       
            CMP BH,0
            AND BH,0FH
            ADD AL,BH
            DAA
            ADC AH,0           
            
            ;PERKALIAN KE-2
L1:         CALL KALI     
            
            
            ;PERTAMBAHAN KE-2
            INC SI
            MOV BH,[INPUT+SI] 
            CMP BH,0
            JZ L3                        
            AND BH,0F0H
            SHR BH,1
            SHR BH,1
            SHR BH,1
            SHR BH,1
            ADD AL,BH
            DAA
            ADC AH,0
            
            ;PERKALIAN KE-3
L3:         CALL KALI
            
            ;;PERTAMBAHAN KE-3
            MOV BH,[INPUT+SI]
            CMP BH,0
            JZ L4             
            AND BH,0FH 
            ADD AL,BH
            DAA
            ADC AH,0 
            
            ;PERKALIAN KE-4
L4:         CALL KALI
            
            
            ;PERTAMBAHAN KE-4
            INC SI
            MOV BH,[INPUT+SI]
            CMP BH,0
            JZ L5
            AND BH,0F0H
            SHR BH,1
            SHR BH,1
            SHR BH,1
            SHR BH,1
            ADD AL,BH
            DAA
            ADC AH,0
            
            ;PERKALIAN KE-5
L5:         CALL KALI 
            
            ;PERTAMBAHAN KE-5
            MOV BH,[INPUT+SI]
            CMP BH,0
            JZ L6            
            AND BH,0FH
            ADD AL,BH
            DAA
            ADC AH,0
            
            ;PERKALIAN KE-6
L6:         CALL KALI
            
            
            ;PERTAMBAHAN KE-6
            INC SI
            MOV BH,[INPUT+SI]
            CMP BH,0
            JZ L7
            AND BH,0F0H
            SHR BH,1
            SHR BH,1
            SHR BH,1
            SHR BH,1
            ADD AL,BH
            DAA
            ADC AH,0
            
            ;PERKALIAN KE-7
L7:         CALL KALI 
            
            ;PERTAMBAHAN KE-7
            MOV BH,[INPUT+SI]
            CMP BH,0
            JZ L8
            AND BH,0FH
            ADD AL,BH
            DAA
            ADC AH,0
            
            ;PERKALIAN KE-8
L8:         CALL KALI 
            
            
            ;;PERTAMBAHAN KE-8
            INC SI
            MOV BH,[INPUT+SI]
            CMP BH,0
            JZ L9
            AND BH,0F0H
            SHR BH,1
            SHR BH,1
            SHR BH,1
            SHR BH,1
            ADD AL,BH
            DAA
            ADC AH,0
            
            ;PERKALIAN KE-9
L9:         CALL KALI 
            
            ;;PERTAMBAHAN KE-9
            MOV BH,[INPUT+SI]
            CMP BH,0
            JZ L10
            AND BH,0FH
            ADD AL,BH 
            DAA
            ADC AH,0 
            
L10:         ;MEMASUKKAN HASIL KONVERSI KE DATA AREA 'OUTPUT'
            MOV [OUTPUT+DI],AX
            MOV [OUTPUT+DI+2],DX
            MOV [OUTPUT+DI+4],CX
            MOV BH,0
            MOV [OUTPUT+DI+6],BX
            
            ;COUNTER DATA
            ADD DI,8
            
            ;MENYESUAIKAN INPUT
            INC SI
            
            CMP DI,80H
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
                     
                        
                           
            ;GANDA 2 
              ;ADD AX,AX
            MOV [VARXX],AX
            CALL KOREKSI
            MOV AX,[VARXX]
            MOV BH,[ADCDAA]
            MOV [ADCDL],BH
                    
                           
                           
                           
            ;GANDA 3
              ;ADD AX,AX
            MOV [VARXX],AX
            CALL KOREKSI
            MOV AX,[VARXX]
            MOV BH,[ADCDAA]
            MOV [ADCDL],BH
                    
                
                            
                            
            ;GANDA 4
              ;ADD AX,AX
            MOV [VARXX],AX
            CALL KOREKSI
            MOV AX,[VARXX]
            MOV BH,[ADCDAA]
            MOV [ADCDL],BH
                    
                
                
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