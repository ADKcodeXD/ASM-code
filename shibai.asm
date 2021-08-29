DATAS SEGMENT
    dw 123,12666,1,8,3,38 
DATAS ENDS

STACKS SEGMENT
    db 8 dup(0)
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    mov ax,STACKS
    mov ss,ax
    mov sp,8
    MOV BX,0
    MOV AX,[BX]
    mov cx,6
    S:CALL DTOC
    pop ax
    
dtoc:
	DIV 2
	MOV CL,AH
	PUSH AL
	JCXZ A
	JMP short dtoc
A:	ret
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
