;mov ah,09h
MODEL	TINY
STACK 100h	
DATASEG
	Hellostr DB 'Hello First Step Site $'
	str2     DB 'Step 16 $'
CODESEG		
start:	
	mov ax,@data
	mov ds,ax
	mov dx,offset Hellostr               
	mov ah,09h
	int 21h
	mov dx,offset  str2
	mov ah,09h
	int 21h
	mov ah,04Ch
	mov al,1h
	int 21h
end start	

;mov ah, 40h
MODEL	TINY
STACK 256	
DATASEG
	Hellostr DB 'Hello First Step Site '
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
