DATAS SEGMENT
    db 88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h
    db 88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    mov si,0
    mov di,16
    call add128
    MOV AH,4CH
    INT 21H
    
add128:
	push ax
	push cx
	push si
	push di
	
	sub ax,ax
	mov cx,8
  S:mov ax,[si]
  	adc ax,[di]
  	mov [si],ax
  	inc si
  	inc si
  	inc di
  	inc di
  	loop s
  	ret
	
CODES ENDS
    END START
