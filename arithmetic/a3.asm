.model small
jumps
.data
 ;str_arr DB 256h DUP('$')	       ;  256 symbols
 res DB 0,'$'
         
.code
ORG    100h
start:

  mov AX, @data          ; set DS                                       
  mov DS,AX
  ;;;
 _prev: 
 mov AH,1     ; DOS get character function
 int 21h      ; get a single-character response
 cmp AL, 1bh  ; символ Escape
 je _next
;;;
 mov BL, AL
 sub BL, 30h
 mov AL, res
 mov CL, 10
 mul CL ; результат в AX
 add AL, BL
 mov res, AL
; output
 mov AH, 2
;;
 mov DL, res
 int 21h
 jmp _prev
_next:
;;;;;;;;;;;;;;;;
 MOV    AH,2         ; new line
 MOV    DL,0Ah       ; mew line
 INT    21h          ; new line
  
 mov AX, 4c00h     ; terminate programm  
 int 21h 
end start
