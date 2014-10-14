section .text
	global _start	; start point for linker (using ld)
section .data
	msg		db	'Hello world!' , 10		; string (10 adds newline character)
	len		equ	$ - msg		; length of string in bytes

_start:
	mov rdx, len 	; rdx stores message length
	mov rsi, msg 	; rsi stores message
	mov rdi, 1 		; use stdout
	mov rax, 1 		; system call number (sys_write in this case)
	syscall			; call kernel (would be int 0x80 for x86)

	mov rax, 60		; system call number (sys_exit in this case, no more seg fault!)
	xor rdi, rdi	; 0 out rdi register (return code in this case, don't want to return a 1)
	syscall			; quit call
	