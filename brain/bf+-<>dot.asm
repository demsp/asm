text segment
assume cs:text,ds:data
begin: 
 mov ax,data
 mov ds,ax
 ;Подготовим все необходимое
  mov dl, stor
  mov CX, 28h       ; кол-во циклов
 
cont:               ; начало цикла loop  
 cmp dl, 2Bh        ; ячейка содержит +
 jne next           ; нет, переходим на метку next  
 mov BL, indx_arr
 inc arr[BX]        ;BX, но не Bl
next: 
 cmp DL, 2Dh        ; ячейка содержит -
 jne next1          ; нет, переходим на метку next1  
 mov BL, indx_arr 
 dec arr[BX]        ;BX, но не Bl 
next1: 
 cmp DL, 3Eh        ; ячейка содержит >
 jne next2          ; нет, переходим на метку next2  
 inc indx_arr       ; да, переходим на сдедующий элемент массива arr
next2: 
 cmp DL, 3Ch        ; ячейка содержит <
 jne next3          ; нет, переходим на метку next3  
 dec indx_arr       ; да, переходим на предыдущий элемент массива arr
next3: 
 cmp DL, 2Eh        ; ячейка содержит .
 jne next4          ; нет, переходим на метку next4  
 mov AH,2           ; да, выводим содержимое ячейки
 mov BL, indx_arr
 mov DL, arr[BX]
 int 21h
next4:
 inc indx_stor      ; переходим на следующий символ строки stor
 mov BL, indx_stor
 mov DL, stor[BX]   ;BX, но не Bl
 
 loop cont          ; пока в CX не ноль, переходим на метку cont
 
 MOV    AH,2        ; переходим на новую строку
 MOV    DL,0Ah      ; на некоторых платформах "MOV DL,0Dh"
 INT    21h

 mov AH, 09h        ; вывод массива arr
 mov DX,offset arr
 int 21h 
;MOV    AH,2       ; переходим на новую строку
;MOV    DL,0Ah     ; на некоторых платформах "MOV DL,0Dh"
;INT    21h

;Вывод 
;mov ah, 40h
;mov bx, 01
;mov cx, 100 ;20
;lea dx, arr ;stor
;int 21h
 

 mov AX, 4c00h     ; завершение программы  
 int 21h
text ends

data segment
 stor DB 2Bh,2Bh,2Bh, 2Eh,'$'
 arr DB 0,0,0,0,0,'$' 
 indx_stor db 0,'$' 
 indx_arr db 0,'$'
  
data ends

stk segment stack
 db 256 dup (0)
stk ends
end begin
