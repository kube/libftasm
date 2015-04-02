extern _ft_strlen
extern _ft_memcpy
extern _malloc

global _ft_strdup

_ft_strdup:
	push rdi

	call _ft_strlen
	push rax

	mov rdi, rax
	call _malloc

	mov rdi, rax
	pop rdx
	pop rsi
	call _ft_memcpy

	ret
