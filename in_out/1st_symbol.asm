model small
STACK 256
DATASEG
 buffer   DB 14h	DUP(0)	; буфер на 20 символов
CODESEG
start: 
  mov ah, 3fh    ; Функция ввода
  mov cx,14h	
  mov dx,OFFSET buffer
  int 21h
  sub ax,ax
  mov ah,2
  mov dl, buffer
  int 21h
    
 ;terminate program   
 mov ah,4ch
 int 21h 
END start
