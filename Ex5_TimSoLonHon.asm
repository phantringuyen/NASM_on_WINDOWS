%include "io.inc"

section .data
    tb1 db "Nhap so thu nhat: ", 0
    tb2 db "Nhap so thu hai: ", 0
    tb3 db "So lon hon la: ", 0
    tb4 db 10," ---END---",10,0
    fmt db "%d", 0 
section .bss
    a resd 1
    b resd 1
    
section .text
extern _printf
extern _scanf
extern _getch
global CMAIN
CMAIN:
    mov ebp, esp;
    
    ; In tb1: 'nhap a'
    push tb1
    call _printf
    add esp, 4
    
    ; Nhap a
    push a
    push fmt
    call _scanf
    add esp, 8
    
    ; In tb2: 'Nhap b'
    push tb2
    call _printf
    add esp, 4
    
    ; Nhap b
    push b
    push fmt
    call _scanf
    add esp, 8
    
    ; In tb3
    push tb3
    call _printf
    add esp, 4
    
    ; Thuc hien phep so sanh a va b
    mov ax,[a]
    mov bx, [b]
    cmp ax, bx
    jge Latter
    
    ; xuat ra so lon hon
    push dword[b]
    push fmt
    call _printf
    add esp, 20
    
    ; Ket thuc bai toan
    push tb4
    call _printf
    add esp, 4
    
    call _getch
    xor eax, eax
    ret

Latter:
    push dword[a]
    push fmt
    call _printf
    add esp, 20
    
    call _getch