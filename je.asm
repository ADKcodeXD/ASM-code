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
   	mov ah,50
   	mov bh,25
   	cmp ah,bh
   	je a
   	jne b
   a:
   add ah,ah
   mov ah,4ch
   int 21h
   b:
   add ah,bh
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
