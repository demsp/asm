; tasm.com, masm16.com, wasm 
.model tiny
       .code
       ORG    100h
start: MOV    AH,2
       MOV    DL,41h
       INT    21h
      ;terminate program   
       mov ah,4ch
       int 21h 
       END    start
