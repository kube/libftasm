%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

section .data
nulltxt: db "(null)", 10
.len: equ $ - nulltxt

section .text
global _ft_puts

_ft_puts:
	; check if rdi is NULL
	cmp	rdi, 0
	jz	null

	; store the argument length in RCX
	xor rcx, rcx
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
	lea rsi, [rel nulltxt + 6]
	mov rdi, STDOUT
	mov rdx, 1
	syscall
	jnc	no_error

	; return EOF when error
	mov rax, -1

	ret

null:
	mov	rax, MACH_SYSCALL(WRITE)
	lea rsi, [rel nulltxt]
	mov rdi, STDOUT
	mov rdx, nulltxt.len
	syscall
	jnc	no_error

	; return EOF when error
	mov rax, -1

no_error:
	ret
