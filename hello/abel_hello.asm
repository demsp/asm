assume ss:stacks,cs:code,ds:nothing
;-----------------------
stacks segment ;para stack 'stack'
	db 12 dup ('stacks')
stacks ends
;-------------------
data segment
msg db "Code is run!$"
data ends
;-------------------
code segment ;para 'code'
begin proc near
; assume ss:stacks,cs:code,ds:nothing
 mov AX,data	 ;Настроим DS
 mov DS,AX

 mov AH,09h
 mov DX,offset msg
 int 21h ; Завершим программу
 mov AX,4C00h
 int 21h 

 ret
begin endp
code ends
 end begin
