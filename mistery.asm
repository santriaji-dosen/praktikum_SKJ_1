section .bss
    num resb 10
    result resb 10

section .data
    msg db 'Enter an integer: ', 0
    result_msg db 'Result: ', 0
    newline db 10

section .text
    global _start

_start:
    mov eax, 1
    mov edi, 1
    mov rsi, msg
    mov edx, 18
    syscall

    mov eax, 0
    mov edi, 0
    mov rsi, num
    mov edx, 10
    syscall

    mov rsi, num
    call str_to_int

    mov rbx, rax
    imul rax, rax

    mov rsi, rax
    call int_to_str

    mov eax, 1
    mov edi, 1
    mov rsi, result_msg
    mov edx, 8
    syscall

    mov eax, 1
    mov edi, 1
    mov rsi, result
    mov edx, 10
    syscall

    mov eax, 1
    mov edi, 1
    mov rsi, newline
    mov edx, 1
    syscall

    mov eax, 60
    xor edi, edi
    syscall

str_to_int:
    xor rax, rax
    xor rcx, rcx
    mov cl, 10
.next_digit:
    movzx rdx, byte [rsi]
    test  rdx, rdx
    jz    .done
    sub   rdx, '0'
    imul  rax, rcx
    add   rax, rdx
    inc   rsi
    jmp   .next_digit
.done:
    ret

int_to_str:
    mov rbx, 10
    mov rdi, result
    mov rdx, 0
.convert_loop:
    xor rdx, rdx
    div rbx
    add dl, '0'
    mov [rdi], dl
    inc rdi
    test rax, rax
    jnz .convert_loop
    mov byte [rdi], 0
    mov rsi, rdi
    dec rsi
    call reverse_string
    ret

reverse_string:
    mov rdi, result
    mov rcx, rsi
    sub rcx, rdi
    shr rcx, 1
    mov rbx, rdi
    add rbx, rcx
    cmp rbx, rsi
    jae .done
.reverse_loop:
    mov al, [rdi]
    mov bl, [rbx]
    mov [rdi], bl
    mov [rbx], al
    inc rdi
    dec rbx
    cmp rdi, rbx
    jb .reverse_loop
.done:
    ret
