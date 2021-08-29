DATAS SEGMENT
    ;此处输入数据段代码  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    mov al,0eh
    call showbyte
    MOV AH,4CH
    INT 21H
    
    
    
showbyte proc
	jmp short startshow
	table db '0123456789ABCDF'
startshow:
	push bx
	push cx
	push es

	mov dx,0b800h
	mov es,dx
	
	mov ah,al
	mov cx,0
	mov cl,4
	shr ah,cl
	and al,00001111b
	
	mov bl,ah
	mov bh,0
	mov ch,table[bx]
	mov es:[160*12+40*2],ch
	
	mov bl,al
	mov ch,table[bx]
	mov es:[160*12+40*2+2],ch
	
	pop es
	pop cx
	pop bx
	ret
showbyte endp

CODES ENDS
    END START
