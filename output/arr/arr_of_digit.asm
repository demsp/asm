;http://www.cyberforum.ru/asm-beginners/thread1356792.html

;внешняя процедура вывода двоичного числа
;которое находится в регистре AX на экран
public disp
.model small
.stack
Dseg segment para public 'data'
tab db 6 dup(?)
mas db 1,2,3,4,5,6,7,8,9,0
n = 10
Dseg ends
Code segment para public 'code'
        assume cs:code,ds:dseg
main:     mov cx,n ;cx=n
    mov ax, Dseg
    mov ds, ax
    mov es, ax
     mov si,0
     mov di,0
vivod:
     xor ax,ax
     mov al,mas[di]
    
     call disp
        
     inc di
     loop vivod
     mov    ax, 4c00h
     int    21h
Disp    proc near
        push ax        
        push bx
        push si
        push cx
        
    push di
Maska equ 00110000B
        mov si,0
        mov bx,10
        mov cx,0
        cmp ax,0
        jge metka
        mov tab[si],'-'
        inc si
        neg ax
metka:  cwd
        div bx
        or dl,maska
        mov tab[si],dl
        inc cx
        inc si
        cmp ax,0
        jne metka
        dec si
        pop ax
        cmp ax,0
        jge metka1
        mov dl,tab
        mov ax,200h
        int 21h
metka1: mov dl,tab[si]
        mov ax,200h
        int 21h
        dec si
        loop metka1
;    pop di
        pop cx
        pop si
        pop bx
        pop ax
        ret
disp endp
Code ends
end main
