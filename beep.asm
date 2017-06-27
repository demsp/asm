;.com
CSEG SEGMENT
assume cs:cseg,ds:cseg
org 100h
start:  
    mov bx,0
mov ax, 0E07h
int 10h
    ret
CSEG ENDS
end start
