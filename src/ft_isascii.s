global _ft_isascii

_ft_isascii:
	cmp rdi, 128
	ja	false
	mov rax, 1
	ret

false:
	xor rax, rax
	ret
