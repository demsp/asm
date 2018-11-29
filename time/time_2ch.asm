; load current time in dx:cx
text segment 
 assume cs:text,ds:data
 begin: 

mov ah,2cH
int 21h
 
mov ah,40h
int 21h
mov ah, 04Ch		
int 21h
        
 text ends
 data segment
 ;
 data ends
 stk segment stack
    ;
stk ends
    end begin
