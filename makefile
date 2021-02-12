start:
	nasm -f elf src/a.asm
	ld -m elf_i386 src/a.o -o bin/a
