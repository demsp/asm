text segment
assume cs:text,ds:data
begin: 
 mov ax,data
 mov ds,ax
 ;Подготовим все необходимое
  mov dl, stor
  mov cx, 0Ah ;кол-во циклов
  mov bx, 0 ;bx-индекс второго эл-та
cont: 
cmp dl, 2Bh
jne next ; нет, увеличиваем элемент массива arr
 inc arr[0]
next: 
cmp dl, 2Dh 
jne next1 ; нет, уменьшаем элемент массива arr
 dec arr[0] 
next1: 
 inc bx
 mov dl,stor[bx]
 loop cont

; output arr
mov ah, 09h
mov DX,offset arr
int 21h 
;terminate
 mov ax,4c00h
 int 21h
text ends
data segment

stor DB  2Bh,2Bh,2Dh,2Dh,'$' ;++++-
arr DB 48,48,48,48,48,'$' ;00000
 data ends
 stk segment stack
     db 256 dup (0)
stk ends
    end begin          
