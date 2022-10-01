%include "io.inc"
CEXTERN _getch

section .data
    tb1 db "Nhap vao mot chuoi: ", 0
    tb2 db "In ra chuoi nguoc : ", 0
    tb3 db 10," ---END---",10,0
    fmatd db "%d", 0

section .bss
    istr resb 60
    arr resb 60

section .text
global CMAIN
CMAIN:
    push tb1
    call _printf
    add esp, 4
    
    GET_STRING istr, 50
    
    mov esi, 0
    mov ebx, istr
strlen.loop:
    inc ebx
    inc esi
    cmp byte[ebx], 0
    jne  strlen.loop
    
    mov ebx, istr
    mov edx, arr
    
main.loop:
    mov eax, [ebx + esi - 2]
    mov [edx], eax
    
    inc edx
    dec esi
    cmp esi, 0
    jne main.loop
    
    push tb2
    call _printf
    add esp, 4
    
    mov edx, arr
    
    push edx
    call _printf
    add esp, 4
    
    ; Ket thuc bai toan
        push tb3
    call _printf
    add esp, 4
    
    call _getch
    xor eax, eax
    ret