;вывод одной цифры    
assume cs:text,ds:data

text segment 
begin:
			
mov ax,3 ;digit=3
		
add ax,3030h
mov dl,ah
mov dh,al
mov ah,02
int 21h
mov dl,dh
int 21h

mov ah,4ch ;DOS terminate program function
int 21h ;terminate the program	


 ret
 text ends
  ;;;;;;;;;;;
  data segment
 data ends
 ;;;;;;;;;;;
 stk segment stack
stk ends
    end begin  
