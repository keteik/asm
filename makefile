start:
	nasm -f elf src/execve_clear.asm
	ld -m elf_i386 src/execve_clear.o -o bin/execve_clear
