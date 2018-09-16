text segment
assume cs:text,ds:data
begin: 
 mov ax,data
 mov ds,ax
 ;Подготовим все необходимое
  mov dl, stor
  mov cx,5 ;кол-во циклов
  mov bx, 0 ;bx-индекс второго эл-та
cont: 
cmp dl, 2Bh
jne next ; нет, выводим +
 mov ah,2
 mov dl, 2Bh
 int 21h
next: inc bx
mov dl,stor[bx]
loop cont

;terminate
 mov ax,4c00h
 int 21h
text ends
data segment

stor db 2Bh,2Bh,2Bh,2Bh,2Dh,'$'
 data ends
 stk segment stack
     db 256 dup (0)
stk ends
    end begin          
