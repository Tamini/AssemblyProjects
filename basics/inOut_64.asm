section .text
        global _start

section .bss            ; .bss section does NOT play nicely with code
        num1    resb    10

section .data           ; .data section is good
        prompt  db      "Enter a number!" , 10
        plen    equ     $ - prompt
        fin     db      "Your number was: "
        finlen  equ     $ - fin
        inlen   db      10

_start:
        mov rdx, plen
        mov rsi, prompt
        mov rdi, 1
        mov rax, 1
        syscall         ; print prompt

        mov rax, 0      ; read syscall
        mov rdi, 0      ; stdin
        mov rsi, num1   ; where to put input (i think)
        mov rdx, inlen  ; input length in bytes
        syscall

        mov rax, 1
        mov rdi, 1
        mov rsi, fin
        mov rdx, finlen
        syscall         ; print out finish message

        mov rax, 1
        mov rdi, 1      ; these got reset in last syscall
        mov rsi, num1
        mov rdx, inlen
        syscall         ; print out given number

        mov rax, 60
        xor rdi, rdi
        syscall         ; sys_exit
