DATAS SEGMENT
    ;�˴��������ݶδ���  
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
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
