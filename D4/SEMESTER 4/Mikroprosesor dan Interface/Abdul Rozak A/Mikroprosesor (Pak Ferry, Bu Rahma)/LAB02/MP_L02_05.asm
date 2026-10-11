TITLE L02_03
.MODEL SMALL
.STACK 100H
.DATA 
  DAT  DW 4321H,0276H, 5BC5H,0A35H, 0F14CH,382H, 8975H,0A76H, 9889H,4ABH, 0FF9EH,43FH
       DW 4321H,0177H, 5BD5H,0B35H, 0F14CH,392H, 89C5H,0A76H, 9AA9H,4B3H, 0FF9EH,53FH
       DW 4121H,0376H, 5BC5H,0C35H, 0F14CH,282H, 8A75H,0E76H, 9B89H,0DABH, 0FA9EH,13FH
       DW 4441H,0374H, 5BCAH,0D35H,
       
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
      
      CMP SI,14H     ;dibandingkan dengan 78H karena terdapat 78h alamat
      JNZ LUP1
      
      MOV [SUM],DX
      MOV [SUM+2],CX 
         
     MOV AH,4CH
     INT 21H      
MAIN ENDP
END  MAIN