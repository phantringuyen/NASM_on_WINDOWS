%include "io.inc"
CEXTERN _getch

section .data
    tb1 db "Nhap vao mot ky tu: ", 0
    tb2 db "Ky tu ", 0
    tb3 db " la so",10, 0
    tb4 db " la chu thuong",10, 0
    tb5 db " la chu HOA",10, 0
    tb6 db " ---END--- ",10,0
    strFmat db "%s%c%s", 0
    fmatc db "%c", 0

section .bss
    chr resb 1

section .text
global CMAIN
CMAIN:
    push tb1
    call _printf
    add esp, 4

    push chr
    push fmatc
    call _scanf
    add esp, 8
    
    mov eax, [chr]
    cmp eax, '0'
    jnl check

check: 
    cmp eax, '9'
    jng end.num
    
    cmp eax, 'Z'
    jng end.upper
    
    cmp eax, 'z'
    jng end.lower
    
end.lower:
    push tb4
    push eax
    push tb2
    push strFmat
    call _printf
    add esp, 16
    
    jmp finish
    
end.upper:
    push tb5
    push eax
    push tb2
    push strFmat
    call _printf
    add esp, 16
    
    jmp finish

end.num:
    push tb3
    push eax
    push tb2
    push strFmat
    call _printf
    add esp, 16    

finish:
    ; Ket thuc bai toan
        push tb6
    call _printf
    add esp, 4
    
    call _getch
    xor eax, eax
    ret