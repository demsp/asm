; http://www.firststeps.ru/asm/r.php?39

MODEL SMALL
STACK 256
DATASEG
	Data1 DB 3h, '$'
CODESEG
Start:
	mov ax,@data 		; установка в ds адpеса
	mov ds,ax 		; сегмента данных
	mov dx,offset Data1  	; указатель на массив символов             
        mov Data1[0],1		; поместить элемент в массив
	mov dx,offset Data1               
	mov ah,09h
	int 21h
              
Exit:
	mov ah,04Ch 	; функция DOS выхода из программы
	mov al,0h 	; код возврата
	int 21h 		; Вызов DOS остановка программы

End Start
