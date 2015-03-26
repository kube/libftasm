global _ft_isdigit
global _ft_isnumber

_ft_isdigit:
_ft_isnumber:
	cmp	rdi, '0'
	jl	false
	cmp	rdi, '9'
	jg	false
	mov	rax, 1
	ret

false:
	xor rax, rax
	ret
