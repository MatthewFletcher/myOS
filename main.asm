[org 0x7c00]
[bits 16]

section .text 

    global main


main:

cli
jmp 0x0000:ZeroSeg
ZeroSeg:
    xor ax, ax
    mov ss, ax
    mov ds, ax 
    mov es, ax 
    mov fs, ax 
    mov gs, ax 
    mov sp, main
    cld 
sti 

push ax
xor ax, ax 
int 0x13
pop ax 


mov al, 1
mov cl, 2
call readDisk
jmp test

jmp $ ; infinite loop


%include "./readDisk.asm"
%include "./printf.asm"
%include "./printh.asm"
    

STR: db "Hello, world!", 0x0a, 0x0d,0

test_str: db "2nd sector", 0x0a, 0x0d, 0

times 510-($-$$) db 0
dw 0xaa55

test:
mov si, test_str
call printf

times 512 db 0
