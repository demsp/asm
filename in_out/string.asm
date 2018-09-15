;http://www.cyberforum.ru/asm-beginners/thread380071.html

data segment
     string db 100,100 dup ('$')
data ends
 
code segment
assume cs:code,ds:data
start:
    mov ax, data
    mov ds, ax
    
    mov ah,0ah
    lea dx,string
    int 21h 
    
    mov string+1,0ah
    
    mov ah,9
    lea dx,string+1
    int 21h
    
    mov ah, 10h
    int 16h
 
    mov ax, 4c00h
    int 21h
code ends
end start
