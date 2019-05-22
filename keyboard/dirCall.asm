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
