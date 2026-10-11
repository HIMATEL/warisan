TITLE UTS NO1
.MODEL SMALL
.STACK 100H
.DATA      
DAT1 DW 16 DUP(0)  
  
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    MOV SI,0
    ; INISIALISASI 2 DATA PERTAMA
    MOV [DAT1+SI],100H     
    INC SI
    INC SI
    MOV [DAT1+SI],85H 
    MOV SI,0   
    MOV AH,0 
    MOV DI,4
     
     ; MEMBUAT DERETAN DATA YAITU 100, 85, 75, 60,.. DST
L1:  MOV AX,[DAT1+SI]
     SUB AL,25H  
     SBB AH,0
     DAS

     MOV [DAT1+[SI+4]],AX
     INC DI
     INC SI
     INC SI     
     MOV AH,0
     MOV AX,[DAT1+SI]
     SUB AL,25H
     SBB AH,0 
     DAS       
     MOV [DAT1+[SI+4]],AX
     MOV AH,0
     INC SI  
     INC SI
     INC DI

    CMP SI, 9H
    JB L1    
    MOV SI,0    
    MOV CX,0   
   
    ; LOOP PENJUMLAHAN SEMUA DERET  
    MOV BX,[DAT1+11H]
    MOV SI,0FH 
L2: MOV AX,BX
    CLC
    ADD AL,BYTE PTR [DAT1+[SI-1]] 
    DAA
    ADC BH, 0    
    MOV BL, AL 
    MOV AL, BH
    ADD AL, BYTE PTR  [DAT1+[SI-2]]  
    DAA
    MOV BH,AL 
    DEC SI
    DEC SI   
    CMP SI,1
    JA L2  
    MOV CX,BX               
    MOV AH,4CH
    INT 21H   
 
    MAIN ENDP
END MAIN 
