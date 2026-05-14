	.file	"project3.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "incorrect usage.\12 proper use: ./%S <file_name>\0"
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
	.text
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
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movl	%ecx, %esi
	movq	%rdx, %rbx
	call	__main
	cmpl	$2, %esi
	jne	.L16
.L2:
	movq	8(%rbx), %rcx
	leaq	.LC1(%rip), %rdx
	call	fopen
	movq	%rax, %r14
	movl	$0, %r13d
	leaq	.LC5(%rip), %r12
	movq	__imp_isprint(%rip), %rbp
	testq	%rax, %rax
	jne	.L3
	leaq	.LC2(%rip), %rcx
	call	printf
.L4:
	movl	$0, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L16:
	leaq	.LC0(%rip), %rcx
	call	printf
	jmp	.L2
.L5:
	movq	%r12, %rcx
	call	printf
.L6:
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.L17
.L7:
	cmpq	%rsi, %rbx
	jnb	.L5
	movzbl	(%rbx,%r15), %edx
	movq	%rdi, %rcx
	call	printf
	jmp	.L6
.L17:
	leaq	.LC6(%rip), %rcx
	call	printf
	leaq	32(%rsp), %rbx
	leaq	(%rbx,%rsi), %r15
	jmp	.L10
.L8:
	movl	$46, %ecx
	call	putchar
.L9:
	addq	$1, %rbx
	cmpq	%r15, %rbx
	je	.L18
.L10:
	movzbl	(%rbx), %edi
	movl	%edi, %ecx
	call	*%rbp
	testl	%eax, %eax
	je	.L8
	movl	%edi, %ecx
	call	putchar
	jmp	.L9
.L18:
	leaq	.LC7(%rip), %rcx
	call	puts
	addl	%esi, %r13d
.L3:
	leaq	32(%rsp), %rcx
	movq	%r14, %r9
	movl	$16, %r8d
	movl	$1, %edx
	call	fread
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L4
	movl	%r13d, %edx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$0, %ebx
	leaq	32(%rsp), %r15
	leaq	.LC4(%rip), %rdi
	jmp	.L7
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev2, Built by MSYS2 project) 14.2.0"
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
