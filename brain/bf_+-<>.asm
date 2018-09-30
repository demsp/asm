text segment
assume cs:text,ds:data
begin: 
 mov ax,data
 mov ds,ax
 ;Подготовим все необходимое
  mov dl, stor
  mov cx, 0Ah        ;кол-во циклов
 ;mov bx, 0          ;bx - индекс элемента массива stor 
 ; mov indx_stor, 0   ;indx - индекс элемента массива stor 
cont: 
cmp dl, 2Bh  ; if +
jne next             ; нет, увеличиваем элемент массива arr
mov bx, indx_arr
 inc arr[bx]
next: 
cmp dl, 2Dh ; if -
jne next1             ; нет, уменьшаем элемент массива arr
mov bx, indx_arr
 dec arr[bx]
;;;
next1: 
cmp dl, 3Eh ; if >
jne next2             ; нет, уменьшаем элемент массива arr

;mov bx, indx_arr
; dec arr[bx]
inc indx_arr
;;;; 
next2: 
 
 inc indx_stor
 mov bx, indx_stor
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

stor DB  3Eh,2Bh,2Bh,2Bh,2Bh,2Dh,'$' ;>++++-
arr DB 48,48,48,48,48,'$' ;00000
indx_stor dw 0,'$'
indx_arr dw 0,'$'
 data ends
 stk segment stack
     db 256 dup (0)
stk ends
    end begin      
