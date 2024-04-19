org 0x7C00
bits 16

mov [BOOT], dl

; set up segment pointers
mov ax, 0
mov es, ax
mov ds, ax
mov bp, 0x7C00
mov sp, bp

; load the next sector
mov ah, 2
mov al, 1
mov bx, 0x7E00
mov ch, 0
mov cl, 2
mov dh, 0
mov dl, [BOOT]
int 0x13

; print out the first character in the next sector
mov ah, 0x0E
mov al, [0x7E00]
int 0x10
jmp $

BOOT: db 0

times 510-($-$$) db 0
dw 0xaa55