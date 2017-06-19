#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
void main(void){
int b=0; //adress
_loop:
asm{
mov ax,00bbh
mov b, ax
}
printf(">>> ");
printf("%x ",b);
printf("%c ",b);
printf("%d\n ",b);

}
