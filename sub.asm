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
    
    MOV AH,4CH
    INT 21H
    
sub1 proc near
	push bx
	push cx
	push es
	mov bx,0b800h
	mov es,bx
	mov bx,0
	mov cx,2000
	sub1s:
	mov byte ptr es:[bx],''
	add bx,2
	loop sub1s
	pop es
	pop cx
	pop bx
	ret
sub1 endp

sub2 proc near
	push bx
	push cx
	push es
	mov bx,0b800h
	mov es,bx
	mov bx,1
	mov cx,2000
	sub2s:
	and byte ptr es:[bx],11111000b
	or es:[bx],al
	add bx,2
	loop sub2s
	
	pop es
	pop cx
	pop bx
	ret
sub2 endp

sub3 proc near
	push bx
	push cx
	push es
	mov cl,4
	shl al,cl
	mov bx,0b800h
	mov es,bx
	mov bx,1
	mov cx,2000
	sub3s:
	and byte ptr es:[bx],10001111b
	or es:[bx],al
	add bx,2
	loop sub3s
	
	pop es
	pop cx
	pop bx
	ret 
sub3 endp 
 
	
CODES ENDS
    END START
