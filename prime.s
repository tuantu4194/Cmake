global factorization

section .text
factorization:
    push ebp ;prolog
    mov ebp, esp

    push ebx
    push esi
    push edi

    mov eax, [ebp+8] ;number
    mov edi, [ebp+12] ;callback 
    mov ebx, 2 ;factor

_factor:
    cmp eax, 1 ;div until eax= 1
    je .exit

    mov esi, eax
    xor edx, edx
    div ebx ; / 2 

    cmp edx, 0 
    jne .update_factor

    mov esi, eax
    push eax  
    push ebx
    call edi ;callback if the factor is correct
    add esp, 8 ; (because push eax, ebx,  remove the top 8 bytes from the stack.)
    mov ebx, 2
    mov eax, esi
    jmp _factor

    .update_factor:
        mov eax, esi
        add ebx, 1
        jmp _factor

    .exit:
    pop edi ;epilog and exit from function
    pop esi
    pop ebx

    mov esp, ebp
    pop ebp
    ret
