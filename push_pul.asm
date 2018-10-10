.model tiny
.code
ORG    100h
start: 

MOV DL,31h
push DX
MOV DL, 32h
push DX
MOV DL, 33h
MOV    AH,2
INT    21h

pop DX
MOV AH,2
INT 21h
pop DX
MOV AH,2
INT 21h
;terminate program   
mov ah,4ch
int 21h 
END    start
