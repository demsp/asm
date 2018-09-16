
CODESG  SEGMENT PARA 'Code'
   ASSUME  CS:CODESG,DS:CODESG,SS:CODESG,ES:NOTHING
   ORG     100H
BEGIN:  JMP     SHORT MAIN
CTR     DB      00,'$'

;               Основная процедура:
;               ------------------
MAIN    PROC    NEAR
       ; CALL    B10CLR          ;Очистить экран
       ; CALL    C10SET          ;Установить курсор
        CALL    D10DISP         ;Вывести символ на экран
        RET
MAIN    ENDP
;               Очистка экрана:
;               --------------
B10CLR  PROC
        MOV     AX,0600H
        MOV     BH,07
        MOV     CX,0000         ;Левая верхняя позиция
        MOV     DX,184FH        ;Правая нижняя позиция
        INT     10H
        RET
B10CLR  ENDP
;               Установка курсора в 00,00:
;               -------------------------
C10SET  PROC
        MOV     AH,02
        MOV     BH,00
        MOV     DX,0000
        INT     10H
        RET
C10SET  ENDP
;               Вывод на экран ASCII символов:
;               -----------------------------
D10DISP PROC
        MOV     CX,256          ;256 итераций
        LEA     DX,CTR          ;Адрес счетчика
D20:
        MOV     AH,09           ;Функция вывода символа
        INT     21H
        INC     CTR             ;Увеличить счетчик
        LOOP    D20             ;Уменьшить CX,
                                ; цикл, если не ноль
        RET                     ;Вернуться
D10DISP ENDP

CODESG  ENDS
        END     BEGIN
