#include <stdio.h>
void main(void){
int a=1000; //adress
_loop:
asm{
mov ah,09
mov bx, a
lea dx,[bx]
int 21h
}
scanf("%x",&a);
if (a!=5){goto _loop;}
else {goto _exit;}
_exit:
printf("EXIT");
}
