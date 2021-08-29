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
    mov ax,STACKS
    mov ss,ax
    mov sp,128
    mov ax,0
    
    mov es,ax
    push es:[9*4]
    pop ds:[0]
    push es:[9*4+2]
    pop ds:[2]
    
    mov word ptr es:[9*4],offset int9
   	mov es:[9*4+2],CODES
   	
   	mov ax,0b800h
   	mov es,ax
   	mov ah,'a'
   	
   S:mov es:[160*12+40*2],ah
   	call delay
   	inc ah
   	cmp ah,'z'
   	jna s
   	mov ax,4c00h
   	int 21h
   	
delay:
	push ax
	push dx
	mov dx,1h
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
	push es
	in al,60h
	pushf
	pushf ;这是第二次 需要修改当前IF TF
	pop bx
	and bh,11111100b; 修改成功
	push bx;推进去 
	popf;修改当前标志寄存器值
	call dword ptr ds:[0];调用原来的int9
	
	cmp al,1
	jne int9ret
	
	mov ax,0b800h
	mov es,ax
	mov cx,2000
	
	inc byte ptr es:[160*12+40*2+1]
int9ret:
	pop es
	pop bx
	pop ax
	iret
CODES ENDS
    END START
