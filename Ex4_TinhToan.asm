%include "io.inc"

section .data
    tb1 db "Nhap so thu nhat: ", 0
    tb2 db "Nhap so thu hai: ", 0
    tb3 db "Tong: %d",10, 0
    tb4 db  "Hieu: %d",10, 0
    tb5 db  "Tich: %d",10, 0
    tb6 db  "Thuong: %d", 0
    tb7 db " du %d",10, 0
    end db " ----END----",10,0
    fmt db "%d", 0 
section .bss
    a resd 1
    b resd 1
    kq resd 1
    thuong resd 1
    du resd 1
    
section .text
extern _printf
extern _scanf
extern _getch
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ; In tb1: 'Nhap a'
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
    
    ; Tinh tong
    mov eax, [a]
    add eax, [b]
    mov [kq], eax
    ; xuat
    push dword[kq]
    push tb3
    call _printf
    add esp, 8
    
    ; Tinh hieu
    mov eax, [a]
    sub eax, [b]
    mov [kq], eax
    ; xuat
    push dword[kq]
    push tb4
    call _printf
    add esp, 8
    
    ; Tinh tich
    mov eax, [a]
    mov bl, [b]
    mul bl
    mov [kq], eax
    ; xuat
    push dword[kq]
    push tb5
    call _printf
    add esp, 8
    
    ; Tinh thuong va phan du
    mov ax, [a]
    mov bl, [b]
    div bl
    mov [thuong], al
    mov [du], ah
    
    ; xuat thuong
    push dword[thuong]
    push tb6
    call _printf
    add esp, 20
    
    ; xuat phan du
        push dword[du]
    push tb7
        call _printf
    add esp, 20
    
    ; Ket thuc bai toan
    push end
        call _printf
    add esp, 20
    
    call _getch
    
    xor eax, eax
    ret