%include "lib/strlen.asm"
%include "lib/sprint.asm"
%include "lib/exit.asm"
%include "lib/iprint.asm"
SECTION .data
cmd 	db 	"/bin/clear", 	0x
arg1 	db 	"-T", 		0x
arg2 	db 	"xterm", 	0x
args 	dd	cmd
	dd	arg1
	dd	arg2,		0x
env 	dd 			0x
	
global _start
_start:
	mov edx, env
	mov ecx, args
	mov ebx, cmd
	mov eax, 11
	int 80h

	call exit
