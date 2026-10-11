TITLE L02_03
.MODEL SMALL
.STACK 100H
.DATA 
  DAT  DW 4321H,076H, 5BC5H,35H, 0F14CH,82H, 8975H,76H, 9889H,4BH, 0FF9EH,4FH
       DW 4321H,077H, 5BD5H,35H, 0F14CH,92H, 89C5H,76H, 9AA9H,43H, 0FF9EH,5FH
       DW 4121H,076H, 5BC5H,35H, 0F14CH,82H, 8A75H,76H, 9B89H,0ABH, 0FA9EH,1FH
       DW 4441H,074H, 5BCAH,35H, 0F14EH,82H, 8975H,0E6H, 98E9H,45H, 0DF9EH,4FH 
       DW 4C21H,0F6H, 5BF5H,35H, 0C14CH,82H, 8975H,76H, 1289H,0EBH, 0FD9EH,2FH
       DW 4CB1H,0F6H, 5BF5H,35H, 0C44CH,82H, 8875H,76H, 1A89H,0EBH, 0DD9EH,2FH
       DW 4C21H,0F6H, 5BF5H,55H, 0C14CH,42H, 89F5H,76H, 12F9H,0FBH, 0FD9EH,3FH
       DW 5421H,0F6H, 4BF5H,35H, 0C14CH,82H, 8975H,76H, 1219H,0ABH, 0FD9EH,2FH
       DW 4CCCH,0C6H, 5BF5H,56H
  SUM  DW 0
  
.CODE 
MAIN PROC         
     MOV AX, @DATA
     MOV DS, AX
     
     MOV CX,0         ;inisialisasi CX diisi dengan 0
     MOV DX,0         ;inisialisasi DX diisi dengan 0
     MOV SI,0         ;inisiasisasi SI diisi dengan 0
     
LUP1: ADD DX,[DAT+SI] ;register DX ditambahkan dengan isi DAT index SI
      INC SI          ;nilai SI ditambah 1
      INC SI          ;nilai SI ditambah 1
      ADC CX,[DAT+SI] ;register CX ditambahkan dengan isi DAT index SI dan carry flag
      INC SI          ;nilai SI ditambah 1
      INC SI          ;nilai SI ditambah 1
      CMP SI,96H
      JNZ LUP1
      
      MOV [SUM],DX
      MOV [SUM+2],CX 
         
     MOV AH,4CH
     INT 21H      
MAIN ENDP
END  MAIN