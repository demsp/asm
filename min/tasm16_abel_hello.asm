text segment 
 assume cs:text,ds:data
 ;begin: mov ax,1
begin:
mov AX,data	 ;Настроим DS
 mov DS,AX

 mov AH,09h
 mov DX,offset msg
 int 21h ; Завершим программу
 mov AX,4C00h
 int 21h 

 ret
 text ends
  ;;;;;;;;;;;
  data segment
 msg db "Code is run!$"
 data ends
 ;;;;;;;;;;;
 stk segment stack
    db 12 dup ('stacks')
stk ends
    end begin  

	
