;http://www.firststeps.ru/asm/tasm1.html
;mov ah, 40h

MODEL	TINY
STACK 256	
DATASEG
	Hellostr DB 'Hello with 40h '
CODESEG		
start:	
	mov ax,@data		
	mov ds,ax		
	mov bx,1
	mov cx,21
	mov dx,offset Hellostr 
	mov ah,40h
	int 21h
	mov ah, 04Ch		
	int 21h
end start	
