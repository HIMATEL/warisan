TITLE L04_01
.MODEL SMALL
.STACK 100H
.DATA 
 BM1 DW 1663h,7347h,6351h,4324h,5632h,4423h,1557h,4700h,4602h,7535h
 BM2 DW 3437h,4346h,3463h,3472h,4443h,2762h,4023h,6723h,3225h,6251h
 BM3 DW 10 DUP(0)
 BM4 DB 10 DUP(0)


.CODE
MAIN PROC  
     MOV AX,@DATA
     MOV DS,AX 
                
        MOV AX,0        
        MOV CX,0
        MOV DX,0
        MOV SI,0
        
 LUP:   MOV CL,0
        MOV DX,[BM1+SI]
        ADD DX,[BM2+SI]
        ADC CL,0
       
        MOV AL,DL
        AND AL,0FH
        CMP AL,08H
        JB  SKIP0
        ADD DL,08H
        ADC DH,0
        
 SKIP0: MOV AL,DL
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP1
        ADD DL,80H
        ADC DH,0
        
 SKIP1: MOV AL,DH
        AND AL,0FH
        CMP AL,08H
        JB  SKIP2
        ADD DH,08H
        ADC CL,0
        
 SKIP2: MOV AL,DH
        AND AL,0F0H
        CMP AL,80H
        JB  SKIP3
        ADD DH,80H
        ADC CL,0
        
 SKIP3: MOV [BM3+SI],DX
        MOV [BM4+SI],CL
        
        INC SI
        INC SI
        CMP SI,14H
        JB  LUP
         
          
     MOV AH,4CH
     INT 21h     
MAIN ENDP                 ;program akan menjumlahkan setiap pasangan bilangan oktal
END MAIN                  ;kemudian hasilnya disimpan di BM3 dan BM4