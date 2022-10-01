%include "io.inc"
extern _getch

section .data
    tb1 db "Nhap mot chuoi: ",0
    tb2 db "Chuoi vua nhap la:  %s",0
    fmt db "%s",0
section .bss
    ten resb 30
    
section .text
global CMAIN
CMAIN:
    ; Xuat tb1
    push tb1
    call _printf
    add esp,4
    
    
    ;Nhap chuoi
    ;scanf("%s",&ten)
    push ten
    push fmt
    call _scanf
    add esp,8
    
    ; xuat tb2
    ;printf("Chuoi vua nhap %s",ten);
    push ten
    push tb2
    call _printf
    add esp,8
    
    call _getch
    
    xor eax, eax
    ret