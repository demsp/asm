codesg segment para 'code'
begin proc far
 ;assume cs:codesg,ds:nothing
 assume cs:codesg
  
  ;mov ax, cs
 mov ax, 0x0001
 nop 
 ret
begin endp
codesg ends
 end begin
