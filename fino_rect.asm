;Финогенов - прямоугольник
text segment
assume cs:text;,ds:data
begin: 
 mov ah,0h
 mov al,10h
 int 10h
 ;Выведем прямоугольник
   mov ah,0ch
   mov al,0eh
   mov bh,0
   mov cx,50
c2: mov dx,10
c1: int 10h
  inc dx
  cmp dx,330
  jne c1
  inc cx
  cmp cx,610
  jne c2 
 ;Остановим для наблюдения
  mov ah,01h
  int 21h
  ;Перейдем назад в текстовый режим
       mov ax,3
       int 10h
   ;Конец
       mov ax,4c00h
       int 10h
text ends
   end begin        
