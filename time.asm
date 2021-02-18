SECTION .data
msg db "Seconds elapsed since 1 january 1970:", 0x, 0xA

SECTION .text
global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, 39
	int 80h

	mov eax, 1
	int 80h

