%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

section .data

carret: db 10,0

section .text

global _ft_puts

_ft_puts:
	; store the argument length in RCX
	mov rcx, 0
length:
	cmp	[rdi + rcx], BYTE 0
	jz	output
	inc	rcx
	jmp	length

output:
	mov	rax, MACH_SYSCALL(WRITE)
	mov rsi, rdi
	mov rdi, STDOUT
	mov rdx, rcx
	syscall

	mov	rax, MACH_SYSCALL(WRITE)
	lea rsi, [rel carret]
	mov rdi, STDOUT
	mov rdx, 1
	syscall

	ret
