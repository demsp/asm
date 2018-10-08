;вывод по условию
; http://mykonspekts.ru/2-133377.html
assume cs:text,ds:data
text segment 

begin:
	mov AX,data	 ;Настроим DS
	mov DS,AX
	mov dx,OFFSET arr; Question
	mov AH,09h
	int 21h
	

	mov ah,01h ;DOS получить символ
	int 21h ; вызвать прерывание
	cmp al,'y' ; сравнить регистр с 'y'

	jnz IsMorning ;no, it's before noon
	
	mov dx,OFFSET GoodAfternoonMessage ;point to the afternoon greeting
	jmp DisplayGreeting
	IsMorning:
	mov dx,OFFSET GoodMorningMessage ;point to the before noon greeting

DisplayGreeting:
	mov ah,9 ;DOS print string function
	int 21h ;display the appropriate greeting
	mov ah,4ch ;DOS terminate program function
	int 21h ;terminate the program	

ret
text ends
