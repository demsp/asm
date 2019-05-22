INT 16h, AH = 02h, 12h, 22h — Считать состояние клавиатурыВвод: АН = 02h (83/84-key),
12h (101/102-key), 22h (122-key)
Вывод:
AL = байт состояния клавиатуры 1
АН = байт состояния клавиатуры 2 (только для функций 12h и 22h)
Байт состояния клавиатуры 1 (этот байт всегда расположен в памяти по адресу
0000h:0417h или 0040h:0017h):
Бит 7: Ins включена
Бит 6: CapsLock включена
Бит 5: NumLock включена
Бит 4: ScrollLock включена
Бит 3: Alt нажата (любая Alt для функции 02h, часто только левая Alt для 12h/22h)
PDF created with pdfFactory trial version www.pdffactory.comБит 2: Ctrl нажата (любая Ctrl)
Бит 1: Левая Shift нажата
Бит 0: Правая Shift нажата
Байт состояния клавиатуры 2 (этот байт всегда расположен в памяти по адресу
0000h:0418h или 0040h:0018h):
Бит 7: SysRq нажата
Бит 6: CapsLock нажата
Бит 5: NumLock нажата
Бит 4: ScrollLock нажата
Бит 3: Правая Alt нажата
Бит 2: Правая Ctrl нажата
Бит 1: Левая Alt нажата
Бит 0: Левая Ctrl нажата
Оба этих байта постоянно располагаются в памяти, так что вместо вызова прерывания
часто удобнее просто считывать значения напрямую. Более того, в эти байты можно
записывать новые значения, и BIOS изменит состояние клавиатуры соответственно:
; nolock.asm
; самая короткая программа для выключения NumLock, CapsLock и ScrollLock
; запускать без параметров

.model tiny
.code
org 100h
; СОМ-файл. АХ при запуске СОМ-файла без параметров
; в командой строке всегда равен 0
start:
mov ds,ax ; так что теперь DS = 0
mov byte ptr ds:0417h,al ; байт состояния клавиатуры 1=0
ret ; выход из программы
end start

Разумеется, в реальных программах, которые будет запускать кто-то, кроме автора, так
делать нельзя, и первой командой дожна быть xor ах,ах.