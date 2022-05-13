bits 64

section .data

    extern g_arr_32
    extern g_arr_64
    extern g_arr_positive
    extern g_arr_negative

    extern g_greeting_code
    extern g_greeting_text
    extern g_index_a
    extern g_index_b

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

        ;prohození prvků v g_arr_positive
        mov rax, [g_arr_positive + 2 * 8]
        mov rbx, [g_arr_positive + 3 * 8]
        mov [g_arr_positive + 2 * 8], rbx
        mov [g_arr_positive + 3 * 8], rax

        ;prohození prvků v g_arr_negative
        mov rax, [g_arr_negative]
        mov rbx, [g_arr_negative + 8]
        mov [g_arr_negative + 8], rax
        mov [g_arr_negative], rbx

    leave
    ret


global decode
decode:
    enter 0,0

        ;decode
        mov ax, [g_greeting_code]
        mov bx, [g_greeting_code + 2]
        mov cx, [g_greeting_code + 4]
        
        mov [g_greeting_text], ah
        mov [g_greeting_text + 1], al

        mov [g_greeting_text + 2], bh
        mov [g_greeting_text + 3], bl

        mov [g_greeting_text + 4], ch
        mov [g_greeting_text + 5], cl 

    leave
    ret

global swap_index
swap_index:
    enter 0,0
        mov rax, [g_index_a]
        mov rbx, [g_index_b]
        mov cl,  [g_greeting_text + rax]
        mov ch,  [g_greeting_text + rbx]
        mov [g_greeting_text + rax], ch
        mov [g_greeting_text + rbx], cl

    leave
    ret
    