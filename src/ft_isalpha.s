global _ft_isalpha

_ft_isalpha:
	; isupper?
	cmp	rdi, 'A'
	jl	false
	cmp	rdi, 'Z'
	jle	true

	; islower?
	cmp	rdi, 'a'
	jl	false
	cmp	rdi, 'z'
	jle	true

false:
	mov rax, 0
	ret

true:
	mov rax, 1
	ret
