%include "lib/sprint.asm"
%include "lib/exit.asm"
%include "lib/strlen.asm"

SECTION .data
parrent db "I'm parrent", 0x
child db "I'm child", 0x
SECTION .text
global _start

_start:
	mov eax, 2
	int 80h

	cmp eax, 0
	jz .child

.parrent:
	mov eax, parrent
	call sprint
	call printLF

	call exit

.child:
	mov eax, child
	call sprint
	call printLF

	call exit
