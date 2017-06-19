cs1 segment para 'code'
  assume ss:nothing,cs:cs1,ds:nothing,es: cs1
   ;org 100h
   begin: jmp main
   flda dw 2
   fldb dw 3
   fldc dw ?
   main proc near
   mov ax, flda
   mov bx, fldb
   ;mov ax,es:[0003]
   ;mov ax,es:[0005]
   mov fldc,ax
   ret
   main endp
   cs1 ends
   end begin
