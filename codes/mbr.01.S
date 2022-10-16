    SECTION MBR vstart=0x7c00
    mov     ax, cs
    mov     ds, ax
    mov     es, ax
    mov     ss, ax
    mov     fs, ax
    mov     sp, 0x7c00
    mov     ax, 0xb800
    mov     gs, ax

    mov ax, 0600h
    mov bx, 0700h
    mov cx, 0
    mov dx, 184fh
    int 10h

    mov byte [gs:0x00], 'R'
    mov byte [gs:0x01], 0xA4
    mov byte [gs:0x02], 'T'
    mov byte [gs:0x03], 0xA4
    mov byte [gs:0x04], 'F'
    mov byte [gs:0x05], 0xA4
    mov byte [gs:0x06], 'S'
    mov byte [gs:0x07], 0xA4
    mov byte [gs:0x08], 'C'
    mov byte [gs:0x09], 0xA4
    mov byte [gs:0x0A], '-'
    mov byte [gs:0x0B], 0xA4
    mov byte [gs:0x0C], 'L'
    mov byte [gs:0x0D], 0xA4
    mov byte [gs:0x0E], 'i'
    mov byte [gs:0x0F], 0xA4
    mov byte [gs:0x10], 'n'
    mov byte [gs:0x11], 0xA4
    mov byte [gs:0x12], 'u'
    mov byte [gs:0x13], 0xA4
    mov byte [gs:0x14], 'x'
    mov byte [gs:0x15], 0xA4
    mov byte [gs:0x16], '0'
    mov byte [gs:0x17], 0xA4
    mov byte [gs:0x18], '.'
    mov byte [gs:0x19], 0xA4
    mov byte [gs:0x1A], '1'
    mov byte [gs:0x1B], 0xA4
    mov byte [gs:0x1C], '2'
    mov byte [gs:0x1D], 0xA4

    jmp $

times 510-($-$$) db 0
db    0x55, 0xaa
