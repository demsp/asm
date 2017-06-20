ds1 segment para 'data'
     ff1 dw 3 
 ds1 ends
 cs1 segment para 'code'
  assume ss:nothing,cs:cs1,ds:ds1,es: cs1
   ;org 100h
  begin   proc near
  ;mov ax, ds ; ax = adress ds 
mov al, ds:[256]

add al,2h
mov bl, 1
   ret
   begin endp
   cs1 ends
   end begin
   
