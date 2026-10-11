TITLE L04_04       ;penjumlahan oktal
.MODEL SMALL
.STACK 100H
.DATA 
  BM1 DD 7403456H, 2674321H, 7654321H, 2354765H, 2211775H
  BM2 DD 6234567H, 6766550H, 5566772H, 7234567H, 6217755H
  BM3 DD 0,0,0,0,0,0,0,0,0,0


.CODE
MAIN PROC  
     MOV AX,@DATA
     MOV DS,AX 
                
        MOV AX,0        
        MOV CX,0
        MOV DX,0
        MOV SI,0
        
 LUP:   MOV CX,0
        MOV DX,[BM1+SI]
        ADD DX,[BM2+SI] ;penjumalahan 4 digit terakhir
        ADC CL,0
        INC SI
        INC SI              ; SI = 2
        ADD CX,[BM1+SI]              
        ADD CX,[BM2+SI]    ;penjumlahan 4 digit kedua (dari belakang)   
        
        ;=====koreksi====
        MOV AL,DL    ;digit 1                   0101 0110
        AND AL,0FH  ;misahin satuan             0000 1111
        CMP AL,08H  ;                           0000 0110 // 06
        JB  SKIP0
        ADD DL,08H
        ADC DH,0
        
 SKIP0: MOV AL,DL    ;digit 2
        AND AL,0F0H  ;misahin puluhan           1111 0000
        CMP AL,80H
        JB  SKIP1
        ADD DL,80H
        ADC DH,0  
        ; register DL sudah terkoreksi
        
 SKIP1: MOV AL,DH    ;digit 3
        AND AL,0FH
        CMP AL,08H
        JB  SKIP2
        ADD DH,08H
        ADC CL,0
        
 SKIP2: MOV AL,DH    ;digit 4
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP3
        ADD DH,80H
        ADC CL,0   
        ; register DH sudah terkoreksi
        
 SKIP3: MOV [BM3+SI],DX     ; 00000000 ==> 0000abcd
 
        
        
        ;===koreksi===
        MOV AL,CL     ;digit 5
        AND AL,0FH
        CMP AL,08H
        JB  SKIP4
        ADD CL,08H
        ADC CH,0
        
 SKIP4: MOV AL,CL     ;digit 6
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP5
        ADD CL,80H
        ADC CH,0
        
 SKIP5: MOV AL,CH     ;digit 7
        AND AL,0FH
        CMP AL,08H
        JB  SKIP6
        ADD CH,08H
        
 SKIP6: MOV [BM3+SI],CX  ; 0000abdc ==> wxyzabcd
 
        INC SI
        INC SI         ; SI=4
        
        CMP SI,14H
        JB  LUP
           
     MOV AH,4CH
     INT 21h     
MAIN ENDP                 
END MAIN                  