global _ft_bzero

_ft_bzero:
	xor rcx, rcx
toto:
	cmp rcx, rsi
	jz	end
	mov [rdi + rcx], BYTE 0
	inc rcx
	jmp	toto
end:
	ret