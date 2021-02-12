iprint:
	push ebx
	push ecx
	push edx
	push esi
	mov ecx, 0

.divideLoop:
	inc ecx
	mov edx, 0
	mov esi, 10
	idiv esi
	add edx, 48
	push edx
	cmp eax, 0
	jnz .divideLoop

.printLoop:
	cmp ecx, 0
	je .finished
	mov eax, esp
	call sprint
	pop eax
	dec ecx
	jmp .printLoop

.finished:
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
