;финогенов
text segment
assume cs:text,ds:data
begin: 
 mov ax,data
 mov ds,ax
 ;Подготовим все необходимое
 mov cx,223
 mov si,0
 mov al,32
 ;Теперь собственно цикл
 fill: mov symbols[si], al
       inc al
       inc si
       loop fill
  ;Вывод
       mov ah,40h
       mov bx,1
       mov cx, 223
       mov dx, offset symbols
       int 21h
  ;Конец
       mov ax,4c00h
       int 21h
text ends
data segment
;Поля данных
 symbols db 223 dup ('*')
 data ends
 stk segment stack
     db 256 dup (0)
stk ends
    end begin        
       
