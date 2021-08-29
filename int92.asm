DATAS SEGMENT
    dw 0,0  
DATAS ENDS

STACKS SEGMENT
    db 128 dup(0)
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV AX,STACKS
    MOV SS,AX
    MOV SP,128
    ;初始化完毕
    MOV AX,0
    MOV ES,AX
    PUSH ES:[9*4]
    POP DS:[0]
    PUSH ES:[9*4+2]
    POP DS:[2]
    ;保存原中断程序的ip 和cs
    mov word ptr es:[9*4],offset int9
    mov word ptr es:[9*4+2],CODES
    mov ax,0b800h
    mov es,ax
    mov al,'a'
    mov es:[160*12+2*40],al
    call delay
    mov ax,4c00h
    int 21h
delay:
	push ax
	push dx
	mov dx,1000h
	mov ax,0
S1:	sub ax,1
 	sbb dx,0
   	cmp ax,0
   	jne S1
   	cmp dx,0
   	jne S1
   	pop dx
   	pop ax
   	ret
int9:
	push ax
	push bx
	push dx
	push es
	in al,60h
	pushf
	pushf
	pop bx
	and bh,11111100b
	push bx
	popf
	call dword ptr ds:[0]
	
	cmp al,9eh
	jne ok
	mov si,0
	mov cx,2000
  S:mov ax,0b800h
    mov es,ax
    mov al,'a'
    mov es:[si],al
    mov ah,2
    mov es:[si+1],ah
    add si,2
    loop S
ok:pop es
	pop dx
	pop bx
	pop ax
	iret
CODES ENDS
    END START
