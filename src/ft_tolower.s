global _ft_tolower

_ft_tolower:
	cmp	rdi, 'A'
	jl	nochange
	cmp	rdi, 'Z'
	jg	nochange

	; lowercase char
	add	rdi, 'a'
	sub rdi, 'A'
	mov rax, rdi
	ret

nochange:
	mov rax, rdi
	ret
