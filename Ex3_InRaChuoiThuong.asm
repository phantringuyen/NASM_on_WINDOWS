%include "io.inc"

section .data
    tb1 db "Nhap mot ky tu: ", 0
    tb2 db "Ky tu thuong: ", 0
    tb3 db "Day la ky tu thuong hoac ky tu dac biet",10, 0
    fmt db "%s", 0
section .bss
    ky_tu resb 1

section .text
extern _printf
extern _scanf
extern _getch
global CMAIN
CMAIN:
    ; In str1
    push tb1
    call _printf
    add esp, 4
    
    ; Nhap ky_tu
    push ky_tu
    push fmt
    call _scanf
    add esp, 4
    
    ; Kiem tra neu ky_tu co phai chu viet hoa
    ; Neu ky_tu < 65 va ky_tu > 90, chuyen sang Exception
    mov eax, [ky_tu]
    cmp eax, 90
    jg Exception
    cmp eax, 65
    jl Exception
    
    ; In tb2
    push tb2
    call _printf
    add esp, 4
    
    ; Chuyen ky_tu tu chu viet hoa thanh chu viet thuong va in ra
    mov eax, [ky_tu]
    add eax, 32
    mov [ky_tu], eax
    push ky_tu
    push fmt
    call _printf
    add esp, 8
    call _getch
    
    xor eax, eax
    ret
    
Exception:
    ; In tb3
    push tb3
    call _printf
    add esp, 4
    
    call _getch