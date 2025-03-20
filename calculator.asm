extern printf 
extern scanf

section .data 
	error_form db "error",0
	error_lenght db 5
	scanf_form db "%d" , 0	
	printf_form db "The number is %d" ,10,0

section .bss 

section .text
global main
main:
	push rbp
	mov rbp , rsp
	sub rsp , 16
	
	xor rax , rax
	xor rbx , rbx 
	xor rcx , rcx 

	mov rdi , scanf_form
	lea rsi , [rbp - 4]
	call scanf

	mov rdi , scanf_form
        lea rsi , [rbp - 8]
        call scanf

	mov rdi , scanf_form
        lea rsi , [rbp - 12]
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
	
	jmp ERROR


ADD:
	add eax , ebx 
	mov rdi , printf_form
	mov rsi , rax 
	xor rax , rax
	call printf
	jmp exit 

SUB:
        sub eax , ebx
        mov rdi , printf_form
        mov rsi , rax
        xor rax , rax
	call printf
        jmp exit

MUL:
	mul ebx

	mov rdi , printf_form
        mov rsi , rax
        xor rax , rax
	call printf
        jmp exit

DIV:
	cmp ebx , 0
	je ERROR

	div ebx
	
	mov rdi , printf_form
        mov rsi , rax
        xor rax , rax
	call printf
        jmp exit

ERROR:
	mov rdi , error_form 
	mov rsi , error_lenght
	call printf
	jmp exit

exit:
	mov rsp , rbp
	pop rbp

ret
