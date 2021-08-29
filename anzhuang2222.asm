CODES SEGMENT
    ASSUME CS:CODES
START:
    MOV AX,CODES
    MOV DS,AX
    mov si,offset capi
    mov ax,0
    mov di,200h
    mov es,ax
    mov cx,offset capiend-offset capi
    cld
    rep movsb
    mov word ptr es:[7ch*4],200h
    mov word ptr es:[7ch*4+2],0 
    mov ax,4c00h
    int 21h
capi:
	push cx
	push si
change:
	mov cl,[si]
	mov ch,0
	jcxz ok
	and byte ptr [si],11011111b
	inc si
	jmp short change
ok:
	pop si
	pop cx
	iret
capiend:
	nop
CODES ENDS
    END START
