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

iprint:
	push eax
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
	pop eax
	ret

sprint:
	push ecx
	push ebx
	push eax

	mov ecx, eax
	call strlen
	mov eax, 4
	mov ebx, 1
	int 80h

	pop eax
	pop ebx
	pop ecx
	ret

printLF:
	push eax

	mov eax, 0xA
	push eax
	mov eax, esp
	call sprint

	pop eax
	pop eax
	ret
	
exit:
	mov eax, 1
	int 80h
	ret
