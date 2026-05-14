	.file	"project3.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "incorrect usage.\12 proper use: %s <file_name>\0"
.LC1:
	.ascii "rb\0"
.LC2:
	.ascii "File Failed To Open\0"
.LC3:
	.ascii "%08x \0"
.LC4:
	.ascii "%02x \0"
.LC5:
	.ascii "   \0"
.LC6:
	.ascii " |\0"
.LC7:
	.ascii "|\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	movl	%ecx, %esi
	movq	%rdx, %rbx
	call	__main
	cmpl	$2, %esi
	je	.L2
	movq	(%rbx), %rdx
	leaq	.LC0(%rip), %rcx
	call	printf
.L2:
	movq	8(%rbx), %rcx
	leaq	.LC1(%rip), %rdx
	xorl	%r13d, %r13d
	leaq	48(%rsp), %rdi
	leaq	.LC5(%rip), %r12
	call	fopen
	movq	__imp_isprint(%rip), %rbp
	movq	%rax, 40(%rsp)
	testq	%rax, %rax
	je	.L20
	.p2align 4
	.p2align 3
.L3:
	movq	40(%rsp), %r9
	movl	$16, %r8d
	movl	$1, %edx
	movq	%rdi, %rcx
	call	fread
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L4
	movl	%r13d, %edx
	leaq	.LC3(%rip), %rcx
	xorl	%ebx, %ebx
	call	printf
	leaq	.LC4(%rip), %r15
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L22:
	movzbl	(%rdi,%rbx), %edx
	movq	%r15, %rcx
	addq	$1, %rbx
	call	printf
	cmpq	$16, %rbx
	je	.L21
.L7:
	cmpq	%rsi, %rbx
	jb	.L22
	movq	%r12, %rcx
	addq	$1, %rbx
	call	printf
	cmpq	$16, %rbx
	jne	.L7
.L21:
	leaq	.LC6(%rip), %rcx
	movq	%rdi, %rbx
	leaq	(%rdi,%rsi), %r15
	call	printf
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L24:
	movl	%r14d, %ecx
	addq	$1, %rbx
	call	putchar
	cmpq	%r15, %rbx
	je	.L23
.L10:
	movzbl	(%rbx), %r14d
	movl	%r14d, %ecx
	call	*%rbp
	testl	%eax, %eax
	jne	.L24
	movl	$46, %ecx
	addq	$1, %rbx
	call	putchar
	cmpq	%r15, %rbx
	jne	.L10
.L23:
	leaq	.LC7(%rip), %rcx
	addl	%esi, %r13d
	call	puts
	jmp	.L3
.L20:
	leaq	.LC2(%rip), %rcx
	call	printf
.L4:
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev2, Built by MSYS2 project) 14.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
