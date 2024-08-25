section .data
    a dd 3              ; define variable a = 3
    b dd 4              ; define variable b = 4
    result dd 0         ; space for the result

section .text
    global _start       ; entry point for the linker

_start:
    ; Load the values of a and b into registers
    mov eax, [a]        ; move value of a into eax
    mov ebx, [b]        ; move value of b into ebx

    ; Perform multiplication (eax = eax * ebx)
    mul ebx             ; result is stored in eax

    ; Store the result back into the result variable
    mov [result], eax

    ; Exit the program
    mov eax, 60         ; syscall number for exit (in 64-bit systems)
    xor edi, edi        ; status code 0
    syscall
