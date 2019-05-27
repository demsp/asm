; .com program
CSEG segment
 org 100h
 Begin:
 mov ah,02
 mov dl,42 ; output *
 int 21h
  int 20h 
 CSEG ends
 end Begin
