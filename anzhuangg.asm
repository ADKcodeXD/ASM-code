CODES SEGMENT
    ASSUME CS:CODES
START:
    MOV AX,CODES
    MOV DS,AX
    MOV AX,0
    MOV ES,AX
    mov si,offset do0
    mov di,200h
    mov cx,offset do0end-offset do0 
    cld
    rep movsb
    MOV AH,4CH
    mov ax,0
    mov es,ax
    mov word ptr es:[0],200h
    mov word ptr es:[2],0
    mov ah,4ch
    INT 21H
    
    
do0:jmp short do0start
	db 'weclome to masm!'
do0start:
	mov ax,cs
	mov ds,ax
	mov si,202h
	mov ax,0b800h
	mov es,ax
	mov di,12*160+36*2
	mov cx,16
S:
	mov al,[si]
	mov es:[di],al
	mov al,2
	mov es:[di+1],al
	add di,2
	inc si
	loop S
do0end:
	nop
CODES ENDS
    END START
