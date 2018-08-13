text segment 
 assume cs:text,ds:data
 begin: mov ax,1
        
 text ends
 data segment
 ;
 data ends
 stk segment stack
    ;
stk ends
    end begin     
