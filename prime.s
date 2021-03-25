global factorize
section .text 


factorize:

    push ebp ;prolog
    mov ebp, esp
    sub esp, 4 ; local variable for number
    
; save registers
    push edi
    push ebx
    push esi

    mov eax, [ebp+8]    ; number
    mov edi, [ebp+12]   ; call C

; move first divisor
    mov ebx, 2
; process of factorization
    _next_divisor:
    xor edx, edx
    mov [ebp-4], eax ; save number
    div ebx
    cmp edx, 0
    je _process
    inc ebx      ; inc_divisor
    mov eax, [ebp-4] ; pop number
    jmp _next_del

    _process:
    mov [ebp-4], eax  ; save number
    push ebx        ; process divisor
    call edi        
    add esp, 4 ; (push ebx, 4 remove top 4 bytes from stack)
    mov eax, [ebp-4] ; pop number
    cmp eax, 1   ; if number == 1 then stop
    je _return0
    jmp _next_divisor

    _return0:
    mov eax, 0
; return value registers
    pop ebx
    pop edi

; remove stack frame
    mov esp, ebp
    pop ebp 
    ret 
