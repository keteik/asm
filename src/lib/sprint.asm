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
	
