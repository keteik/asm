%include "lib/functions.asm"

SECTION .data
filename db "file.txt", 0x0
msg db "Hell, world", 0xA, 0x0

SECTION .bss
buff resb 255

SECTION .text
global _start

_start:
    mov ebx, filename   ;open for writing
    mov ecx, 1
    mov eax, 5
    int 80h

    mov ebx, eax        ;move file poiter to end
    mov ecx, 0
    mov edx, 2
    mov eax, 19
    int 80h

    mov  ecx, msg       ;write
    mov eax, msg
    call strlen
    mov eax, 4
    int 80h

    mov eax, 6          ;close file
    int 80h

    mov ebx, filename   ;open file for reading
    mov ecx, 0
    mov eax, 5
    int 80h

    mov ebx, eax
    mov ecx, buff
    mov edx, 255
    mov eax, 3
    int 80h

    mov eax, buff
    call sprint

    call exit
