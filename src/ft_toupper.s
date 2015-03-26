global _ft_toupper

_ft_toupper:
	cmp	rdi, 'a'
	jl	nochange
	cmp	rdi, 'z'
	jg	nochange

	; uppercase char
	add	rdi, 'A'
	sub rdi, 'a'
	mov rax, rdi
	ret

nochange:
	mov rax, rdi
	ret
