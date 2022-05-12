bits 64

section .data

    extern g_arr_32
    extern g_arr_64
    extern g_arr_positive
    extern g_arr_negative

section .text

global separate
separate:
    enter 0,0
    
    ;přesun z g_arr_32 
    movsx rax, dword [g_arr_32]
    movsx rbx, dword [g_arr_32 + 1 * 4]
    movsx rcx, dword [g_arr_32 + 2 * 4]
    movsx rdx, dword [g_arr_32 + 3 * 4]
    
    mov [g_arr_positive], rax
    mov [g_arr_positive + 1 * 8], rbx
    mov [g_arr_negative + 2 * 8], rcx
    mov [g_arr_negative + 3 * 8], rdx

    ;přesun z g_arr_64
    movsx rax, dword [g_arr_64]
    movsx rbx, dword [g_arr_64 + 1 * 8]
    movsx rcx, dword [g_arr_64 + 2 * 8]
    movsx rdx, dword [g_arr_64 + 3 * 8]
    
    mov [g_arr_negative], rax
    mov [g_arr_negative + 1 * 8], rbx
    mov [g_arr_positive + 2 * 8], rcx
    mov [g_arr_positive + 3 * 8], rdx

    leave
    ret

global swap
swap:
    enter 0,0

    mov rax, [g_arr_positive + 2 * 8]
    mov rbx, [g_arr_positive + 3 * 8]

    mov [g_arr_positive + 2 * 8], rbx
    mov [g_arr_positive + 3 * 8], rax


    leave
    ret