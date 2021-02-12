strlen:
	push ebx
	mov ebx, eax
.nextChar:
	cmp byte [eax], 0
	jz .finished
	inc eax
	jmp .nextChar

.finished:
	sub eax, ebx
	mov edx, eax
	pop ebx
	ret  
