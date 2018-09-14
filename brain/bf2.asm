model small
STACK 256
DATASEG
 strng DB 14h DUP(0)	; буфер на 20 символов
 ;arr DB 1,1,1,1,1,'$'
 arr DB 49,49,49,49,49,'$'
CODESEG
start: 
  mov ah, 3fh    ; Функция ввода
  mov cx,14h	
  mov dx,OFFSET strng
  int 21h
  ;print 1st
  mov ah,2
  mov dl, strng
  int 21h
 ;;;;;;;;;;
 cmp strng, 7Ah
 je  metka
  mov AX,@data	 
  mov DS,AX
  mov AH,09h
  mov DX,offset arr
  int 21h
  jmp terminate
 metka: 
 mov AX,@data	 
  mov DS,AX
  mov AH,09h
  mov DX,offset arr
  inc arr[0]
  int 21h
 terminate: 
  mov ah,4ch
  int 21h 
END start
