text segment
assume cs:text,ds:data
begin: 

;mov ax, 11h  
;AAA
;mov dl, al
;add dl, 30h
;sub ax,ax
;mov ah, 02
;int 21h

    mov al,11h
    xor ah,ah
    ror ax,4
    shr ah,4
    or ax,3030h
    int 29h
    mov al,ah
    int 29h 

 mov AX, 4c00h         ; завершение программы  
 int 21h
text ends

data segment
data ends

stk segment stack
 db 256 dup (0)
stk ends
end begin       
