%include "src/lib/exit.asm"
SECTION .data
cmd     db      "/bin/clear",   0x
arg1    dd      "-T",           0x
arg2    dd      "xterm",        0x
args    dd      cmd
        dd      arg1
        dd      arg2
        dd      0x
env     dd      0x

global _start
_start:
        mov edx, env
        mov ecx, args
        mov ebx, cmd
        mov eax, 11
        int 80h

        call exit
