model small
STACK 256
DATASEG
 ;stor DB 0Ah DUP(0)	; буфер на 20 символов -14h
 stor DB 43,43,43,45,45,'$' ;+++--
 ctr DB 00,'$' 
 ;arr DB 49,49,49,49,49,'$'
CODESEG
start: 
 mov AX,@data	 
 mov DS,AX
 mov  CX,5 ;256 итераций
 lea dx, ctr  ;Адрес счетчика
 tally1:
  
  mov ah, 02
  mov bl, offset stor
  mov dl,  [stor]
  int 21h
  inc ctr
 
 loop tally1 
   
 ;terminate: 
  mov ah,4ch
  int 21h 
END start
