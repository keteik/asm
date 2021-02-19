%include "lib/functions.asm"

SECTION .data
filename db "file.txt", 0x0
msg db "Hello, world!!", 0xA, 0x0

SECTION .bss
buffer resb 255
fd resd 1
msg_len resd 1

SECTION .text
global _start

_start:
	mov ebx, filename
	mov ecx, 0o777
	mov eax, 8
	int 80h

	mov [fd], eax
	mov eax, msg
	call strlen
	mov [msg_len], edx


	mov ebx, filename	;open for writing
	mov ecx, 1
	mov eax, 5
	int 80h

	mov ebx, [fd]		;write
	mov ecx, msg
	mov edx, [msg_len]
	mov eax, 4
	int 80h
	
	mov eax, 6		;close
	int 80h

	mov ebx, filename	;open for reading
	mov ecx, 0
	mov eax, 5
	int 80h

	mov ebx, [fd]		;read
	mov ecx, buffer
	mov edx, [msg_len]
	mov eax, 3
	int 80h

	mov eax, buffer		;close
	call sprint
	
	call exit
