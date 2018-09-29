model small
STACK 256
DATASEG
 strng DB 14h DUP(0)	; буфер на 20 символов
 ;arr DB 1,2,3,4,5,'$'
 arr DB 49,50,51,52,53,'$'
CODESEG
start: 
  mov ah, 3fh    ; Функция ввода
  mov cx,14h	
  mov dx,OFFSET strng
  int 21h
  ;sub ax,ax
  mov ah,2
  mov dl, strng
  int 21h
 
 ;output arr
 mov AX,@data	 
 mov DS,AX
 mov AH,09h
 mov DX,offset arr
 int 21h  
 ;terminate program   
 mov ah,4ch
 int 21h 
END start
