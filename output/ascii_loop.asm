model small
STACK 256
DATASEG
 CTR     DB 00,'$'
CODESEG
start: 
 MOV CX,256 ;256 итераций
 ;LEA DX,CTR  ;Адрес счетчика
D20:
 MOV AH,02 ;Функция вывода символа
 mov dl, CTR
 INT 21H
 INC CTR ;Увеличить счетчик
 LOOP D20 ;Уменьшить CX,
 ;цикл, если не ноль
    
 ;terminate: 
  mov ah,4ch
  int 21h 
END start
