global _ft_memcpy

_ft_memcpy:
	push rdi
	mov rcx, rdx

	cld
rep movsb

	pop rax
	ret
