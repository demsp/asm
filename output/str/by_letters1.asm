; 
MODEL SMALL
STACK 256
DATASEG
	Data1 DB 48h	; выделить один байт с содержимым 48h
	Data2 DB 45h	; выделить один байт с содержимым 45h
	Data3 DB 4Ch	; выделить один байт с содержимым 76h
	Data4 DB 4Fh	; выделить один байт с содержимым 48h
CODESEG
Start:
	mov ax,@data 		; установка в ds адpеса
	mov ds,ax 		; сегмента данных
	mov dl,Data1		; содержимое в регистр DX (DL)
	Call Write
	mov dl,Data2		; содержимое в регистр DX (DL)
	Call Write
	mov dl,Data3		; содержимое в регистр DX (DL)
	Call Write
	mov dl,Data3		; содержимое в регистр DX (DL)
	Call Write
	mov dl,Data4		; содержимое в регистр DX (DL)
	Call Write
Exit:
	mov ah,04Ch 	; функция DOS выхода из пpогpаммы
	mov al,0h 	; код возвpата
	int 21h 	; Вызов DOS остановка пpогpаммы

Write   PROC   
     	mov ah,02h
        int 21h
        ret
Write   ENDP

End Start

