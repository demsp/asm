text segment
assume cs:text,ds:data
begin: 
 mov ax,data
 mov ds,ax
 ;Подготовим все необходимое
  mov dl, mas
  
  mov bx, 0 
  mov dl,mas[bx];в dl первый элемент
;выводим содержимое dl на экран
 mov ah, 2
 int 21h
;выводим 2-ой элемент 
mov bx, 1 
mov dl,mas[bx];в dl второй элемент
;выводим содержимое dl на экран
 mov ah, 2
 int 21h
;Конец
   mov ax,4c00h
   int 21h
text ends

data segment
;Поля данных
mas db 65,66,67,68,69;
 data ends
stk segment stack
     db 256 dup (0)
stk ends
    end begin      
