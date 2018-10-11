.model tiny
.code
ORG    100h
start: 
mov ax,20h    ; делимое
mov bl, 10   ; делитель
div bl       ; теперь AL=3, AH=2 
add AL, 30h
MOV DL, AL
MOV    AH,2
INT    21h
;;;
mov ax,20h    ; делимое
mov bl, 10   ; делитель
div bl       ; теперь AL=3, AH=2
add AH, 30h 
MOV DL, AH
MOV    AH,2
INT    21h

;terminate program   
mov ah,4ch
int 21h 
end start
