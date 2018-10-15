.model small
jumps
.data
 str_arr DB 256h DUP('$')	       ;  256 symbols
; i DB 0,'$'                            ; index of string element 
; j DB 0,'$'                            ; index of data element
; i_stor DB 0,'$'

.code
ORG    100h
start:

  mov AX, @data          ; set DS                                       
  mov DS,AX
  ;;;
  mov ah, 3fh          ; input function of 21h
  mov cx, 100h	        ; 256 symbols
  mov dx,OFFSET str_arr
  int 21h
  ;;;             
  mov DL, str_arr      ; load 1st command to DL 
prev:
 cmp DL, 24h           ; symbol '$'
 je  exit_loop
 
 inc i               ; increment index of str_arr
 mov BL, i
 mov DL, str_arr[BX] ; go to next bf-command  
; loop prev          ; jump to prev:
 jmp prev
 exit_loop: 
 ;;;;;;;;;;;;;;;;
 MOV    AH,2         ; new line
 MOV    DL,0Ah       ; mew line
 INT    21h          ; new line

 mov AH,2            ; if yes, output cell
 mov DL, str_arr
 sub  DL, 30h 
 int 21h
 ;
 mov DL, str_arr+1
 sub  DL, 30h
 int 21h 
;;;;;;;;;;
 MOV    AH,2       ; new line
 MOV    DL,0Ah     ; new line
 INT    21h        ; new line 
  
 mov AX, 4c00h     ; terminate programm  
 int 21h 
end start
