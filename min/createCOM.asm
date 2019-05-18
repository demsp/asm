; http://www.cyberforum.ru/asm-beginners/thread1670434.html
; tasm.exe createCOM.asm
; tlink.exe /t createCOM.obj

; Programm Hello3 
.MODEL TINY
.CODE
org 100h
begin: jmp start
Hello DB 'Hello!$'
start: LEA DX,Hello
MOV AH,09h
INT 21h
MOV AH,4Ch
MOV AL,00h
INT 21h
END begin
