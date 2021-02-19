%include "lib/functions.asm"

SECTION .data
filename db "file.txt", 0x0
SECTION .text
global _start

_start:
    mov ebx, filename
    mov eax, 10
    int 80h

    call exit