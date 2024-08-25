section .data
    msg db 'xxx', 0      ; Define the string to print, null-terminated

section .text
    global _start        ; Entry point for the linker

_start:
    ; Write "Aji" to stdout
    mov eax, 1           ; syscall number for write (1)
    mov edi, 1           ; file descriptor 1 (stdout)
    mov rsi, msg         ; address of the string to print
    mov edx, 3           ; length of the string ("Aji" is 3 characters)
    syscall              ; make the syscall

    ; Exit the program
    mov eax, 60          ; syscall number for exit (60)
    xor edi, edi         ; status code 0
    syscall              ; make the syscall
