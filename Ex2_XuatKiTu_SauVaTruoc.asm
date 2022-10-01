%include "io.inc"

section .data
    tb1 db "Nhap mot ky tu: ", 0
    tb2 db "Ky tu lien truoc: %s", 0
    tb3 db 10, "Ky tu lien sau: %s",10, 0
    fmt db "%s", 0
section .bss
    ky_tu resb 1

section .text
extern _printf
extern _scanf
extern _getch
global CMAIN
CMAIN:
    ; In tb1: Nhap ki tu
    push tb1
    call _printf
    add esp, 4
    
    ; Nhap vao ky tu
    push ky_tu
    push fmt
    call _scanf
    add esp, 4
    
    ; In tb2 va ky tu phia truoc ky_tu
    mov eax, [ky_tu]
    sub eax, 1
    mov [ky_tu], eax
    push ky_tu
    push tb2
    call _printf
    add esp, 8
        
    
    ; In tb3 va ky tu phia sau ky_tu
    mov eax, [ky_tu]
    add eax, 2
    mov [ky_tu], eax
    push ky_tu
    push tb3
    call _printf
    add esp, 8
    
    call _getch   
    xor eax, eax
    ret