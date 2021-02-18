%include "functions.asm"

SECTION .data
filename db "file.txt", 0x
msg db "hell, wolrld", 0x

SECTION .text
global _start

_start:
	mov ecx, 1
	mov ebx, filename
	mov eax, 5
	int 80h

	call iprint
	call printLF
	mov edx, 2
	mov ecx, 0
	mov ebx, eax
	mov eax, 19
	int 80h

	call iprint
	call printLF
	;mov ebx, eax
	;mov eax, msg
	;call strlen
	;mov ecx, msg
	;mov eax, 4
	mov edx, 12
	mov ecx, msg
	mov eax, 4
	int 80h

	call iprint
	call printLF

	call exit
