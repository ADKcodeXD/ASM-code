DATAS SEGMENT
    a db 'asadsa' 
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    mov ax,0b800h
    mov es,ax
    mov si,0
    mov bx,0
    mov cx,6
    S2:
    mov al,[bx]
    mov es:[si+160*12],al
    add si,2
    inc bx
    loop S2
    mov cx,5
    S3:mov ah,0
    int 16h
    call change
    loop S3
    mov ax,4c00h
    int 21h
change proc
	push es
	push bx
	push cx
	mov ah,1
	cmp al,'r'
	je r
	cmp al,'g'
	je g
	cmp al,'b'
	je b
	r:mov ah,4
	call changecolor
	jmp short ok
	g:mov ah,2
	call changecolor
	jmp short ok
	b:
	call changecolor
	jmp short ok
changecolor:
	mov bx,0b800h
	mov es,bx
	mov si,1
	mov cx,2000
	S:
	and byte ptr es:[si],11111000b
	or es:[si],ah
	add si,2
	loop S
	ret
ok:pop cx
	pop bx
	pop es
	ret
change endp
	
CODES ENDS
    END START
