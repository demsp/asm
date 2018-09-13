assume cs:code,ds:data

data segment
msg_1 db 128 dup ('*')
x_temp db 0
data ends

code segment
start:
;функция 3fh возвращает в ax число реально считанных байт. 
;Сохраняйте его в переменных и используйте при чтении с помощью функции 40h.
mov ah, 3fh    ; Функция ввода
mov bx, 0       ; Дескриптор клавиатуры (можно еще с RS232C или файла)
mov cx, 128    ; Число вводимых символов. Ограничте объемом зарезервированной области памяти

mov dx, offset msg_1
int 21h
;Ставим ограничитель
;mov bh, 00
 mov bx, ax
 mov msg_1[bx], 07
 mov msg_1[bx+1],'$'

; Output
 mov AH,09h
 int 21h 
;Exit
 mov AX,4C00h
 int 21h 
ret

code ends
end start
