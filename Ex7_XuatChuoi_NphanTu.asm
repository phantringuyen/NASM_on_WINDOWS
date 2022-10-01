%include "io.inc"
CEXTERN _getch

section .data
    tb1 db "Nhap N: ", 0
    tb2 db "Nhap mang cac so nguyen: ", 0
    tb3 db "Mang vua nhap: ", 0
    tb4 db 10," ---END---",10,0
    fmats db "%s", 0
    fmatd db "%d", 0
    fmatdp db "%d ", 0

section .bss
n resd 1
arr resd 100

section .text
global CMAIN
CMAIN:
    push tb1
    call _printf
    add esp, 4

    push n
    push fmatd
    call _scanf
    add esp, 8
    
    push tb2
    call _printf
    add esp, 4
    
    mov ebx, arr
    mov esi, 0
    
main.loop:
    push ebx
    push fmatd
    call _scanf
    add esp, 8
   
    add ebx, 4
    inc esi
    
    cmp esi, [n]
    jl main.loop
    
    push tb3
    call _printf
    add esp, 4
    
    mov ebx, arr
    mov esi, 0
    
main.loop2:
    push dword[ebx]
    push fmatdp
    call _printf
    add esp, 8
   
    add ebx, 4
    inc esi
    
    cmp esi, [n]
    jl main.loop2
    
    ; Ket thuc bai toan
    push tb4
    call _printf
    add esp, 4
    
    call _getch
    xor eax, eax
    ret