; https://studfiles.net/preview/3730800/page:15/
CSEG segment
 org 100h
 Begin:
 mov ah,9
 ;mov dx,offset Message
 lea dx,[Message] ;Адрес строки Message: DS:DX 
 int 21h
 int 20h
 Message db 'Hi, Hello, world!!$'
 CSEG ends
 end Begin
