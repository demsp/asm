; tasm.com, masm16.com, wasm 
.model tiny
       .code
       ORG    100h
start: MOV    AH,2
       MOV    DL,41h
       INT    21h
       ;terminate program
       INT    20h
       END    start
