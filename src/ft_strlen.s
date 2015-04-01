global _ft_strlen

_ft_strlen:
    mov al, 0
    mov rcx, 0
    not rcx
    cld
repne scasb
    not rcx
    dec rcx
    mov rax, rcx

    ret
