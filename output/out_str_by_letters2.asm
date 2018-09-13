;http://www.firststeps.ru/asm/r.php?36

MODEL SMALL
STACK 256
DATASEG
	Data1 DB 48h,45h,4Ch,4Ch,4Fh,'$'
CODESEG
Start:
	mov ax,@data 		; установка в ds адреса
	mov ds,ax 		; сегмента данных
	mov dx,offset Data1  	; указатель на массив символов
	mov ah,09h		; вывести строку
	int 21h

Exit:
	mov ah,04Ch 	; функция DOS выхода из программы
	mov al,0h 	; код возврата
	int 21h 		; Вызов DOS остановка программы

End Start
