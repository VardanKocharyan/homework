extern printf 

section .data 
	txt db "Hello World" , 10 , 0

section .bss

section .text
global main 

main:

push rbp
mov rbp, rsp

mov rax, 0
mov rdi, txt
call printf

mov rsp, rbp
pop rbp

	ret

