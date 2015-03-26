global _ft_isalnum

extern _ft_isalpha
extern _ft_isdigit

_ft_isalnum:
	; isdigit?
	call	_ft_isdigit
	cmp		rax, 1
	jz		end

	; isalpha?
	call	_ft_isalpha

end:
	ret

	