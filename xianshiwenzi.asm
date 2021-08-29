DATAS SEGMENT
    db 'welcome to masm!',0  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    mov dh,12
    mov dl,18
    mov cl,00001010b
    mov si,0
    call show_str
    MOV AH,4CH
    INT 21H
show_str:
	mov ax,0B800H
	mov es,ax
	mov al,dh
	mov ah,80
	mul ah
	mov si,ax
	mov dh,0
	add si,dx
	mov di,0
	call loops
	ret
loops:
	mov dl,cl
	mov ch,0
	mov cl,[di]
	jcxz A
	mov ah,[di] 
	mov es:[si],ah
	mov es:[si+1],dl
	inc di
	add si,2
	jmp short loops
   A:ret
    
CODES ENDS
    END START

