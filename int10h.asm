DATAS SEGMENT
	db 9,8,7,4,2,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,'$'
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
	mov ax,DATAS
	mov ds,ax
	mov ax,0
    mov ah,2
    mov bh,0
    mov dh,5
    mov dl,12
    int 10h
    mov si,0
    mov di,6
    mov cx,6
print:mov al,[si]
    out 70h,al
    in al,71h
    call  BCD
    inc si
    loop print
    mov dx,6
    mov ah,9
  	int 21h
    mov ax,4c00h
    int 21h
    
BCD:
	push dx
	push cx
	mov cl,4
	mov dl,al
	shr	al,cl
	add al,30h
	mov [di],al
	mov al,dl
	shl al,cl
	shr al,cl
	add al,30h
	mov [di+1],al
	add di,2
	pop cx
	pop dx
	ret
	
CODES ENDS
    END START
