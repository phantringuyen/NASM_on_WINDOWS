%include "io.inc"
CEXTERN _getch

section .data
    tb1 db "Nhap mot so: ", 0
    tb2 db "Tong tu 1 den ", 0
    tb3 db " la: ", 0
    tb4 db 10," ---END---",10,0
    strFmat db "%s%d%s%d", 0
    fmatd db "%d", 0

section .bss
    n resd 1

section .text
global CMAIN
CMAIN:
    push tb1
    call _printf
    add esp, 4
    
    push n
    push fmatd
    call _scanf
    
    mov eax, 0
    mov ebx, 1
    mov ecx, [n]
main.loop:
    
    add eax, ebx
    inc ebx
    cmp ebx, ecx
    jng main.loop
    
    push eax
    push tb3
    push ecx
    push tb2
    push strFmat
    call _printf
    add esp, 16
    
    ; Ket thuc bai toan
        push tb4
    call _printf
    add esp, 4
    
    xor eax, eax
    ret