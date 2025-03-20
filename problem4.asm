extern printf 
extern scanf

section .data
	printf_form db "number is %d",10,0
	scanf_form db " %d",0
	scn1 db "fisrt number is ",0
	scn2 db "second number is ",0
	scn3 db "(1=add , 2=sub , 3=mul , 4=div) aricthmetic is ",0
	error_form db "error",0
	error_lenght db 5
section .bss

section .text
global main 
main:

	push rbp
	mov rbp , rsp
	sub rsp , 16

	xor rax , rax 
	xor rbx , rcx
	xor rcx , rcx 

	mov rdi , scanf_form
	mov rsi , [rbp - 4]
	call scanf

        mov rdi , scanf_form
        mov rsi , [rbp - 8]
        call scanf

        mov rdi , scanf_form
        mov rsi , [rbp - 12]
        call scanf

	mov eax , [rbp - 4]
	mov ebx , [rbp - 8]
	mov ecx , [rbp - 12]
	
	cmp ecx , 1
	je ADD

	cmp ecx , 2
        je SUB

        cmp ecx , 3
        je MUL

        cmp ecx , 4
        je DIV

        je ERROR

ADD:
	add eax , ebx 
	jmp exit
SUB:
	sub eax , ebx 
	jmp exit
MUL:
	mul ebx

	jmp exit
DIV:
	cmp ebx , 0
	je ERROR

	mul ebx 
	
	jmp exit

ERROR:
	mov rdi , error_form
	mov rsi , error_lenght
	jmp ret

exit:
	mov rdi , printf_form
	mov rsi , rax
	mov rax , 0
	jmp ret

ret:
	call printf

	mov rsp , rbp
	pop rbp
ret
