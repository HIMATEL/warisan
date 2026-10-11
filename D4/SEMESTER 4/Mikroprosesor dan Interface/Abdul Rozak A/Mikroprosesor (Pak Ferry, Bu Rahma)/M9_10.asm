TITLE M9_10
.MODEL SMALL
.STACK 100H    
.DATA
        INPUT DD 00000099H,0H
              DD 00000012H,0H
              DD 00000034H,0H
              DD 00000056H,0H
              DD 00000078H,0H
              DD 00000091H,0H
              DD 00000019H,0H
              DD 00000028H,0H              
              DD 00000037H,0H
              DD 00000046H,0H
              DD 00000025H,0H
              DD 00000006H,0H
              DD 00000004H,0H
              DD 00000044H,0H
              DD 00000055H,0H
              DD 00000018H,0H 
              
        OUTPUT DD 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        SIMPAN DD 0,0,0,0,0
        SIMPAN2 DB 0,0,0,0,0
        SIMPAN3 DB 0,0,0,0,0
.CODE
MAIN        PROC 
            MOV AX,@DATA
            MOV DS,AX
            MOV AX,0
            MOV SI,4
            MOV CL,0
            
ULANG:      MOV AX,0
            MOV BX,0
            MOV DX,0
            MOV CX,0
            
            MOV BX,[INPUT+SI]
            
            MOV AL,BL
            AND AL,0F0H
            SHR AL,1
            SHR AL,1
            SHR AL,1
            SHR AL,1
            
            CALL KALI 
    
            MOV CH,BL
            AND CH,0FH
            ADD AL,CH
            ADC AH,0           
            
            DEC SI
            DEC SI
            MOV BX,[INPUT+SI]
            
            CALL KALI
            
            MOV CH,BH
            AND CH,0F0H
            SHR CH,1
            SHR CH,1
            SHR CH,1
            SHR CH,1
            ADD AL,CH
            ADC AH,0
            
            CALL KALI

            MOV CH,BH 
            AND CH,0FH 
            ADD AL,CH
            ADC AH,0 
            
            CALL KALI
 
            MOV CH,BL
            AND CH,0F0H
            SHR CH,1
            SHR CH,1
            SHR CH,1
            SHR CH,1
            ADD AL,CH
            ADC AH,0
            
            CALL KALI 
    
            MOV CH,BL
            AND CH,0FH
            ADD AL,CH
            ADC AH,0
            
            
            DEC SI
            DEC SI
            MOV BX,[INPUT+SI]
            
            CALL KALI
            
            MOV CH,BH
            AND CH,0F0H
            SHR CH,1
            SHR CH,1
            SHR CH,1
            SHR CH,1
            ADD AL,CH
            ADC AH,0
            
            CALL KALI 
    
            MOV CH,BH
            AND CH,0FH
            ADD AL,CH
            ADC AH,0
 
            CALL KALI 
            
            MOV CH,BL
            AND CH,0F0H
            SHR CH,1
            SHR CH,1
            SHR CH,1
            SHR CH,1
            ADD AL,CH
            ADC AH,0
            
            CALL KALI 
    
            MOV CH,BL
            AND CH,0FH
            ADD AL,CH
            ADC AH,0 
            
            MOV [OUTPUT+DI],AX
    
            
            ADD SI,12
            INC DI
            
            CMP DI,16
            JNZ ULANG
             
            
            MOV AH,4CH
            INT 21H
            MAIN ENDP     

KALI        PROC 
            MOV [SIMPAN2],0
            MOV [SIMPAN2+1],0
            MOV [SIMPAN2+2],0
            
            MOV [SIMPAN3],0
            MOV [SIMPAN3+1],0
            MOV [SIMPAN3+2],0
             
            ADD AX,AX
            ADC [SIMPAN2],0
            ADD DX,DX
            ADC [SIMPAN3],0 
            ADD CL,CL
            ADD DL,[SIMPAN2]
            ADD CL,[SIMPAN3]
             
            MOV [SIMPAN],AX
            MOV [SIMPAN+2],DX
            ADD AX,AX
            ADC [SIMPAN2+1],0
            ADD DX,DX
            ADC [SIMPAN3+1],0
            ADD CL,CL
            ADD DL,[SIMPAN2+1]
            ADD CL,[SIMPAN3+1]            
            
            ADD AX,AX
            ADC [SIMPAN2+2],0
            ADD DX,DX
            ADC [SIMPAN3+2],0
            ADD CL,CL
            ADD DL,[SIMPAN2+2]
            ADD CL,[SIMPAN3+2]
            
            ADD AX,[SIMPAN]
            ADC DX,0 
            ADD DX,[SIMPAN+2]
            ADC CL,0
            RET
            KALI ENDP
END MAIN