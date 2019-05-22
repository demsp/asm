INT 16h, АН = 05h — Поместить символ в буфер клавиатуры. Ввод: АН = 05h
СН = скан-код
CL = ASCII-код
Вывод:
AL = 00, если операция выполнена успешно
PDF created with pdfFactory trial version www.pdffactory.comAL = 01h, если буфер клавиатуры переполнен
АН модифицируется многими BIOS
Обычно можно поместить 0 вместо скан-кода в СН, если функция, которая будет
выполнять чтение из буфера, будет использовать именно ASCII-код. Например,
следующая программа при запуске из DOS вызывает команду DIR (но при запуске из
некоторых оболочек, например FAR, этого не произойдет).

; заносит в буфер клавиатуры команду DIR так, чтобы она
; выполнилась сразу после завершения программы
; tasm.exe dirCall.asm
; tlink.exe /t dirCall.obj
 
.model tiny
.code 
org 100h ; СОМ-файл
start:
mov cl,'d' ; CL = ASCII-код буквы "d"
call ungetch
mov cl,'i' ; ASCII-код буквы "i"
call ungetch
mov cl,'r' ; ASCII-код буквы "r"
call ungetch
mov cl,0Dh ; перевод строки
ungetch:
mov ah,5 ; AH = номер функции
mov ch,0 ; CH = 0 (скан-код неважен)
int 16h ; поместить символ в буфер
ret ; завершить программу
end start
