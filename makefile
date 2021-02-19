FOO = ""

rule:
	nasm -f elf $(FOO).asm
	ld -m elf_i386 $(FOO).o -o $(FOO)

clean:
	rm $(FOO) 
	rm $(FOO).o
	