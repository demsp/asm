CSEG segment
 org 100h
 Start:
 mov ah,9
 mov dx,offset String
 int 21h
; ожидание нажатия клавиши
 mov ah,10h
 int 16h
 int 20h
 String db 'Нажмите любую клавишу...$'
 CSEG ends
 end Start
