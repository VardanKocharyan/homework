extern printf
extern scanf

section .data
	scanf_format db "%d" , 0
	max_printf_format db "Maximum element is %d" , 10 , 0

section .bss
	arr resd 10
	max_elem resd 1

section .text
global main

main:
	push rbp
	mov rbp , rbp

	mov rbx , 0
L1:
	cmp rbx , 10
	jge L1_END
	mov rdi , scanf_format
	lea rsi , [arr + 4 * rbx]
	call scanf

	inc rbx
	jmp L1

L1_END:
	xor rax , rax
	mov eax , [arr]
	mov rbx , 1
L2:
	cmp rbx , 10 
	jge L2_END

	cmp eax , [arr + 4 * rbx ]
	jl ASSIGN
	inc rbx
	jmp L2
ASSIGN:
	mov eax , [arr +4 * rbx]
	inc rbx
	jmp L2

L2_END:

	mov rdi ,max_printf_format
	movsx rsi , eax
	xor rax , rax
	call printf
	jmp exit

exit:
	mov rsp , rbp
	pop rbp
ret	
