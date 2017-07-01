;финогенов стр.48
;tasm16.exe
text segment
assume cs:text,ds:data
begin: 
 mov ax,data
 mov ds,ax
 ;Подготовим все необходимое
  mov dl, mas
  mov cx,8 ;кол-во циклов
  mov bx, 1 ;bx-индекс второго эл-та
cont: cmp dl, mas[bx]
 jg next ; да, на анализ следующего
 mov dl,mas[bx];нет,заносим в dl сл.элемент
next: inc bx
      loop cont
;после завершения цикла в dl получаем максимум 
  ;Конец
       mov ax,4c00h
       int 21h
text ends
data segment
;Поля данных
mas db 1,2,5,30,127,9,8,3,4
 data ends
 stk segment stack
     db 256 dup (0)
stk ends
    end begin          
