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
    mov bx,1000h
    add bx,0f000h
    mov ax,20h
    adc ax,1eh
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
