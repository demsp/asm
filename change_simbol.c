#include <stdio.h>
void main(){
char a='z';
 int b;
__asm
{
lea eax,a
mov ebx,[eax]

cmp bl,61h
jb b30
cmp bl,7Ah
ja b30
sub bl,20h
b30:
mov b, ebx
}
printf("%c ",b);
getchar();
}
