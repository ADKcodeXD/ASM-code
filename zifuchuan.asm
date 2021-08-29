DATAS SEGMENT
    db 100 dup(?) 
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    mov cx,1000
    mov dh,12
    mov dl,10
  S1:mov ah,0
    int 16h
    cmp al,8
    je back
    mov ah,0
    call charstack
    mov ah,2
    call charstack
    
   back:
   	mov ah,1
    call charstack
    mov ah,2
    call charstack
  	loop S1
    MOV AH,4CH
    INT 21H
charstack proc
	jmp short charstart
	table dw charpush,charpop,charshow
	top dw 0
charstart:
	push bx
	push dx
	push di
	push es
	cmp ah,2
	ja charend
	mov bl,ah
	mov bh,0
	add bx,bx
	jmp word ptr table[bx]
charpush:
	mov bx,top
	mov [si][bx],al
	inc top
	jmp charend
charpop:
	cmp top,0
	je charend
	dec top
	mov bx,top
	mov al,[si][bx]
	jmp charend
charshow:
	mov bx,0b800h
	mov es,bx
	mov al,160
	mov ah,0
	mul dh
	mov di,ax
	add dl,dl
	mov dh,0
	add di,dx
	
	mov bx,0
	mov cx,top
	S:
	mov al,[si][bx]
	inc bx
	mov es:[di],al
	loop S
	jmp charend

charend:
	pop es
	pop di
	pop dx
	pop bx
	ret   
charstack endp
CODES ENDS
    END START
