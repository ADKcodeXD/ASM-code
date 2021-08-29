DATAS SEGMENT
    db 16 dup(80)
    db 16 dup(?)
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    mov es,ax
    mov di,16
    mov si,0
    mov cx,16
    cld
    rep movsb
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
