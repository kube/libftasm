global _ft_strcat

_ft_strcat:
	mov rax, rdi

end_s1:
	cmp [rdi], BYTE 0
	jz	copy_s2
	inc rdi
	jmp	end_s1

copy_s2:
	cmp [rsi], BYTE 0
	jz	end_out
	mov cl, [rsi]
	mov	[rdi], cl
	inc rdi
	inc rsi
	jmp	copy_s2

end_out:
	mov [rdi], BYTE 0
	ret