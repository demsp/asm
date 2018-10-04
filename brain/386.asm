model tiny
;.startup ;для MASM
.386
ORG    100h
.stack 100                                            
.data
str_arr DB 100h DUP('$')	; буфер на 256 символов
 data_arr DB 0,0,0,0,0,0,0,0,0,0,'$'  ; данные
 i DB 0,'$'                              ;индекс элемента массива команд 
 j DB 0,'$'                            ;индекс элемента массива данных
 i_stor DB 0,'$'                        
.code
start: 
mov AX, @data        ; настраиваем сегмент данных                                       
  mov DS,AX
  ;;;
  mov ah, 3fh        ; функци¤ ввода
  mov cx, 100h	     ; 256 символов
  mov dx,OFFSET str_arr
  int 21h
  ;;;             
  ;mov DL, str_arr    ; загружаем в DL 1ую команду 
  ;mov CX, 900h        ; 2304 тактов
prev: 
 mov DL, str_arr
 cmp DL, 24h  ; символ $
 je exit_cycle
                   
 cmp DL, 2Bh         ; ¤чейка содержит +
 jne next            ; нет, переходим на метку next  
 mov BL, j           ; загружаем в BL индекс данных
 inc data_arr[BX]    ; да, увеличиваем  значение в ¤чейке на 1
next: 
 cmp DL, 2Dh         ; ¤чейка содержит -
 jne next1           ; нет, переходим на метку next1  
 mov BL, j 
 dec data_arr[BX]    ;BX, но не Bl 
next1: 
 cmp DL, 3Eh         ; ¤чейка содержит >
 jne next2           ; нет, переходим на метку next2  
 inc j               ; да, переходим на следующий элемент массива data_arr
next2: 
 cmp DL, 3Ch         ; ¤чейка содержит <
 jne next3           ; нет, переходим на метку next3  
 dec j               ; да, переходим на предыдущий элемент массива data_arr
next3: 
 cmp DL, 2Eh         ; ¤чейка содержит .
 jne next4           ; нет, переходим на метку next4  
 mov AH,2            ; да, выводим содержимое ¤чейки
 mov BL, j
 mov DL, data_arr[BX]
 int 21h
next4:
 cmp DL, 5Bh         ; ¤чейка содержит [
 jne next5           ; нет, переходим на метку next5
 mov BL, j
 mov DL, data_arr[BX]
 cmp DL, 00          ; да, провер¤ем текущий элемент data_arr на ноль  
 jz next5            ; если ноль, прыгаем дальше
 mov DL, i           ; иначе загружаем 
 mov i_stor, Dl      ; в i_stor значение переменной i
next5:
 cmp DL, 5Dh         ; ¤чейка содержит ]
 jne next6           ; нет, переходим на метку next6
 mov BL, j
 mov DL, data_arr[BX]
 cmp DL, 00          ; да, провер¤ем текущий элемент data_arr на ноль  
 jz next5            ; если ноль, прыгаем дальше
 mov DL, i_stor      ; иначе загружаем 
 mov i, Dl           ; в i_stor значение переменной i 
next6:
 inc i               ; переходим к следующей команде
 mov BL, i
 mov DL, str_arr[BX]   
 ;loop prev          ; прыгаем на метку prev:
 jmp prev
 exit_cycle: 
 MOV    AH,2       ; переходим на новую строку
 MOV    DL,0Ah     
 INT    21h        
 mov AX, 4c00h      ; завершение программы  
 int 21h 
 END    start  
