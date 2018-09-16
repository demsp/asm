model small
STACK 256
DATASEG
 stor DB 43,43,43,45,45,'$' ;+++--
CODESEG
start: 
  mov AX,@data	 
  mov DS,AX
  mov cx, 5
  mov bx, 0
 tally1:
  mov ah,2
  mov dl, stor[bx]
  int 21h
  inc bx
loop tally1 
   
 ;terminate: 
  mov ah,4ch
  int 21h 
END start
