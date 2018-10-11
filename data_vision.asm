code segment 
assume ss:nothing,cs:code,ds:nothing, es:code
begin: 

 MOV    AH,2
 MOV    DL,DS:[300]
 INT    21h
 MOV    DL,DS:[301]
 INT    21h
 MOV    DL,DS:[302]
 INT    21h
 MOV    DL,DS:[303]
 INT    21h
 MOV    DL,DS:[304]
 INT    21h
 MOV    DL,DS:[305]
 INT    21h
 ;terminate program   
 mov ah,4ch
 int 21h 

 ;begin endp
code ends
 end begin
