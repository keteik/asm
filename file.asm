%include "functions.asm"

SECTION .data
filename db "file.txt", 0x
msg db "Hello, world!", 0x

SECTION .bss
buffer resb 255,

SECTION .text
global _start

_start:
	mov ecx, 0777
	mov eax, 8
	mov ebx, filename
	int 80h
	
	mov ebx, eax
	mov eax, msg
	call strlen
	mov eax, 4
	mov ecx, msg
	int 80h

	mov ecx, 0
	mov ebx, filename
	mov eax, 5
	int 80h

	mov ebx, eax
	mov eax, msg
	call strlen
	mov edx, 13
	mov ecx, buffer
	mov eax, 3
	int 80h
	
	mov eax, 9
	int 80h

	mov eax, buffer
	call sprint

	call exit
