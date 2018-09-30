text segment
assume cs:text,ds:data
begin: 
 mov ax,data
 mov ds,ax
 ;Подготовим все необходимое
  mov dl, stor
  mov CX, 0Ah        ; кол-во циклов
 ;mov BX, 0          ; bx - индекс элемента массива stor 
 ; mov indx_stor, 0  ; indx - индекс элемента массива stor 
cont:                ; начало цикла loop  
cmp dl, 2Bh          ; ячейка содержит +
jne next             ; нет, переходим на метку next  
mov bx, indx_arr     ; да, увеличиваем элемент массива arr
 inc arr[bx]
next: 
cmp dl, 2Dh           ; ячейка содержит -
jne next1             ; нет, переходим на метку next1  
mov bx, indx_arr      ; да, уменьшаем элемент массива arr
 dec arr[bx]
;;;
next1: 
cmp dl, 3Eh ; if >    ; ячейка содержит >
jne next2             ; нет, переходим на метку next2  
inc indx_arr          ; да, переходим на сдедующий элемент массива arr
;;; 
next2: 
cmp dl, 3Ch ; if <    ; ячейка содержит <
jne next3             ; нет, переходим на метку next3  
dec indx_arr          ; да, переходим на предыдущий элемент массива arr
;;;
next3: 
inc indx_stor         ; переходим на следующий символ строки stor
mov BX, indx_stor
mov DL,stor[bx]
 
 loop cont            ; пока в CX не ноль, переходим на метку cont
; output arr  
mov AH, 09h
mov DX,offset arr
int 21h 

;terminate            ; завершение программы
mov AX, 4c00h
int 21h
text ends
data segment

stor DB  3Eh, 2Bh, 2Bh, 3Ch , 2Dh ,'$' ;++++-
arr DB 48,48,48,48,48,'$' ;00000
indx_stor dw 0,'$' 
indx_arr dw 0,'$'
 data ends
 stk segment stack
     db 256 dup (0)
stk ends
    end begin       
