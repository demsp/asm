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
